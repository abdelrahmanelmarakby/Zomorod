import 'package:flutter/material.dart';
import '../data/colors.dart';
import '../data/data.dart';


class UserProfilePage extends StatelessWidget {
  final Channel currentUser;

  UserProfilePage({@required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.close, color: Colors.white)),
        title: Text('Account', style: TextStyle(color: Colors.white)),
        backgroundColor: nero,
      ),
      body: SafeArea(
        child: Container(
            color: nero,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage:
                            AssetImage(currentUser.logoImagePath),
                            radius: 30),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(currentUser.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0)),
                            SizedBox(height: 5.0),
                            Text('johnsteck@gmail.com',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0)),
                            SizedBox(height: 5.0),
                            Text('Manage your Google Account',
                                style: TextStyle(color: linkBlue))
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.white),
                  ListTile(
                    leading: Icon(Icons.account_box, color: suvaGrey),
                    title: Text('Your channel',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings_applications, color: suvaGrey),
                    title: Text('Youtube Studio',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.access_time, color: suvaGrey),
                    title: Text('Time watched',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.video_library, color: suvaGrey),
                    title: Text('Get YouTube Premium',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.monetization_on, color: suvaGrey),
                    title: Text('Paid memberships',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.supervisor_account, color: suvaGrey),
                    title: Text('Switch account',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.security, color: suvaGrey),
                    title: Text('Your data in YouTube',
                        style: TextStyle(color: Colors.white)),
                  ),
                  Divider(color: Colors.white),
                  ListTile(
                    leading: Icon(Icons.settings, color: suvaGrey),
                    title:
                    Text('Settings', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.help, color: suvaGrey),
                    title: Text('Help & feedback',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}