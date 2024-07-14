import 'package:flutter/material.dart';
import 'package:general_user_login/widgets/custom_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool loading = false;
  bool showPassword = true;
  bool showConfirmPassword = true;
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void handleObsecurePasswordChange() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void handleObsecureConfirmPasswordChange() {
    setState(() {
      showConfirmPassword = !showConfirmPassword;
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
        body: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Change Password",
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
                        const SizedBox(height: 20),
                        const Text(
                          "Confirm Password",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: confirmPasswordController,
                          obscureText: showConfirmPassword,
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
                                handleObsecureConfirmPasswordChange();
                              },
                              child: Icon(
                                showConfirmPassword
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
                ],
              ),
              CustomButton(
                title: "Verify",
                color: greenColor,
                loading: loading,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title:
                              Image.asset("assets/images/change_password.png"),
                          content: SizedBox(
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  "New password Created",
                                  style: TextStyle(
                                    color: greenColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                const Text(
                                  "Lorem ipsum dolor sit amet consectetur. Maecenas nisi vitae a mattis sed dignissim.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            ],
          ),
        ));
  }
}
