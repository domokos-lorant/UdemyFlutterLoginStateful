import 'package:flutter/material.dart';
import '../mixins/ValidationMixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Padding(padding: EdgeInsets.only(top: 25.0)),
            submitButton()
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Email Address", hintText: "you@example.com"),
      validator: validateEmail,
      onSaved: (newValue) {
        email = newValue ?? "";
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: "Password", hintText: "Pasword"),
      validator: validatePassword,
      onSaved: (newValue) {
        password = newValue ?? "";
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: Text("Submit!"),
      style: ElevatedButton.styleFrom(primary: Colors.green.shade500),
      onPressed: () {
        if (formKey.currentState?.validate() == true) {
          formKey.currentState?.save();
          print("Time to post $email and $password to API");
        }
      },
    );
  }
}
