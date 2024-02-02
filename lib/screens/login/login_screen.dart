// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcome_login/screens/home/home_screens.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  //Code : Create controller for text field (email and password)
  final _emilController = TextEditingController(text: "644234037@prichat.skru.ac.th");
  
  //Code : Create key for form
  final _formKeyLogin = GlobalKey<FormState>();

  final _passwordController = TextEditingController(text: "password");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Code : Wrap with GestureDetector
      body: GestureDetector(
        onTap:() {
          FocusScope.of(context).unfocus();
        },
        child: Container(
            //Code : ตกแต่งพื้นหลัง
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 132, 189, 236),Color.fromARGB(255, 138, 191, 235)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
            child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Color(0x7CFFFFFF),
                // Using for responsive layout
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                    child: Column(
                      children: [
                        Image.asset("assets/images/login.png", width: 75),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            children: [
                              Text(
                                "เข้าสู่ระบบ",
                                style: TextStyle(
                                  fontFamily: "IBMPlexSansThai",
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              //Code : Wrap with Form  
                              Form(
                                //Code : Assign key to form  
                                key: _formKeyLogin,
                                child: Column(
                                  children: [
                                    //Code : TextFormField for email
                                    TextFormField(
                                      controller: _emilController,
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.orange,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                            BorderRadius.circular(40),
                                          borderSide: const BorderSide(
                                            width: 0,
                                            style: BorderStyle.none),
                                        ),
                                        filled: true,
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                      ),
                                      validator: (value) {
                                        if(value==null || value.isEmpty){
                                          return "กรุณากรอกอีเมล์";
                                        }else if (value.contains("@") == false){
                                          return "กรุณากรอกอีเมล์ให้ถูกต้อง";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    //Code : TextFormField for password
                                    TextFormField(
                                      controller: _passwordController,
                                      decoration: InputDecoration(
                                        hintText: "password",
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Colors.greenAccent,
                                        ),
                                        border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(40),
                                        borderSide: const BorderSide(
                                            width: 0,
                                            style: BorderStyle.none),
                                      ),
                                        filled: true,
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      ),
                                      validator: (value) {
                                        if(value==null || value.isEmpty){
                                          return "กรุณากรอกรหัสผ่าน";
                                        }else if (value.length < 6){
                                          return "รหัสผ่ายต้องมีความยาวมากกว่า 6 อักษร";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            //Open Forgot password screen here
                                          },
                                          child: const Text(
                                            "ลืมรหัสผ่าน ?",
                                            style: TextStyle(
                                              fontFamily: "IBMPlexSansThai",
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.lightBlueAccent,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    //Code : Login Button
                                    ElevatedButton(
                                      onPressed: () async{
                                        //Code : ตรวจสอบความถูกต้องของข้อมูล
                                        if(_formKeyLogin.currentState!.validate()){
                                          print(_emilController.text);
                                          print(_passwordController.text);
                                          final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
                                          final SharedPreferences prefs = await _prefs;
                                          prefs.setBool('loginSratus', true);
                                          prefs.setString('email', 
                                          _emilController.text);
                                          Navigator.pushReplacement(
                                            context, 
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                HomeScreen()),
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Container(
                                          height: 45,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "เข้าสู่ระบบ",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: "IBMPlexSansThai",
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    const Row(
                                      children: [
                                        Expanded(
                                            child: Divider(
                                          color: Colors.black,
                                        )),
                                        Text(
                                          " หรือเข้าสู่ระบบด้วย ",
                                          style: TextStyle(
                                            fontFamily: "IBMPlexSansThai",
                                          ),
                                        ),
                                        Expanded(
                                            child: Divider(
                                          color: Colors.black,
                                        )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            "assets/images/google.png",
                                            width: 30,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            "assets/images/facebook.png",
                                            width: 30,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            "assets/images/twitter.png",
                                            width: 30,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "ยังไม่มีบัญชีกับเรา ? ",
                                    style: TextStyle(
                                      fontFamily: "IBMPlexSansThai",
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      //Open Sign up screen here
                                    },
                                    child: const Text(
                                      "สมัครฟรี",
                                      style: TextStyle(
                                        fontFamily: "IBMPlexSansThai",
                                        color: Colors.lightBlueAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
