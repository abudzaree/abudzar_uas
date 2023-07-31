import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController modelController = TextEditingController();

  List<dynamic> users = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://127.0.0.1/read.php'));
    if (response.statusCode == 200) {
      setState(() {
        users = jsonDecode(response.body);
      });
    }
  }

  Future<void> addUser() async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1/create.php'),
      body: {
        'nama': nameController.text,
        'alamat': alamatController.text,
        'phone': phoneController.text,
        'model': modelController.text,
      },
    );
    print(response.body);
    fetchData();
  }

  Future<void> updateUser(dynamic user) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1/update.php'),
      body: {
        'id': user['id'].toString(),
        'nama': nameController.text,
        'alamat': alamatController.text,
        'phone': phoneController.text,
        'model': modelController.text,
      },
    );
    print(response.body);
    fetchData();
  }

  Future<void> deleteUser(dynamic user) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1/delete.php'),
      body: {
        'id': user['id'].toString(),
      },
    );
    print(response.body);
    fetchData();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pesanan'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: alamatController,
              decoration: InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  labelText: 'Nomor Handphone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: modelController,
              decoration: InputDecoration(
                  labelText: 'Model Rambut',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          ElevatedButton(
            onPressed: addUser,
            child: Text('Tambah'),
          ),
        ],
      ),
    );
  }
}
