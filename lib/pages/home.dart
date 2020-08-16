import 'package:flutter/material.dart';

import '../widgets/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _authMode = 'login';

  void _toggleAuthMode() {
    setState(() {
      _authMode = _authMode == 'login' ? 'register' : 'login';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.09),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'img/corona.png',
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 29.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Corona',
                    style: TextStyle(
                      fontSize: 43,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffFFB7B7),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Virus',
                    style: TextStyle(
                      fontSize: 43,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Text('Caring for the future'),
            SizedBox(
              height: 78,
            ),
            Auth(_authMode),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account ?'),
                FlatButton(
                  child: Text(
                    _authMode == 'login' ? 'Register' : 'Login',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: _toggleAuthMode,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
