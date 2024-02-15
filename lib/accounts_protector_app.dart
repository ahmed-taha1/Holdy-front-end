import 'package:flutter/material.dart';

class AccountsProtectorApp extends StatelessWidget {

    const AccountsProtectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accounts Protector',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Accounts Protector'),
        ),
        body: const Center(
          child: Text('Welcome to Accounts Protector'),
        ),
      )
    );
  }
}