import 'package:flutter/material.dart';
import '../shared/consts.dart';
import '../screens/products_screen.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var isLogin = true;

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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (!isLogin)
                    TextFormField(
                      decoration: usernameInputDecoration,
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: passwordInputDecoration,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (!isLogin)
                    TextFormField(
                      obscureText: true,
                      decoration: cpasswordInputDecoration,
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ProductsScreeen.routeName);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: iconbtn_color,
                    child: Text(isLogin ? 'Login' : 'Register',
                        style: const TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FlatButton(
                      onPressed: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      child: Text(isLogin
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
