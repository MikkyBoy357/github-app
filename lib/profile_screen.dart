import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:github_app/utils/api.dart';

import 'model/profile_model.dart';

class Profile extends StatefulWidget {
  final username;

  const Profile({Key key, this.username}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var login;
  var username;
  var imageUrl;
  var followers;
  var following;
  var publicRepositories;
  var location;
  bool loading = true;

  getProfile() async {
    try {
      String url = '${Api.api}/users/${widget.username}';
      http.Response response = await http.get(url, headers: {
        'mikkyboy2005': '${Api.token}',
      });
      var results = jsonDecode(response.body);
      setState(() {
        this.login = results['login'];
        this.username = results['name'];
        this.imageUrl = results['avatar_url'];
        this.followers = results['followers'];
        this.following = results['following'];
        this.publicRepositories = results['public_repos'];
        this.location = results['location'];
        loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    print(login);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
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
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          username,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   itemBuilder: (context, index) {
                      //     return ProfileModel(
                      //       icon: Icon(
                      //         Icons.supervised_user_circle_sharp,
                      //       ),
                      //       text: 'Username',
                      //       value: login,
                      //     );
                      //   },
                      // ),
                      ProfileModel(
                        icon: Icon(
                          CupertinoIcons.profile_circled,
                          color: Colors.blue[800],
                        ),
                        text: 'Username',
                        value: login,
                      ),
                      ProfileModel(
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                        text: 'Location',
                        value: location,
                      ),
                      ProfileModel(
                        icon: Icon(
                          Icons.supervised_user_circle_sharp,
                          color: Colors.yellow[900],
                        ),
                        text: 'Followers',
                        value: followers.toString(),
                      ),
                      ProfileModel(
                        icon: Icon(
                          Icons.supervised_user_circle_outlined,
                          color: Colors.blue,
                        ),
                        text: 'Following',
                        value: following.toString(),
                      ),
                      ProfileModel(
                        icon: Icon(
                          Icons.folder,
                          color: Colors.green,
                        ),
                        text: 'Repositories',
                        value: publicRepositories.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
