import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:bankingassignmentenercent/Models/User.dart';
import 'package:bankingassignmentenercent/Screens/UserDetails.dart';

class UserList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserListState();
  }
}

class UserListState extends State<UserList> {
  List<User> userlist = [];

  void getUsers() async {
    final box = await Hive.openBox<User>('user');
    setState(() {
      userlist = box.values.toList() as List<User>;
    });
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("UsersList"),

        ),
        body: Container(
          decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(
                style: BorderStyle.none,
                width: 5,
              )),
            padding: EdgeInsets.all(15),
            child: ListView.builder(
                itemCount: userlist.length,
                itemBuilder: (context, position) {
                  User getuser = userlist[position];
                  return InkWell(child:Card(
                    elevation: 8,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text("${getuser.name}",
                          style: TextStyle(fontSize: 18)),


                    ),
                  ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetails(user: getuser,index:position),
                        ),
                      );
                    },
                  );
                }
                      ),
                    ),
                  ),
    );
    }

  }
