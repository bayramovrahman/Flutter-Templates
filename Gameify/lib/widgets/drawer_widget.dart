import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyDrawerMenu extends StatelessWidget {
  const MyDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 250,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/profil.jpg'),
                    ),
                    Text('Username', style: TextStyle(color: Colors.white, fontSize: 20),),
                    Text('info@username.com', style: TextStyle(color: Colors.white, fontSize: 16),),
                  ],
                ),
              ),
            ),
            myDrawerListTile(context, Icons.home, 'Home', 'context'),
            myDrawerListTile(context, Icons.dashboard, 'Dashboard', '/dashboard'),
            myDrawerListTile(context, Icons.people_alt_outlined, 'Contacts', '/contacts'),
            myDrawerListTile(context, Icons.event, 'Events', '/events'),
            myDrawerListTile(context, Icons.notes, 'Notes', '/notes'),
            myDrawerListTile(context, Icons.settings, 'Settings', '/settings'),
            myDrawerListTile(context, Icons.notifications, 'Notifications', '/notifications'),
            const Divider(),
            myDrawerListTile(context, Icons.privacy_tip_outlined, 'Privacy Policy', '/privacy_policy'),
            myDrawerListTile(context, Icons.feedback_outlined, 'Send Feedback', '/send_feedback'),
            ListTile(
              leading: const Icon(Icons.exit_to_app_outlined),
              title: const Text('Exit'),
              onTap: () {
                //Exit from application
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      );
  }
}

Widget myDrawerListTile(BuildContext context, IconData icon, String title, String route) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    onTap: () {
      Navigator.pop(context); // Drawer'ı kapat
      Navigator.pushNamed(context, route); // Belirtilen sayfaya git
    },
  );
}