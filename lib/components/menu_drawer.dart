import 'package:flutter/material.dart';
import 'package:heartcom/services/auth/auth_service.dart';
import 'package:heartcom/pages/settings_page.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({super.key});

  void logout() {
    final _auth = authService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          Column(
            children: [
              DrawerHeader(
                child: Center(
                    child: Image.asset('assets/images/HeartCom_Beta.png')),
              ),
              //home list
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          //settings list
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
          ),

          //logout
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
