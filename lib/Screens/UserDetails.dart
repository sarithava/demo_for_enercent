import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bankingassignmentenercent/Models/User.dart';
import 'package:hive/hive.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key, required this.user, required this.index})
      : super(key: key);
  final User user;
  final int index;
  @override
  State<StatefulWidget> createState() {
    return UserDetailsState();
  }
}

class UserDetailsState extends State<UserDetails> {
  Box? userBox;
  TextEditingController textEditingController = new TextEditingController();
  @override
  void initState() {
    userBox = Hive.box<User>('user');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("UserDetails"),
      ),
      body: Center(
        child: Container(
            margin: EdgeInsets.only(left: 10, top: 30),
            padding: EdgeInsets.all(10),
            width: 300,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(
                  style: BorderStyle.none,
                  width: 5,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("UserName:${widget.user.name}",
                    style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Text("MobileNumber:${widget.user.mobile}",
                    style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Text("Account Balance:${widget.user.balance}",
                    style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                ButtonTheme(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                          child: const Text('DEPOSIT',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          onPressed: () async {
                            var deposit = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: new Text("Deposit"),
                                  content: TextField(
                                    controller: textEditingController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: 'Enter the amount'),
                                  ),
                                  actions: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        new FlatButton(
                                          child: new Text("Cancel"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        new FlatButton(
                                          child: new Text("ok"),
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pop(context,
                                                  textEditingController.text);
                                              textEditingController.clear();
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );

                            setState(() {
                              widget.user.balance = widget.user.balance +
                                  double.parse(deposit.toString());
                              userBox?.putAt(widget.index, widget.user);
                            });
                          }),
                      FlatButton(
                        child: const Text('WITHDRAW',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        onPressed: () async {
                          var withdrawal = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: new Text("Withdraw"),
                                content: TextField(
                                  controller: textEditingController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: 'Enter the amount'),
                                ),
                                actions: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      new FlatButton(
                                        child: new Text("Cancel"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      new FlatButton(
                                        child: new Text("ok"),
                                        onPressed: () {
                                          setState(() {
                                            Navigator.pop(context,
                                                textEditingController.text);
                                            textEditingController.clear();
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              );
                            },
                          );

                          if (double.parse(withdrawal.toString()) <=
                              widget.user.balance) {
                            setState(() {
                              widget.user.balance = widget.user.balance -
                                  double.parse(withdrawal.toString());
                              userBox?.putAt(widget.index, widget.user);
                            });
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: new Text('Insufficient balance'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: new Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
