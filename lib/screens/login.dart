import 'package:acres/components/shared/input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isRegistered = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 140),
        child: Column(
          children: [
            Center(
              child: Text(
                _isRegistered ? "Login" : "Register",
                style: GoogleFonts.yeonSung(
                    fontSize: 40, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Input(
                        hintText: "Enter Email",
                        validator: (val) {
                          bool validEmail = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val);
                          if (validEmail) {
                            return null;
                          } else {
                            return "Please enter valid email";
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Input(
                      hintText: "Enter Password",
                      validator: (val) {
                        if (val.trim().isEmpty) {
                          return "Enter your password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.validate();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.primary),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          padding: const MaterialStatePropertyAll(
                            EdgeInsets.all(16),
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                        child: const Text('Submit'),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Haven't registered yet? "),
                        SizedBox(
                          height: 24,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _isRegistered = !_isRegistered;
                              });
                              _formKey.currentState!.reset();
                            },
                            style: const ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero),
                              textStyle: MaterialStatePropertyAll(
                                  TextStyle(height: 1)),
                            ),
                            child: Text(
                              _isRegistered ? 'Register now' : 'Login',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
