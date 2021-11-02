import 'package:hive/hive.dart';

part 'User.g.dart';

@HiveType(typeId: 1,adapterName: "Userdapter")
class User{
  @HiveField(0)
  String name;

  @HiveField(1)
  int mobile;

  @HiveField(2)
  double balance;



  User({required this.name,required this.mobile,required this.balance });
}