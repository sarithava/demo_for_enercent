import 'package:flutter/material.dart';
import 'package:bankingassignmentenercent/Models/User.dart';
import 'package:hive/hive.dart';
import 'package:bankingassignmentenercent/Screens/UserList.dart';

class CreateUser extends StatefulWidget {
  CreateUser();

  @override
  State<StatefulWidget> createState() {
    return CreateUserState();
  }
}

class CreateUserState extends State<CreateUser> {
  User? userModel = null;
  Box? userBox;

  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerMobile = new TextEditingController();
  @override
  void initState() {
    userBox = Hive.box<User>('user');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Create New user")),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            width: 500,
            height: 500,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(
                  style: BorderStyle.none,
                  width: 5,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Name:", style: TextStyle(fontSize: 18)),
                    SizedBox(width: 50),
                    Expanded(
                      child: TextField(
                        controller: controllerName,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("PhoneNumber:", style: TextStyle(fontSize: 18)),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                          controller: controllerMobile,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number),
                    )
                  ],
                ),
                SizedBox(height: 60),
                MaterialButton(
                  color: Colors.white,
                  child: Text("Submit",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  onPressed: () async {
                    var getUserName = controllerName.text;
                    var getMobile = controllerMobile.text;
                    var getInitialdeposit = 500;
                    if (getUserName.isNotEmpty & getMobile.isNotEmpty) {
                      User userdata = new User(
                          name: getUserName,
                          mobile: int.parse(getMobile),
                          balance: double.parse(getInitialdeposit.toString()));

                      userBox?.add(userdata);

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => UserList()),
                          (r) => false);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
