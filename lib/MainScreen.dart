import 'package:flutter/material.dart';
import 'Submit.dart';
import 'Reports.dart';
import 'DataScreen.dart';

class MainScreen extends StatefulWidget {
  MainScreen();
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  MainScreenState();
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: DefaultTabController(
        length: 3,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.blue,
            ),
            Scaffold(
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.file_upload)),
                    Tab(icon: Icon(Icons.data_usage)),
                    Tab(icon: Icon(Icons.graphic_eq))
                  ],
                  labelColor: Theme.of(context).primaryColor,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 4.0),
                    insets: EdgeInsets.only(bottom: 44),
                  ),
                  unselectedLabelColor: Colors.grey,
                ),
              ),
              body: TabBarView(
                children: [
                  Submit(),
                  DataScreen(),
                  Reports(),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}