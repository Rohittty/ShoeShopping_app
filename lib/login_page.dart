import 'package:flutter/material.dart';
import 'package:shop_app/home_page.dart';
import 'package:form_validation/form_validation.dart';

/*
class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/amazon-png-logo-vector-6701.png'),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {

                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter valid Email',
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cannot be empty";
                      }
                      return null;
                    }),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Enter valid Password',
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black)),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password cannot be empty";
                    } else if (value.length < 6) {
                      return "Password length should be atleast 6";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()));
                    }
                  },
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(shadowColor: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (isValid!) {
      return;
    }
    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                        'assets/images/amazon-png-logo-vector-6701.png'),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          //Text(
                          // "Form-Validation In Flutter ",
                          // style: TextStyle(
                          // fontSize: 24.0, fontWeight: FontWeight.bold),
                          // ),
                          //styling
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.1,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              // hintText: 'Enter valid Email',
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            // decoration:
                            //InputDecoration(labelText: 'E-Mail'),
                            //keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (value) {
                              //Validator
                            },
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                return 'Enter a valid email!';
                              }
                              return null;
                            },
                          ),
                          //box styling
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.1,
                          ),
                          //text input
                          TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'Enter valid Password',
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.black)),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            onFieldSubmitted: (value) {},
                            //obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " Password can't be Empty";
                              }
                              //else
                              //return "Password Can't be Empty";
                              //return null;
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.1,
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Navigator.push(
                                //   context,
                                // MaterialPageRoute(
                                //   builder: (context) => HomePage()));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            },
                            child: const Text('Login'),
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ]))),
    );
  }
}
