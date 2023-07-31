<?php
include('config.php');

$id = $_POST['id'];
$name = $_POST['nama'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$model = $_POST['model'];

$sql = "UPDATE users SET nama='$nama', email='$email', phone='$phone' , model = '$model' WHERE id='$id'";

if ($koneksi->query($sql) === TRUE) {
    echo "Data berhasil diperbarui.";
} else {
    echo "Error updating record: " . $koneksi->error;
}

$koneksi->close();
?>
