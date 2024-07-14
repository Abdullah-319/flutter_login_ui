import 'package:flutter/material.dart';
import 'package:general_user_login/auth/forgot_password_screen.dart';
import 'package:general_user_login/widgets/custom_button.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool isChecked = false;
  bool loading = false;
  bool showPassword = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void handleCheckboxChange(bool? newValue) {
    setState(() {
      isChecked = newValue ?? false;
    });
  }

  void handleObsecurePasswordChange() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color greenColor = const Color(0xff00AA11);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 13,
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            "Achieve",
            style: TextStyle(
              color: greenColor,
              fontSize: 32,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign In",
                  style: TextStyle(
                    color: greenColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 30),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                            maxHeight: 44,
                            minHeight: 44,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          hintStyle: const TextStyle(
                            height: 1.34,
                            color: Colors.grey,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: greenColor, width: 1.0),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintText: 'Place holder',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: passwordController,
                        obscureText: showPassword,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Enter Password';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                            maxHeight: 44,
                            minHeight: 44,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          hintStyle: const TextStyle(
                            height: 1.34,
                            color: Colors.grey,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: greenColor, width: 1.0),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintText: '*******',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              handleObsecurePasswordChange();
                            },
                            child: Icon(
                              showPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        handleCheckboxChange(!isChecked);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isChecked ? Colors.green : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: isChecked ? Colors.green : Colors.grey,
                            width: 2.0,
                          ),
                        ),
                        width: 20.0,
                        height: 20.0,
                        child: isChecked
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16.0,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text("Remember Me"),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordScreen()));
                      },
                      child: const Text("Forgot Password?"),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                CustomButton(
                  title: "Sign In",
                  color: greenColor,
                  loading: loading,
                  onTap: () {
                    setState(() {
                      loading = true;
                    });
                  },
                ),
                const SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "SIGNUP",
                          style: TextStyle(
                            fontSize: 16,
                            color: greenColor,
                            decoration: TextDecoration.underline,
                            decorationColor: greenColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Center(
                            child: IconButton(
                              icon: Image.asset(
                                "assets/images/apple_image.png",
                                color: const Color(0xff7D7D7D),
                                filterQuality: FilterQuality.high,
                                height: 32,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        const SizedBox(width: 40),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Center(
                            child: IconButton(
                              icon: Image.asset(
                                "assets/images/google_image.png",
                                filterQuality: FilterQuality.high,
                                height: 32,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: IconButton(
                            icon: Image.asset(
                              "assets/images/fb_image.png",
                              filterQuality: FilterQuality.high,
                              height: 32,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
