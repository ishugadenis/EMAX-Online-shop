// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const container_color = Color(0xDBf6f6f6);
const iconbtn_color = Color(0xDBC4A6A6);
const frame_color = Color(0xDBEBDAD1);
const cat_color = Color(0XDBF5CCC3);

//email
InputDecoration emailInputDecoration = InputDecoration(
  fillColor: container_color,
  label: const Text('Email address'),
  //hintText: 'Email address',
  filled: true,
  contentPadding: const EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.pink, width: 2.0),
  ),
);

//username
InputDecoration usernameInputDecoration = InputDecoration(
  fillColor: container_color,
  label: const Text('Username'),
  //hintText: 'username',
  filled: true,
  contentPadding: const EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.pink, width: 2.0),
  ),
);

//password
InputDecoration passwordInputDecoration = InputDecoration(
  fillColor: container_color,
  label: const Text('password'),
  // hintText: 'password',
  filled: true,
  contentPadding: const EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.pink, width: 2.0),
  ),
);

//confirmpassword
InputDecoration cpasswordInputDecoration = InputDecoration(
  fillColor: container_color,
  label: const Text('confirm password'),
  // hintText: 'confirm password',
  filled: true,
  contentPadding: const EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.pink, width: 2.0),
  ),
);
