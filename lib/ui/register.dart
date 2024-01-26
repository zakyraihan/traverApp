import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isObsecure = true;

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
                Container(
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.yellow,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.yellow,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.yellow,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
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
                    obscureText: isObsecure,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Konfirmasi Password',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.yellow,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(lebar * 10, 60)),
                    shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false),
                  child: const Text(
                    'Back To Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.yellow),
                    minimumSize: MaterialStatePropertyAll(Size(lebar * 10, 60)),
                    shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
