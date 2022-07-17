import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: []);

    _checkAuth().then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              child: Image.asset("assets/images/logo.png"),
            ),
            Padding(
                padding: EdgeInsets.only(top: 100.0, bottom: 20.0),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                )),
            Text(
              "Carregando",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _checkAuth() async {
    await Future.delayed(Duration(seconds: 3));
  }
}
