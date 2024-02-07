import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/widget/my_button.dart';
import 'package:travel_app/widget/my_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isObsecure = true;

  TextEditingController email = TextEditingController(),
      password = TextEditingController();

  bool loading = false;

  saveLogin() {
    setState(() {
      loading = true;
    });

    AuthController().loginProses(email.text, password.text).then((value) {
      if (value != null) {
        AwesomeDialog(
          context: context,
          title: "Success",
          desc: "Login as ${email.text}",
          dialogType: DialogType.success,
          btnOkOnPress: () =>
              Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false),
        ).show();
      } else {
        setState(() {
          loading = false;
        });
        AwesomeDialog(
          context: context,
          title: "Failed",
          desc: "Login Gagal",
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
                  text: 'Email',
                  controller: email,
                ),
                const SizedBox(height: 25),
                MyTextField(
                  text: 'password',
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        const Text('Remember Me')
                      ],
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/lupapw'),
                      child: const Text('Forgot Password'),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                MyButtonWidget(
                  onPressed: () => Navigator.pushNamed(context, '/register'),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 18),
                MyButtonWidget(
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.yellow),
                  onPressed: () => saveLogin(),
                  child: loading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.grey.shade200,
                      child: Image.asset('assets/img/ig.png', height: 100),
                    ),
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.grey.shade200,
                      child: Image.asset('assets/img/google.png', height: 100),
                    ),
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.grey.shade200,
                      child: Image.asset('assets/img/fb.png', height: 100),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
