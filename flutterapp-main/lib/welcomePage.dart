import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:isettozeur/acc.dart';


class WelcomePage extends StatelessWidget {
  TextEditingController cinController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ISET de Tozeur'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/welcome.png',
              width: 250.0,
              height: 250.0,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20.0),
            Text(
              'Welcome to our application \n Iset Tozeur  ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: cinController,
                decoration: InputDecoration(
                  labelText: 'CIN',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20.0),
             ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 26, 255),
                    ),
                    child: Text('Se connecter'),
                  ),
          ],
        ),
      ),
    );
  }
}