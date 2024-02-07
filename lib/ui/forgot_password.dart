import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/widget/my_button.dart';
import 'package:travel_app/widget/my_textfield.dart';

class LupaPasswordScreen extends StatefulWidget {
  const LupaPasswordScreen({super.key});

  @override
  State<LupaPasswordScreen> createState() => _LupaPasswordScreenState();
}

class _LupaPasswordScreenState extends State<LupaPasswordScreen> {
  TextEditingController email = TextEditingController();

  bool isLoading = false;

  saveLupaPassword() {
    setState(() {
      isLoading = true;
    });
    AuthController().lupaPasswordProses(email.text).then((value) {
      if (value != null) {
        AwesomeDialog(
          context: context,
          title: "Success",
          desc: "Silahkan Cek Email",
          dialogType: DialogType.success,
          btnOkOnPress: () => Navigator.pushNamedAndRemoveUntil(
              context, "/login", (route) => false),
        ).show();
      } else {
        setState(() {
          isLoading = false;
        });
        AwesomeDialog(
          context: context,
          title: "Failed",
          desc: "Gagal",
          dialogType: DialogType.error,
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lupa Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            MyTextField(
              controller: email,
              text: 'Email',
            ),
            const SizedBox(height: 40),
            MyButtonWidget(
              onPressed: () => saveLupaPassword(),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Kirim Email'),
            )
          ],
        ),
      ),
    );
  }
}
