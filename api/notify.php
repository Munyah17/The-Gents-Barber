<?php
// Booking email notices — new requests go to the company + client,
// status changes (approve/decline/complete/cancel) go to the client.
require_once __DIR__ . '/mailer.php';

// Diff stored vs new bookings → [['b'=>booking,'ev'=>'new'|'status','to'=>status]]
function bookingDiffs(array $stored, array $merged): array {
    $old = [];
    foreach (($stored['bookings'] ?? []) as $b) if (!empty($b['id'])) $old[$b['id']] = $b;
    $out = [];
    foreach (($merged['bookings'] ?? []) as $b) {
        $id = $b['id'] ?? '';
        if ($id === '') continue;
        if (!isset($old[$id])) {
            $out[] = ['b' => $b, 'ev' => 'new'];
        } elseif (($old[$id]['status'] ?? '') !== ($b['status'] ?? '')) {
            $out[] = ['b' => $b, 'ev' => 'status', 'from' => $old[$id]['status'] ?? '', 'to' => $b['status'] ?? ''];
        }
    }
    return $out;
}

// Diff stored vs new contacts → list of newly added contact messages.
function contactDiffs(array $stored, array $merged): array {
    $seen = [];
    foreach (($stored['contacts'] ?? []) as $c) $seen[json_encode($c)] = true;
    $out = [];
    foreach (($merged['contacts'] ?? []) as $c) {
        $k = json_encode($c);
        if (!isset($seen[$k])) $out[] = $c;
    }
    return $out;
}

// Email the company about new contact-form messages, and confirm to the sender.
function sendContactNotices(array $contacts): void {
    if (!$contacts) return;
    require_once __DIR__ . '/mailer.php';
    $company = defined('NOTIFY_EMAIL') && NOTIFY_EMAIL ? NOTIFY_EMAIL : (defined('SMTP_FROM') ? SMTP_FROM : '');
    $brand = "The Gents Cuts and Shaves";
    foreach ($contacts as $c) {
        $name = trim((string)($c['name'] ?? ''));
        $email = trim((string)($c['email'] ?? ''));
        $branch = trim((string)($c['branch'] ?? ''));
        $message = trim((string)($c['message'] ?? ''));
        $rows = '<table style="border-collapse:collapse;font-size:14px">'
            . '<tr><td style="padding:4px 14px 4px 0;color:#888">From</td><td><b>' . escH($name) . '</b>' . ($email ? ' &lt;' . escH($email) . '&gt;' : '') . '</td></tr>'
            . '<tr><td style="padding:4px 14px 4px 0;color:#888">Branch</td><td>' . escH($branch) . '</td></tr>'
            . '<tr><td style="padding:4px 14px 4px 0;color:#888">Message</td><td>' . nl2br(escH($message)) . '</td></tr>'
            . '</table>';
        if ($company) {
            $html = '<div style="font-family:Arial,sans-serif;max-width:560px">'
                . '<h2 style="color:#8a6d2f;margin:0 0 12px">New contact message</h2>' . $rows
                . '<p style="color:#888;font-size:12px;margin-top:18px">Sent via the website contact form.</p></div>';
            @sendMail($company, 'New contact message — ' . $brand, $html);
        }
        if ($email && filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $html = '<div style="font-family:Arial,sans-serif;max-width:560px">'
                . '<h2 style="color:#8a6d2f;margin:0 0 12px">We received your message</h2>'
                . '<p>Hi ' . escH($name) . ',</p>'
                . '<p>Thanks for reaching out to ' . escH($brand) . '. We\'ve received your message and will get back to you shortly.</p>'
                . '<p style="color:#888;font-size:12px">— The Gents team</p></div>';
            @sendMail($email, 'We received your message — ' . $brand, $html);
        }
    }
}

function escH($s): string { return htmlspecialchars((string)$s, ENT_QUOTES, 'UTF-8'); }

