// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const container_color = Color(0xDBD3E3E2);
const iconbtn_color = Color(0xDBFFFFFF);
const frame_color = Color(0xDBE1C7A5);
const cat_color = Color(0XDBEAB875);
const btn_color = Color(0XDB2F3435);
const appBar_color = Color(0XDB7BC5C1);

//heading style
TextStyle hstyle = const TextStyle(
  color: Colors.black,
  fontSize: 21,
  fontWeight: FontWeight.bold,
);
//heading2 style
TextStyle subHstyle = const TextStyle(
  color: Colors.black,
  fontSize: 17,
  fontWeight: FontWeight.bold,
);

//email
InputDecoration emailInputDecoration = InputDecoration(
  fillColor: Colors.white,
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
  fillColor: Colors.white,
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
  fillColor: Colors.white,
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
  fillColor: Colors.white,
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
