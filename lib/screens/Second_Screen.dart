import 'package:flutter/material.dart';
import 'package:http_request/Service/User_Services.dart';
import 'package:http_request/models/User_Model.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<UserModel> users = [];

  getMyUsers() async {
    users = await UserServices().getUser();
    setState(() {

    });
  }

  @override
  void initState() {
    getMyUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index)=>ListTile(
          title: Text(users[index].name ?? '--'),
          subtitle: Text(users[index].email ?? '--'),
          trailing: const Icon(Icons.person),
          leading: Text('${index +1}'),
        ),

      ),
    );
  }
}
