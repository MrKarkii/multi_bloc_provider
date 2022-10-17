
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/user_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key , required this.e}) : super(key: key);

  final UserModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 40,
                  backgroundImage: NetworkImage(e.avatar),
                ),
              ),
              SizedBox(height: 100,),
              Text(
                e.firstName + " " + e.lastName,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                ),
              ),
              SizedBox(height: 100,),
              Text(e.email,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.blue
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
