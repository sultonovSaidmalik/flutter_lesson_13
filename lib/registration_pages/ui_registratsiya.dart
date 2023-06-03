import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiRegistratsiya extends StatefulWidget {
  const UiRegistratsiya({Key? key}) : super(key: key);

  @override
  State<UiRegistratsiya> createState() => _UiRegistratsiyaState();
}

class _UiRegistratsiyaState extends State<UiRegistratsiya> {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  Color logInButtonColor = const Color(0xFF262629);
  Color registerButtonColor = const Color(0xFF1a1a1b);
  bool emailIcon = true;
  bool passwordIcon = true;
  bool passwordSee = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF0f0f10),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage("assets/images/img_2.png"),
                height: 50,
              ),
              const SizedBox(height: 30),
              /// LogIn and Register Button
              Container(
                height: 48,
                width: 220,
                decoration: BoxDecoration(
                  color: const Color(0xFF1a1a1b),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTapDown: (event) {
                          logInButtonColor = const Color(0xFF1a1a1b);
                          setState(() {});
                        },
                        onTapUp: (event) {
                          logInButtonColor = const Color(0xFF262629);
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 38,
                          width: 105,
                          decoration: BoxDecoration(
                              color: logInButtonColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTapDown: (event) {
                          registerButtonColor = const Color(0xFF262629);
                          setState(() {});
                        },
                        onTapUp: (event) {
                          registerButtonColor = const Color(0xFF1a1a1b);
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 38,
                          width: 105,
                          decoration: BoxDecoration(
                              color: registerButtonColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: Color(0xFF575758),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 35),
              /// Email address Text
              const Text(
                "Email address",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF575758),
                ),
              ),
              const SizedBox(height: 10),
              /// Email address TextField
              TextField(
                controller: email,
                onChanged: (value) {
                  if (value.characters.isNotEmpty) {
                    emailIcon = false;
                  } else {
                    emailIcon = true;
                  }
                  setState(() {});
                },
                style: const TextStyle(fontSize: 18, color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF262629),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      email.clear();
                    },
                    child: Icon(
                      Icons.close,
                      color: emailIcon
                          ? Colors.transparent
                          : const Color(0xFF575758),
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "you@exaple.com",
                  hintStyle: const TextStyle(
                    color: Color(0xFF575758),
                  ),
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 20),
              /// Password Text
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF575758),
                ),
              ),
              const SizedBox(height: 10),
              ///Password TextField
              TextField(
                controller: password,
                obscureText: passwordSee,
                onChanged: (value) {
                  if (value.characters.isNotEmpty) {
                    passwordIcon = false;
                  } else {
                    passwordIcon = true;
                  }
                  setState(() {});
                },
                style: const TextStyle(fontSize: 18, color: Colors.white),
                decoration: InputDecoration(
                  suffixIcon: SizedBox(
                    width: 80,
                    height: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            password.clear();
                          },
                          child: Icon(
                            Icons.close,
                            color: passwordIcon
                                ? Colors.transparent
                                : const Color(0xFF575758),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            passwordSee = !passwordSee;
                            setState(() {});
                          },
                          child: Icon(
                            passwordSee
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                            color: const Color(0xFF575758),
                          ),
                        ),
                      ],
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF262629),
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Your password",
                  hintStyle: const TextStyle(
                    color: Color(0xFF575758),
                  ),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                /// showDialog faceID
                onTap: () {
                  showDialog(
                    barrierColor: const Color.fromRGBO(30, 30, 30, 0.75),
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Image(
                          image: AssetImage("assets/images/img_3.png"),
                          width: 65,
                          height: 64,
                          color: Color(0xFF575758),
                        ),
                        content: const Text(
                          "Face Not Recognized",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              minimumSize: const Size(30, 50),
                            ),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                /// SignIn Button
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: const Color(0xFF804CEF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 27),
              /// Text Forgot password
              const Center(
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: Color(0xFF804CEF),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 125),
              /// Text Sign in with
              const Center(
                child: Text(
                  "Sign in with",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF575758),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              /// Images Footer
              Row(
                children: [
                  const Spacer(flex: 8),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFF262629),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Image(
                        image: AssetImage("assets/images/applelogo.png"),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFF262629),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Image(
                        image: AssetImage("assets/images/facebooklogo.png"),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFF262629),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Image(
                        image: AssetImage("assets/images/twitterlogo.png"),
                      ),
                    ),
                  ),
                  const Spacer(flex: 8),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
