import 'package:flutter/material.dart';
import 'package:quiz/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username = "rizka";
  var password = "rizkaa";
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.40,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 118, 234, 122),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(60))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.medical_information_outlined,
                  size: 70,
                  color: Colors.white,
                ),
                SizedBox(height: 15),
                Text('Herbaku', style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.bold, 
                  color: Colors.white,
                ),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                      labelText: 'Input your username',
                      prefixIcon: Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.green[200],
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Input your password'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: (
                    ) {
                      if (usernameController.text == username &&
                          passwordController.text == password) {
  
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return HomePage();
                        })));
                      } else if (usernameController.text != username &&
                          passwordController.text == password) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("Invalid Username")));
                      } else if (usernameController.text == username &&
                          passwordController.text != password) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("Invalid password")));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("Invalid username and password")));
                      }
                    },
                    child: const Text('Login'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
