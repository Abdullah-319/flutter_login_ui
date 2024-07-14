import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:general_user_login/widgets/custom_button.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool loading = false;

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
                onPressed: () {
                  Navigator.pop(context);
                },
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
                  "OTP",
                  style: TextStyle(
                    color: greenColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 100),
                OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  numberOfFields: 4,
                  fieldWidth: 54,
                  borderColor: greenColor,
                  borderRadius: BorderRadius.circular(999),
                  focusedBorderColor: greenColor,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         title: Text("Verification Code"),
                    //         content: Text('Code entered is $verificationCode'),
                    //       );
                    //     });
                  },
                ),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't get code? - ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Resend code",
                      style: TextStyle(
                        fontSize: 16,
                        color: greenColor,
                        decoration: TextDecoration.underline,
                        decorationColor: greenColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CustomButton(
              title: "Verify",
              onTap: () {
                setState(() {
                  loading = true;
                });
              },
              loading: loading,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
