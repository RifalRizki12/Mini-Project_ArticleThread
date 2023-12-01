import 'package:flutter/material.dart';
import 'package:mini_project/pages/article.dart';
import 'package:mini_project/provider/authprovider.dart';
import 'package:mini_project/widget/customtextfield.dart';
import 'package:mini_project/pages/register.dart';
import 'package:mini_project/style.dart';
import 'package:mini_project/widget/custombutton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscure = true;
  late AuthProvider authProvider;

  @override
  void initState() {
    authProvider = AuthProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(60),
              width: double.infinity,
              height: 222,
              decoration: const ShapeDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/baner.jfif"),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        Color.fromRGBO(113, 157, 223, 0.7), BlendMode.srcATop)),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFD1D5DB)),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                ),
              ),
              child: Image.asset(
                "assets/metrodata.png",
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Column(
              children: [
                const Text('Selamat Datang', style: Styles.text32),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(children: [
                    CustomTextField(
                      label: "Email",
                      controller: _email,
                      hint: "Masukkan Email",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      label: "Password",
                      controller: _password,
                      hint: "Masukkan Password",
                      obscureText: _obscure,
                      sufficIcon: IconButton(
                        icon: const Icon(
                          Icons.visibility,
                          color: Styles.lightgrey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscure = !_obscure;
                          });
                        },
                      ),
                    )
                  ]),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    minimumsize: Size(300, 50),
                    label: 'Masuk',
                    onPressed: () {
                      onLogin(context);
                    },
                  ),
                  const Text("\nbelum punya akun metrodata academy ?"),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ));
                    },
                    child: const Text(
                      "Daftar Sekarang !",
                      style: Styles.linktext10,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  onLogin(BuildContext context) async {
    dynamic result = await authProvider.login(_email.text, _password.text);
    if (result != null && result["message"] == "Success") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ArticlePage()));
    } else if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result["message"]),
        duration: Duration(seconds: 3),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("error!"),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
