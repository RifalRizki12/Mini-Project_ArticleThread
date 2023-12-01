import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_project/provider/authprovider.dart';
import 'package:mini_project/widget/customtextfield.dart';
import 'package:mini_project/style.dart';
import 'package:mini_project/widget/custombutton.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _namaLengkap = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _tanggalLahir = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  String? _jenisKelamin;

  bool obscurePassword = true;
  bool obscurePasswordConfirm = true;
  bool isPassword8c = true;
  bool isPasswordCapital = true;
  bool truePassword = true;

  bool get isRegistrationEnable =>
      _confirmPassword.text.isNotEmpty &&
      _password.text.isNotEmpty &&
      _namaLengkap.text.isNotEmpty &&
      _username.text.isNotEmpty &&
      _email.text.isNotEmpty &&
      _jenisKelamin != null &&
      _tanggalLahir.text.isNotEmpty &&
      isPassword8c &&
      isPasswordCapital &&
      truePassword;

  late AuthProvider authProvider;

  @override
  void initState() {
    authProvider = AuthProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: ListView(
          children: [
            Text(
              "Daftar Akun Baru",
              style: Styles.text32,
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextField(
                label: "Nama Lengkap",
                hint: "Nama Lengkap",
                controller: _namaLengkap),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
                label: "Username", hint: "Username", controller: _username),
            SizedBox(
              height: 15,
            ),
            CustomTextField(label: "Email", hint: "Email", controller: _email),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                      label: "Tanggal Lahir",
                      hint: "YYYY-MM-DD",
                      sufficIcon: IconButton(
                          onPressed: () {
                            SelectDate(context);
                          },
                          icon: Icon(
                            Icons.calendar_today,
                            color: Colors.black,
                          )),
                      controller: _tanggalLahir),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jenis Kelamin",
                      style: Styles.labelTextField,
                    ),
                    DropdownButtonFormField<String>(
                      value: _jenisKelamin,
                      onChanged: (value) {
                        setState(() {
                          _jenisKelamin = value!;
                        });
                      },
                      items: <String>['Laki-Laki', 'Perempuan']
                          .map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: "Pilih",
                          filled: true,
                          fillColor: Styles.bgtextField),
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextField(
              label: "password",
              hint: "Masukkan Password",
              controller: _password,
              onChanged: (value) {
                setState(() {
                  CheckPassword(value);
                });
              },
              obscureText: obscurePassword,
              sufficIcon: IconButton(
                icon: const Icon(
                  Icons.visibility,
                  color: Styles.lightgrey,
                ),
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                if (isPassword8c == false)
                  Expanded(
                      child: RichText(
                    text: TextSpan(
                      style: Styles.text10,
                      children: [
                        TextSpan(
                            text: "*", style: TextStyle(color: Colors.red)),
                        TextSpan(text: "Panjang Minimal 8 character")
                      ],
                    ),
                  )),
                if (isPasswordCapital == false)
                  Expanded(
                      child: RichText(
                    text: TextSpan(
                      style: Styles.text10,
                      children: [
                        TextSpan(
                            text: "*", style: TextStyle(color: Colors.red)),
                        TextSpan(text: "mengandung minimal 1 huruf kapital")
                      ],
                    ),
                  )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: "confirm password",
              hint: "Masukkan confirm Password",
              controller: _confirmPassword,
              obscureText: obscurePasswordConfirm,
              sufficIcon: IconButton(
                icon: const Icon(
                  Icons.visibility,
                  color: Styles.lightgrey,
                ),
                onPressed: () {
                  setState(() {
                    obscurePasswordConfirm = !obscurePasswordConfirm;
                  });
                },
              ),
              onChanged: (value) {
                setState(() {
                  if (_password.text != value) {
                    truePassword = false;
                  } else {
                    truePassword = true;
                  }
                });
              },
            ),
            if (truePassword == false)
              RichText(
                text: TextSpan(
                  style: Styles.text10,
                  children: [
                    TextSpan(text: "*", style: TextStyle(color: Colors.red)),
                    TextSpan(text: "Password tidak sama")
                  ],
                ),
              ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              label: 'Daftar',
              onPressed: () {
                onRegister(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> SelectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (picked != null && picked != _tanggalLahir) {
      final formattedDate = DateFormat("yyyy-MM-dd").format(picked);
      setState(() {
        _tanggalLahir.text = formattedDate;
      });
    }
  }

  CheckPassword(String password) {
    bool _isPassword8c = password.length >= 8;
    bool _isPasswordCapital = password.contains(RegExp(r'[A-Z]'));
    isPassword8c = _isPassword8c;
    isPasswordCapital = _isPasswordCapital;
  }

  onRegister(BuildContext context) async {
    if (isRegistrationEnable) {
      dynamic result = await authProvider.register(
          _email.text,
          _username.text,
          _jenisKelamin!,
          _tanggalLahir.text,
          _password.text,
          _namaLengkap.text);
      if (result != null && result["message"] == "Success") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Register Success !!!"),
          duration: Duration(seconds: 3),
        ));
        Navigator.pop(context);
      } else if (result == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("failed"),
          duration: Duration(seconds: 3),
        ));
      } else if (result != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(result["message"]),
          duration: Duration(seconds: 3),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please fill all field !"),
        duration: Duration(seconds: 3),
      ));
      print("register gagal !");
    }
  }
}
