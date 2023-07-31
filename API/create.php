<?php
include('config.php');

$name = $_POST['nama'];
$phone = $_POST['phone'];
$alamat = $_POST['alamat'];
$model = $_POST['model'];

$sql = "INSERT INTO users (nama, phone, alamat, jenis) VALUES ('$nama', '$alamat', '$phone','$model')";

if ($conn->query($sql) === TRUE) {
    echo "Data berhasil ditambahkan.";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
