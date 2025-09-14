import 'package:carpoolapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
      _naviagtehome();
  }

  void _naviagtehome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => (HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
              child: Text(
                "Carpool",
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 80,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Text(
                "Tunisia",
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  color: Color(0xFF008CFF),
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'images/splash.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(60),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, shape: StadiumBorder(), backgroundColor: Color(0xFF008CFF),
                  fixedSize: Size(150, 50),
                  textStyle: TextStyle(fontFamily: 'DM Sans', fontSize: 19),
                ),
                onPressed: () {},
                child: Text("Let's go"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
