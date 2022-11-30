import 'package:flutter/material.dart';
import '../models/http_exception.dart';
import 'package:provider/provider.dart';
import '../shared/consts.dart';
import '../screens/products_screen.dart';
import '../providers/auth.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;

  Map<String, String> _authData = {'email': '', 'password': ''};
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text('An Error Occurred'),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                  child: const Text("Okay"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  Future<void> _submit() async {
    try {
      if (!_formKey.currentState!.validate()) {
        //invalid
        return;
      }
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      if (_isLogin) {
        await Provider.of<Auth>(context, listen: false)
            .login(_authData['email']!, _authData['password']!);
      } else {
        await Provider.of<Auth>(context, listen: false)
            .signup(_authData['email']!, _authData['password']!);
      }
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email is already in use';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak';
      } else if (error.toString().contains('EMAIL NOT FOUND')) {
        errorMessage = 'Could not find a user with that email';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      print(error);
      var errorMessage = 'Could not authenticate you. Please try agin later';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          color: container_color,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0),
            child: Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child:
                        Icon(Icons.shopping_bag, color: appBar_color, size: 60),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: emailInputDecoration,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _authData['email'] = value!;
                    },
                  ),
                  //
                  // if (!isLogin)
                  //   TextFormField(
                  //     decoration: usernameInputDecoration,
                  //     validator: (value) {
                  //       if (value!.isEmpty || value.length < 4) {
                  //         return 'Username should be atleast 4 characters';
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: passwordInputDecoration,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return 'Password should be atleast 7 characters';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _authData['password'] = value!;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (!_isLogin)
                    TextFormField(
                      obscureText: true,
                      decoration: cpasswordInputDecoration,
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return 'passwords do not match';
                        }
                        return null;
                      },
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });
                      // Navigator.of(context)
                      //     .pushNamed(ProductsScreeen.routeName);
                      _submit();
                       setState(() {
                        _isLoading = false;
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: btn_color,
                    child: Text(_isLogin ? 'Login' : 'Register',
                        style: const TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FlatButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(_isLogin
                          ? 'Create new account'
                          : 'Already have an account ?'))
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
