import 'package:cryptoapp/network/response_model.dart';
import 'package:cryptoapp/provider/user_data_provider.dart';
import 'package:cryptoapp/ui/main_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  late UserDataProvider userProvider;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserDataProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Lottie.asset(
              'images/waveloop.json',
              height: height * .2,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            SizedBox(height: height * .01),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Sign Up',
                style: GoogleFonts.ubuntu(
                  fontSize: height * .035,
                  color: Theme.of(context).unselectedWidgetColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * .01),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Create Account',
                style: GoogleFonts.ubuntu(
                  fontSize: height * .035,
                  color: Theme.of(context).unselectedWidgetColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * .03),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      controller: nameController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        } else if (value.length < 4) {
                          return 'at least enter 4 characters';
                        } else if (value.length > 13) {
                          return 'maximum character is 13';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_rounded),
                        hintText: 'gmail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter gmail';
                        } else if (!value.endsWith('@gmail.com')) {
                          return 'please enter valid gmail';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                      controller: passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_open),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        hintText: 'Password',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (value.length < 7) {
                          return 'at least enter 6 characters';
                        } else if (value.length > 13) {
                          return 'maximum character is 13';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      'Creating an account means you\'re okay with our Terms of Services and our Privacy Policy',
                      style: GoogleFonts.ubuntu(
                        fontSize: 15,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.02),
                    Consumer<UserDataProvider>(
                      builder: (context, userDataProvider, child) {
                        switch (userDataProvider.registerStatus?.status) {
                          case Status.LOADING:
                            return CircularProgressIndicator();
                          case Status.COMPLETED:
                            // ✅ Navigate to MainWrapper after frame renders
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainWrapper(),
                                ),
                              );
                            });
                            return signupBtn(); // still show button until navigation
                          case Status.ERROR:
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                signupBtn(),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.error,
                                      color: Colors.redAccent,
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        userDataProvider
                                            .registerStatus!
                                            .message,
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          default:
                            return signupBtn();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signupBtn() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onPressed: userProvider.registerStatus?.status == Status.LOADING
            ? null
            : () {
                if (_formKey.currentState!.validate()) {
                  userProvider.callRegisterApi(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  );
                }
              },
        child: const Text('Sign Up'),
      ),
    );
  }
}
