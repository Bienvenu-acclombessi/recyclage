import 'package:flutter/material.dart';
import 'package:recyclage/services/wrapper.dart';

class MySplashScreen extends StatefulWidget {
  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  @override
  void initState() {
    super.initState();
   
  
    Future.delayed(const Duration(seconds: 4)).then((value) =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Wrapper())));
 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/splashscreen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset(
                    "assets/logo_blanc.png",
                    // width: 150.0,
                    // height: 150.0,
                  ),
                ),
                
              ],
            ),
          ),
        ),
      )
    ;
  }
}