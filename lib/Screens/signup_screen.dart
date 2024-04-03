// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mxpertz_test/Screens/home_screen.dart';
import 'package:mxpertz_test/Screens/login_screen.dart';
import 'package:mxpertz_test/services/auth_method.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  bool _isloading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      username: _usernameController.text,
      password: _passwordController.text,
    );
    setState(() {
      _isloading = false;
    });
    if (res != 'Success') {
      print(res);
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  void navigateToLogin() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool isChecked = false;
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Color.fromRGBO(248, 206, 88, 1),
          backgroundColor: Color.fromRGBO(248, 206, 88, 1),
          centerTitle: true,
          title: Text(
            'Register with Skenu',
            style: TextStyle(color: Colors.black),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Stack(children: [
              Container(
                color: Color.fromRGBO(1, 29, 69, 1),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          fillColor: Color.fromRGBO(0, 21, 51, 1),
                          focusColor: Colors.yellow,
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(5)),
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          fillColor: Color.fromRGBO(0, 21, 51, 1),
                          focusColor: Colors.yellow,
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(5)),
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          fillColor: Color.fromRGBO(0, 21, 51, 1),
                          focusColor: Colors.yellow,
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(5)),
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        // controller: _passwordController,
                        decoration: InputDecoration(
                          fillColor: Color.fromRGBO(0, 21, 51, 1),
                          focusColor: Colors.yellow,
                          hintText: ' Confirm Password',
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(5)),
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            activeColor: Colors.white,
                            focusColor: Colors.white,
                            value: isChecked,
                            checkColor: Colors.yellow,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          Text(
                            'Agree terms and condition',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: signUpUser,
                        child: _isloading
                            ? Center(
                                child: CircularProgressIndicator(
                                  
                                ),
                              )
                            : Container(
                                height: 60,
                                width: double.infinity,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 12),
                                decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(4))),
                                    color: Color.fromRGBO(0, 21, 51, 1)),
                                child: Text('Register',
                                    style: TextStyle(color: Colors.white)),
                              ),
                      ),
                      SizedBox(
                        height: height * 0.2,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
