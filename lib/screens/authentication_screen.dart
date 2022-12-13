import '../widgets/auth_form.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // ignore: sized_box_for_whitespace
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: const Center(
          child: AuthForm(),
          //     child: RaisedButton(
          //   onPressed: () {
          //     Navigator.of(context).pushNamed(
          //       ProductsScreeen.routeName
          //     );
          //   },

          // )
        ),
      ),
    );
  }
}
