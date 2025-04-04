import 'package:flutter/material.dart';

import 'navigation.dart';
import 'map.dart';
import 'wave.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/home');
          },
          child: const Text('Home'),
        ),
        actions: [
          PopupMenuButton<String>(
            child: const Padding(
              padding: EdgeInsets.only(right: 10.0),
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
                const PopupMenuItem(value: '/mercury', child: Text('Mercury')),
                const PopupMenuItem(value: '/venus', child: Text('Venus')),
                const PopupMenuItem(value: '/earth', child: Text('Earth')),
                const PopupMenuItem(value: '/mars', child: Text('Mars')),
                const PopupMenuItem(value: '/jupiter', child: Text('Jupiter')),
                const PopupMenuItem(value: '/saturn', child: Text('Saturn')),
                const PopupMenuItem(value: '/uranus', child: Text('Uranus')),
                const PopupMenuItem(value: '/neptune', child: Text('Neptune')),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Welcome to',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    WaveText(
                      text: 'Celestia',
                      textStyle: TextStyle(
                        fontSize: 72,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            const NavigationPage(),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const MapPage(),
            ),
          ],
        ),
      ),
    );
  }
}
