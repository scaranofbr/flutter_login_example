import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool checkBoxValue = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final String kErrorText = 'The field cannot be empty!';
  bool _emailError = false;
  bool _passwordError = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFF73aEF5),
        Color(0xFF61A4F1),
        Color(0xFF478DE0),
        Color(0xFF398AE5)
      ], stops: [
        0.1,
        0.4,
        0.7,
        0.9
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 55),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: emailController,
                            onTap: () {
                              if (_emailError) {
                                setState(() => _emailError = false);
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              labelText: 'Email',
                              errorText: _emailError ? kErrorText : null,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: passwordController,
                            onTap: () {
                              if (_passwordError) {
                                setState(() => _passwordError = false);
                              }
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              labelText: 'Password',
                              errorText: _passwordError ? kErrorText : null,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () => null,
                              child: Text('Forgot Password?'),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                  value: checkBoxValue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      checkBoxValue = newValue ?? false;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Remember me',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _emailError = emailController.text.isEmpty;
                                  _passwordError =
                                      passwordController.text.isEmpty;
                                });
                                if (emailController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(
                                          'Login tapped with no TextField errors!',
                                          style: TextStyle(
                                              color: Colors.blueAccent),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('- OR -'),
                    SizedBox(height: 20),
                    Text('Sign in with'),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () => null,
                          heroTag: null,
                          child: Icon(Icons.facebook),
                        ),
                        SizedBox(width: 20),
                        FloatingActionButton(
                          onPressed: () => null,
                          heroTag: null,
                          child: Icon(Icons.mail),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(text: 'Have an Account? '),
              TextSpan(
                  text: 'Sign up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))
            ])),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
