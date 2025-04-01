import 'package:flutter/material.dart';

import 'navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //nav bar
        automaticallyImplyLeading: false, //no arrow
        title: InkWell(
          //maybe change
          onTap: () {
            Navigator.pushNamed(context, '/home');
          },
          child: Text('Home'),
        ),
        actions: [
          PopupMenuButton<String>(
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            onSelected: (String value) {
              Navigator.pushNamed(context, value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: '/mercury', child: Text('Mercury')),
                PopupMenuItem(value: '/venus', child: Text('Venus')),
                PopupMenuItem(value: '/earth', child: Text('Earth')),
                PopupMenuItem(value: '/mars', child: Text('Mars')),
                PopupMenuItem(value: '/jupiter', child: Text('Jupiter')),
                PopupMenuItem(value: '/saturn', child: Text('Saturn')),
                PopupMenuItem(value: '/uranus', child: Text('Uranus')),
                PopupMenuItem(value: '/neptune', child: Text('Neptune')),
              ];
            },
          ),
        ],
      ),
      //make pretty and add library for animation
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // HomePage content
            SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    Text(
                      'Celestia',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // NavigationPage content
            NavigationPage(),
          ],
        ),
      ),
    );
  }
}
