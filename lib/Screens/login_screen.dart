import 'package:flutter/material.dart';
import 'package:mxpertz_test/Screens/home_screen.dart';
import 'package:mxpertz_test/Screens/profile_screen.dart';
import 'package:mxpertz_test/Screens/signup_screen.dart';
import 'package:mxpertz_test/services/auth_method.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
bool isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  void loginUser()async{
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().loginUser(email: _emailController.text, password: _passwordController.text);
    if (res=='Success') {
          Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => HomeScreen()
          ),
          (route) => false);

      setState(() {
        isLoading = false;
      });
    }else{
     print(res);
    }
     setState(() {
      isLoading = false;
    });
  }
  void navigateToSignUp(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen(),));
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(

      child: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: [
              Image.asset(
                'assets/bg.png',
                fit: BoxFit.contain,
              ),
              Positioned(
                bottom: height*0.14,
                left: 20,
                right: 20,
                child: Container(
                  height: height * 0.55,
                  width: width * 0.8,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text('Sign In Into Your Account'),
                          SizedBox(
                            height: 50,
                          ),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusColor: Colors.yellow,
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.yellow),
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.yellow)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.yellow,
                                  ),
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
                              fillColor: Colors.white,
                              focusColor: Colors.yellow,
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.yellow),
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.yellow)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.yellow,
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                              filled: true,
                              contentPadding: EdgeInsets.all(8),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: loginUser,
                             child: isLoading? Center(child: CircularProgressIndicator(),):
                     Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                  color: Color.fromRGBO(1, 29, 69, 1)),
                              child: Text(
                                'LOG IN',
                                style:
                                    TextStyle(color: Color.fromRGBO(248, 206, 88, 1)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("FORGOT PASSWORD")
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
