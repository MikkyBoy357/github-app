import 'package:flutter/material.dart';
import 'package:github_app/profile_screen.dart';

class Home extends StatelessWidget {
  final String title;

  const Home({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey();
    void submit() {
      // if (_formKey.currentState.validate()) {
      //   return;
      // }
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Profile(
            username: _controller.text,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(title),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _controller,
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'GitHub Username';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter a Github Username',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      onFieldSubmitted: (context) {
                        submit();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 100,
                  child: FlatButton(
                    padding: EdgeInsets.all(10),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      child: Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    onPressed: () {
                      submit();
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
