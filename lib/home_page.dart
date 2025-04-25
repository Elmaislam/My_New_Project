import 'package:flutter/material.dart';
import 'package:my_new_project/converter_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void mySnackBar(msg, context) {
    final snackBar = SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.teal,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void myAlertDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Hello!"),
          content: Text("Do you want to delete something?"),
          actions: [
            TextButton(
              onPressed: () {
                mySnackBar("Deleted Successfully!", context);
                Navigator.of(context).pop();
              },

              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart UI Home"),
        backgroundColor: Colors.teal,
        elevation: 8,
        actions: [
          IconButton(
            onPressed: () {
              mySnackBar('Search Clicked', context);
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              mySnackBar('Settings Clicked', context);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.teal),
                accountName: Text("Maria"),
                accountEmail: Text("maria@example.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/flutter.png"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () => mySnackBar("Home Clicked", context),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Contact"),
              onTap: () => mySnackBar("Contact Clicked", context),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () => mySnackBar("Profile Clicked", context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              mySnackBar("Home Clicked", context);
              break;
            case 1:
              mySnackBar("Message Clicked", context);
              break;
            case 2:
              mySnackBar("Profile Clicked", context);
              break;
          }
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Smart Flutter UI!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.teal, width: 5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.shade100,
                    blurRadius: 10,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Image.asset("assets/images/flutter.png"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                myAlertDialog(context);
              },
              child: Text("Show Alert"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConverterPage()),
                );
              },
              child: Text("Go to Converter"),
            ),
          ],
        ),
      ),
    );
  }
}
