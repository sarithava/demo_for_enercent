import 'package:flutter/material.dart';
import 'package:bankingassignmentenercent/Screens/UserList.dart';
import 'package:bankingassignmentenercent/Screens/CreateUser.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('welcome'),
      ),
      body:Center(child: Container(
        margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(10),
        width: 300,
        height: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(
              style: BorderStyle.none,
              width: 10,
            )),
        child: Center(
          child: Column(
            children: [
              RaisedButton(
                color: Colors.amber,
                textColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),

                ),
                child: Text("Create User",style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateUser()),
                  );
                },
              ),
              SizedBox(height:50),
              RaisedButton(
                color: Colors.amber,
                textColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),

                ),
                child: Text("View users",style: TextStyle(fontSize: 20),),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserList()),
                  );
                },
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}
