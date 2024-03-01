import 'package:flutter/material.dart';
import 'package:ngdemo10_kesh/models/user_model.dart';
import 'package:ngdemo10_kesh/services/pref_service.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String name = "no name";
  User user = User(id: 1,username: "Abdusattor");
  List<User> userList = [
    User(id: 1002, username: 'Abdusattor'),
    User(id: 1003, username: 'Alex'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Prefs.storeName("Just do it!");
    //Prefs.storeUser(user);
    //Prefs.storeUserList(userList);
    //_loadUser();
    _loadUserList();
  }
  _loadUserList()async{
    List<User>? result = await Prefs.loadUserList();
    setState(() {
      user = result!.first;
    });
  }

  _loadUser()async{
    User? result = await Prefs.loadUser();
    setState(() {
      user = result! ;
    });
  }

  _loadName()async{
    String result = await Prefs.loadName();
    setState(() {
      name = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Shared Preferences",style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Text(
          user != null ? user!.toMap().toString() : 'No user',
            style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
