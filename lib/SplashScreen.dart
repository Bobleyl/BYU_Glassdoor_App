import 'package:flutter/material.dart';
import 'MainScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen();
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  SplashScreenState();

  TextStyle style = TextStyle(fontFamily: 'Raleway-Regular', fontSize: 20.0);

  Widget build(BuildContext context) {
    MediaQueryData mq;
    mq = MediaQuery.of(context);

    final splashButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).accentColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        },
        child: Text("Enter",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        preferredSize: Size.fromHeight(39),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Center(
          child: Container(
            color: Theme.of(context).primaryColor.withOpacity(.7),
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(36.0, 20.0, 36.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: mq.size.height/65),
                    SizedBox(
                      height: mq.size.height/4,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: mq.size.height/3),
                    splashButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
