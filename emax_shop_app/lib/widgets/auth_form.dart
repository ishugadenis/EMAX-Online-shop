import 'package:flutter/material.dart';
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
      var erorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email is already in use';
      }
    } catch (eror) {
      var errorMessage = 'Could nor authenticate you. Please try agin later';
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
          color: frame_color,
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
                    child: Icon(Icons.shopping_bag,
                        color: iconbtn_color, size: 60),
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
                  _isLoading
                      ? const CircularProgressIndicator()
                      : RaisedButton(
                          onPressed: () {
                            _submit();
                            // Navigator.of(context)
                            //     .pushNamed(ProductsScreeen.routeName);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: iconbtn_color,
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
