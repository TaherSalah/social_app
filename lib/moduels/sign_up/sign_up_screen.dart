import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/components/component.dart';
import '../../shared/components/validate.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  bool isPassword=true;
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset('assets/image/upLogin.png'),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 90,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Sign Up',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Enter your credentials to continue',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: HexColor('7C7C7C')),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onTap: () {},
                  validator: Validator.name,
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor('E2E2E2'))),
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onTap: () {},
                  validator: Validator.email,
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor('E2E2E2'))),
                      prefixIcon: const Icon(Icons.email)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: isPassword,
                  keyboardType: TextInputType.visiblePassword,
                  onTap: () {},
                  validator: Validator.password,

                  // controller: TextEditingController(),
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor('E2E2E2'))),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        icon: Icon(
                            isPassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                      )),
                ),
              ),
            ),
            Stack(
              children: [
                Image.asset('assets/image/upLogin.png'),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    defualtButton(
                        context: context,
                        name: 'Sign up',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        color: Colors.white),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? '),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                            },
                            child: Text(
                              'Sing in',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: HexColor('53B175')),
                            )),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ) ,
    );
  }
}
