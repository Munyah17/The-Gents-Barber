<?php
// One-off: export the entire local DB to gents_db_export.sql for cPanel import.
require __DIR__ . '/api/config.php';
$pdo = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=utf8mb4', DB_USER, DB_PASS);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$out = fopen(__DIR__ . '/gents_db_export.sql', 'w');
fwrite($out, "-- The Gents Barber DB export " . date('Y-m-d H:i:s') . "\nSET NAMES utf8mb4;\nSET FOREIGN_KEY_CHECKS=0;\n\n");

foreach ($pdo->query('SHOW TABLES')->fetchAll(PDO::FETCH_COLUMN) as $t) {
    $create = $pdo->query("SHOW CREATE TABLE `$t`")->fetch(PDO::FETCH_ASSOC);
    fwrite($out, "DROP TABLE IF EXISTS `$t`;\n" . $create['Create Table'] . ";\n\n");
    $rows = $pdo->query("SELECT * FROM `$t`");
    $n = 0;
    while ($r = $rows->fetch(PDO::FETCH_NUM)) {
        $vals = array_map(fn($v) => $v === null ? 'NULL' : $pdo->quote((string)$v), $r);
        fwrite($out, "INSERT INTO `$t` VALUES (" . implode(',', $vals) . ");\n");
        $n++;
    }
    fwrite($out, "\n-- $t: $n rows\n\n");
    echo "$t: $n rows\n";
}
fwrite($out, "SET FOREIGN_KEY_CHECKS=1;\n");
fclose($out);
echo "done -> gents_db_export.sql\n";
