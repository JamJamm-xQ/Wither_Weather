import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacementNamed(context, "/loadingscreen");
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //backgroundColor: Color(0xFF1D1E33),
      body: Center(
        child: Text(
          'Wither Weather',
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.white),
        ),
      ),
    );
  }
}
