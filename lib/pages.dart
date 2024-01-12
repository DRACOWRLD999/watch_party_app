import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  get myController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 42.0,
              child: TextFormField(
                controller: myController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter your username',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              height: 42.0,
              child: TextFormField(
                controller: myController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter your Email',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              height: 42.0,
              child: TextFormField(
                controller: myController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter your password',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              height: 40,
              child: TextButton(
                onPressed: () {},
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  get myController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 42.0,
              child: TextFormField(
                controller: myController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter your username or Email',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              height: 42.0,
              child: TextFormField(
                controller: myController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter your password',
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 100,
              height: 40,
              child: TextButton(
                onPressed: () {},
                child: const Text("Log in"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(

      ),
    );
  }
}

