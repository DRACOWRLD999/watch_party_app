import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models.dart';

class SignUpData {
  final String username;
  final String email;
  final String password;

  SignUpData(
      {required this.username, required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _makePostRequest(SignUpData signUpData) async {
    print(signUpData.email);
    final Uri uri = Uri.parse(
        'http://192.168.4.16:8080/user/register'); // Replace with your API endpoint

    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': signUpData.username,
        'email': signUpData.email,
        'password': signUpData.password,
      }),
    );

    if (response.statusCode == 200) {
      // Handle successful response
      print('Signup successful');
    } else {
      // Handle error response
      print('Signup failed: ${response.body}');
    }
  }

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
                controller: usernameController,
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
                controller: emailController,
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
                controller: passwordController,
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
                onPressed: () {
                  String username = usernameController.text;
                  String email = emailController.text;
                  String password = passwordController.text;

                  SignUpData signUpData = SignUpData(
                    username: username,
                    email: email,
                    password: password,
                  );

                  _makePostRequest(signUpData);
                },
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
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _makePostRequest(LoginData loginData) async {
    final Uri uri = Uri.parse(
        'http://192.168.4.16:8080/user/login'); // Replace with your API endpoint

    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': loginData.username,
        'password': loginData.password,
      }),
    );

    if (response.statusCode == 200) {
      // Handle successful response
      print('Login successful');
    } else {
      // Handle error response
      print('Login failed: ${response.body}');
    }
  }

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
                controller: usernameController,
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
                controller: passwordController,
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
                onPressed: () {
                  String username = usernameController.text;
                  String password = passwordController.text;
                  LoginData loginData =
                      LoginData(username: username, password: password);
                  _makePostRequest(loginData);
                },
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
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];
  List<String> responses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: [
            _pages[_currentIndex],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.red,
            ),
            label: 'Watch Parties',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Colors.red,
            ),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            label: 'Tab 3',
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<String> videoTitles = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, // Set a fixed height
      child: ListView(
        children: [
          Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: videoTitles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(videoTitles[index]),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void fetchData() async {
    const url = 'url example';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          videoTitles = data.map((video) => video['title'].toString()).toList();
        });
      } else {
        print('Failed to load data from $url: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data from $url: $error');
    }
  }
}

class Page2 extends StatelessWidget {
  Future<void> pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Handle the selected file
      print('File picked: ${result.files.first.name}');
    } else {
      // User canceled the picker
      print('File picking canceled.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          const SizedBox(
            height: 200,
          ),
          SizedBox(
            height: 100,
            width: 300,
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Party Title',
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: 300,
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Description',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.center
              ,children: [
              SizedBox(
                width: 150,
                  child:TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'File Name',
                  ),
                ),
              ),
            SizedBox(
                width: 150,
            child:ElevatedButton(
              onPressed: () async {
                await pickFile(context);
              },
              child: const Text('Pick a File'),
            )

            )
          ])
        ]));
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [
        Text('Page 3'),
      ]),
    );
  }
}
