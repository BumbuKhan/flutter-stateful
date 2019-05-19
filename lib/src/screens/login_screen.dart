import 'package:flutter/material.dart';

import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget{
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(40),
      padding: EdgeInsets.only(top: 20),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 20)),
            submitButton()
          ],
        )
      )
    );
  }

  Widget emailField () {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email address',
        hintText: 'you@example.com'
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) {
        this.email = value;
      }
    );
  }

  Widget passwordField () {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: '******'
      ),
      obscureText: true,
      validator: validatePassword,
      onSaved: (value) {
        this.password = value;
      }
    );
  }

  Widget submitButton () {
    return (
      RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () {
          if(formKey.currentState.validate()) {
            formKey.currentState.save();
          }
        },
        child: Text('Submit'),
      )
    );
  }
}