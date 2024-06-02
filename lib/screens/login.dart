import 'package:acres/components/shared/input.dart';
import 'package:acres/data/properties.dart';
import 'package:acres/data/users.dart';
import 'package:acres/model/user.dart';
import 'package:acres/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isRegistered = true;
  String _enteredEmail = '';
  String _enteredPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: GoogleFonts.yeonSung(
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        surfaceTintColor: Colors.white,
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: 8,
        title: const Text(
          'User Input',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                        },
                        onChange: (val) {
                          _enteredEmail = val!;
                        },
                      ),
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
                        onChange: (val) {
                          _enteredPassword = val!;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              final isLoggedin = await ref
                                  .read(authProvider.notifier)
                                  .isAuthenticated(
                                    _enteredEmail,
                                    _enteredPassword,
                                  );
                              if (!context.mounted) {
                                return;
                              }
                              if (isLoggedin) {
                                context.go('/');
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
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
      ),
    );
  }
}
