import 'package:flutter/material.dart';

Scaffold signupPage() {
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
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'enter your password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 100,
                    height: 40,
                    child:
                    TextButton(onPressed: () {}, child: const Text("Submit")))
              ])));
}

Scaffold loginPage() {
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
              obscureText: true,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'enter your password',
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
              width: 100,
              height: 40,
              child: TextButton(onPressed: () {}, child: const Text("Log in")))
        ],
      ),
    ),
  );
}

Scaffold homePage() {
  return const Scaffold();

}
