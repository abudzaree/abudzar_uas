<?php
$host = 'localhost';
$user = 'root';
$pass = '';
$dbname = 'abudzar';

$koneksi = new mysqli($localhost, $root, $dbname);

if ($koneksi->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
?>