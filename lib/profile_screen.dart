import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final username;

  const Profile({Key key, this.username}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image(
              image: NetworkImage(
                  'https://icon-library.com/images/github-icon-png/github-icon-png-29.jpg'),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(
                      'https://icon-library.com/images/github-icon-png/github-icon-png-29.jpg'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'GitHub',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
