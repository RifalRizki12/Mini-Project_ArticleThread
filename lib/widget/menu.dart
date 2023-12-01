import 'package:flutter/material.dart';
import 'package:mini_project/provider/authprovider.dart';
import '../style.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  size: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            title: Text(
              'Artikel',
              style: Styles.HeaderText,
            ),
            onTap: () {
              Navigator.pop(context);
              if (!(Navigator.canPop(context) &&
                  ModalRoute.of(context)?.settings.name == '/article')) {
                Navigator.pushReplacementNamed(context, '/article');
              } else {
                print('Pengguna sudah berada di halaman Artikel.');
              }
            },
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            title: Text(
              'Thread',
              style: Styles.HeaderText,
            ),
            onTap: () {
              Navigator.pop(context);
              if (!(Navigator.canPop(context) &&
                  ModalRoute.of(context)?.settings.name == '/thread')) {
                Navigator.pushReplacementNamed(context, '/thread');
              } else {
                print('Pengguna sudah berada di halaman Thread.');
              }
            },
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            title: Text(
              'Profile',
              style: Styles.HeaderText,
            ),
            onTap: () {
              Navigator.pop(context);
              if (!(Navigator.canPop(context) &&
                  ModalRoute.of(context)?.settings.name == '/profilemenu')) {
                Navigator.pushReplacementNamed(context, '/profilemenu');
              } else {
                print('Pengguna sudah berada di halaman Profile.');
              }
            },
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            title: Text(
              'Logout',
              style: Styles.HeaderText,
            ),
            onTap: () {
              Navigator.pop(context);
              if (!(Navigator.canPop(context) &&
                  ModalRoute.of(context)?.settings.name == '/logout')) {
                // Panggil fungsi logout dari AuthProvider
                AuthProvider().logout();

                // Tampilkan notifikasi logout
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Logout successful !!!'),
                  duration: Duration(seconds: 3),
                ));

                // Navigasi ke halaman login
                Navigator.pushReplacementNamed(context, '/logout');
              } else {
                print('Pengguna sudah logout !!!');
              }
            },
          ),
        ],
      ),
    );
  }
}
