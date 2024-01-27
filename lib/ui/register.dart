import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/widget/my_button.dart';
import 'package:travel_app/widget/my_textfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isObsecure = true;

  TextEditingController name = TextEditingController(),
      email = TextEditingController(),
      password = TextEditingController(),
      konfirmasiPassword = TextEditingController();
  bool loading = false;
  saveRegis() {
    loading = true;
    var dt = AuthController()
        .registerProses(
            name.text, email.text, password.text, konfirmasiPassword.text)
        .then((value) {
      if (value != null) {
        loading = false;
        AwesomeDialog(
          context: context,
          title: "Success",
          desc: "Register Berhasil",
          dialogType: DialogType.success,
          btnOkOnPress: () => Navigator.pushNamedAndRemoveUntil(
              context, "/login", (route) => false),
        ).show();
      } else {
        loading = false;
        AwesomeDialog(
          context: context,
          title: "Failed",
          desc: "Register Gagal",
          dialogType: DialogType.error,
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: lebar,
            child: Column(
              children: [
                SizedBox(
                  height: tinggi * 0.2,
                  child: Image.asset(
                    'assets/img/traver.png',
                    width: 200,
                  ),
                ),
                MyTextField(
                  text: 'Name',
                  controller: name,
                ),
                const SizedBox(height: 25),
                MyTextField(
                  text: 'Email',
                  controller: email,
                ),
                const SizedBox(height: 25),
                MyTextField(
                  text: 'Password',
                  controller: password,
                  obscureText: isObsecure,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObsecure = !isObsecure;
                      });
                    },
                    icon: isObsecure
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  text: 'Konfirmasi Password',
                  controller: konfirmasiPassword,
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                MyButtonWidget(
                    minimumSize: MaterialStatePropertyAll(Size(lebar * 10, 60)),
                    child: const Text(
                      'Back To Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (route) => false);
                    }),
                const SizedBox(height: 18),
                MyButtonWidget(
                  onPressed: () => saveRegis(),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.yellow),
                  minimumSize: MaterialStatePropertyAll(Size(lebar * 10, 60)),
                  child: loading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