function bookingRows(array $b): string {
    return '<table style="border-collapse:collapse;font-size:14px">'
        . '<tr><td style="padding:4px 14px 4px 0;color:#888">Booking</td><td><b>' . escH($b['id'] ?? '') . '</b></td></tr>'
        . '<tr><td style="padding:4px 14px 4px 0;color:#888">Client</td><td>' . escH($b['name'] ?? '') . (isset($b['phone']) && $b['phone'] ? ' · ' . escH($b['phone']) : '') . '</td></tr>'
        . '<tr><td style="padding:4px 14px 4px 0;color:#888">Service</td><td>' . escH($b['service'] ?? '') . '</td></tr>'
        . '<tr><td style="padding:4px 14px 4px 0;color:#888">Barber</td><td>' . escH($b['barber'] ?? '') . '</td></tr>'
        . '<tr><td style="padding:4px 14px 4px 0;color:#888">Branch</td><td>' . escH($b['branch'] ?? '') . '</td></tr>'
        . '<tr><td style="padding:4px 14px 4px 0;color:#888">When</td><td>' . escH($b['date'] ?? '') . ' at ' . escH($b['time'] ?? '') . '</td></tr>'
        . '<tr><td style="padding:4px 14px 4px 0;color:#888">Status</td><td><b>' . escH($b['status'] ?? '') . '</b></td></tr>'
        . (isset($b['declineReason']) && $b['declineReason'] ? '<tr><td style="padding:4px 14px 4px 0;color:#888">Reason</td><td>' . escH($b['declineReason']) . '</td></tr>' : '')
        . '</table>';
}

function bookingShell(string $title, string $inner): string {
    return '<div style="font-family:Arial,sans-serif;max-width:560px;margin:0 auto">'
        . '<div style="background:#1a1a1a;padding:18px 24px;border-radius:8px 8px 0 0">'
        . '<span style="color:#d4af37;font-size:18px;font-weight:bold">The Gents Cuts and Shaves</span></div>'
        . '<div style="background:#fff;padding:24px;border:1px solid #eee">'
        . '<h2 style="margin:0 0 14px;font-size:18px;color:#222">' . escH($title) . '</h2>'
        . $inner
        . '<p style="color:#999;font-size:12px;margin-top:20px">The Gents Cuts and Shaves · Harare</p>'
        . '</div></div>';
}

// Send notices for a set of booking diffs. Silent on failure.
function sendBookingNotices(array $events): void {
    if (!$events) return;
    $d = loadData() ?: [];
    $settingsEmail = $d['settings']['email'] ?? '';
    $company = defined('NOTIFY_EMAIL') && NOTIFY_EMAIL ? NOTIFY_EMAIL : ($settingsEmail ?: SMTP_FROM);

    foreach ($events as $e) {
        $b = $e['b'];
        $clientEmail = trim((string)($b['email'] ?? $b['clientEmail'] ?? ''));

        if ($e['ev'] === 'new') {
            // Company: new request alert
            if ($company) {
                $html = bookingShell('New Booking Request',
                    '<p style="color:#444">A new appointment request needs your attention:</p>' . bookingRows($b)
                    . '<p style="margin-top:16px"><a href="' . escH(rtrim(defined('SITE_URL') ? SITE_URL : 'https://thegents.co.zw', '/')) . '/admin" style="background:#d4af37;color:#111;padding:10px 18px;border-radius:6px;text-decoration:none;font-weight:bold">Review in Admin → Requests</a></p>');
                sendMail($company, 'New booking request — ' . ($b['name'] ?? 'client') . ' (' . ($b['date'] ?? '') . ')', $html);
            }
            // Client: confirmation
            if ($clientEmail) {
                $html = bookingShell('Booking Received',
                    '<p style="color:#444">Hi ' . escH($b['name'] ?? 'there') . ', we received your appointment request:</p>' . bookingRows($b)
                    . '<p style="color:#444">We\'ll confirm your slot shortly. See you at The Gents.</p>');
                sendMail($clientEmail, 'Booking received — The Gents (' . ($b['date'] ?? '') . ' ' . ($b['time'] ?? '') . ')', $html);
            }
        } elseif ($e['ev'] === 'status' && $clientEmail) {
            // Client: status update
            $to = $e['to'];
            $titles = ['Confirmed' => 'Booking Confirmed', 'Completed' => 'Visit Completed', 'Cancelled' => 'Booking Cancelled', 'Declined' => 'Booking Declined'];
            $title = $titles[$to] ?? 'Booking Update';
            $msgs = [
                'Confirmed' => 'Good news — your appointment is confirmed.',
                'Completed' => 'Thanks for visiting The Gents — hope you loved the cut.',
                'Cancelled' => 'Your appointment has been cancelled.',
                'Declined' => 'Unfortunately we couldn\'t accommodate this request.'
            ];
            $html = bookingShell($title,
                '<p style="color:#444">Hi ' . escH($b['name'] ?? 'there') . ', ' . escH($msgs[$to] ?? 'your booking status changed to ' . $to . '.') . '</p>' . bookingRows($b));
            sendMail($clientEmail, $title . ' — The Gents (' . ($b['id'] ?? '') . ')', $html);
        }
    }
}
