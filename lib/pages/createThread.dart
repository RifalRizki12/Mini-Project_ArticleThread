// import 'package:app/widgets/ThreadBarucard.dart';

import "package:mini_project/widget/custombutton.dart";
import 'package:flutter/gestures.dart';

import '../style.dart';
import '../widget/custombutton.dart';
import '../widget/popupsuccess.dart';
import '../widget/menu.dart';
import '../widget/popupoption.dart';

import 'package:flutter/material.dart';

import '../provider/threadprovider.dart';

class ThreadBaruPage extends StatefulWidget {
  const ThreadBaruPage({Key? key}) : super(key: key);

  @override
  State<ThreadBaruPage> createState() => _ThreadBaruPageState();
}

class _ThreadBaruPageState extends State<ThreadBaruPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();

  bool _notif = false;
  late ThreadProvider threadprovider;

  @override
  void initState() {
    threadprovider = new ThreadProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/metrodata.png",
          width: 150,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeEndDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openEndDrawer();
                //open drawer, if drawer is closed
              }
            },
            icon: Icon(
              Icons.menu,
              size: 30,
            ),
            color: Styles.black,
          )
        ],
      ),
      endDrawer: Menu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Membuat Topik Baru",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _title,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(209, 213, 219, 1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(209, 213, 219, 1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintText: "Judul",
                        hintStyle: Styles.inputTextHintDefaultTextStyle,
                        filled: true,
                        fillColor: Color.fromRGBO(249, 250, 251, 1)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _content,
                    maxLines: 8,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(209, 213, 219, 1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(209, 213, 219, 1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintText: "Tulis Postingan",
                        hintStyle: Styles.inputTextHintDefaultTextStyle,
                        filled: true,
                        fillColor: Color.fromRGBO(249, 250, 251, 1)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // DropdownButtonFormField<String>(
                  //   value: _selectedCategory,
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       _selectedCategory = newValue;
                  //     });
                  //   },
                  //   items:
                  //       categories.map<DropdownMenuItem<String>>((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  //   decoration: InputDecoration(
                  //       contentPadding:
                  //           EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                  //       focusedBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //               color: Color.fromRGBO(209, 213, 219, 1)),
                  //           borderRadius: BorderRadius.all(Radius.circular(12))),
                  //       border: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //               color: Color.fromRGBO(209, 213, 219, 1)),
                  //           borderRadius: BorderRadius.all(Radius.circular(12))),
                  //       hintText: "Kategori",
                  //       hintStyle: Styles.inputTextHintDefaultTextStyle,
                  //       filled: true,
                  //       fillColor: Color.fromRGBO(249, 250, 251, 1)),
                  //   style: Styles.inputTextDefaultTextStyle,
                  // ),
                  Row(
                    children: [
                      Checkbox(
                        value: _notif,
                        onChanged: (value) {
                          setState(() {
                            _notif = value!;
                          });
                        },
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0))),
                      ),
                      Text("Kirim notifikasi balasan topik anda",
                          style: Styles.detailTextStyle),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    CustomButton(
                      style: TextStyle(
                        color: Styles.blue,
                        fontSize: 14,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      text: "Batal",
                      label: "Batal",
                      bColor: Styles.bgcolor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CustomButton(
                      onPressed: () {
                        PopupOption.alertDialog(context,
                            message: "Are you sure the thread was created?",
                            onPressedNo: () {
                          Navigator.pop(context);
                        }, onPressedYes: () {
                          onCreate(context);
                        });
                      },
                      text: "Post",
                      label: "Post",
                    ),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onCreate(BuildContext context) async {
    print("object");

    dynamic result = await threadprovider.createthread(
      _title.text,
      _content.text,
    );
    if (result != null && result['message'] == "Success") {
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/thread');
    } else {
      print("error123");
    }
  }
}
