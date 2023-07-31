<?php
include('config.php');

$id = $_POST['id'];

$sql = "DELETE FROM abudzar WHERE id='$id'";

if ($koneksi->query($sql) === TRUE) {
    echo "Data berhasil dihapus.";
} else {
    echo "Error deleting record: " . $koneksi->error;
}

$koneksi->close();
?>