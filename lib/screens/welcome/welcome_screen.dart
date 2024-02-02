import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcome_login/screens/login/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //Code : Key สำหรับการเปลี่ยนหน้า
  final introKey = GlobalKey<IntroductionScreenState>();

  //Code :  Intro End
  void _onIntroEnd(context) async{
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('welcomeStatus', true);
    
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  //Build Image (กำหนด path และ ขนาดของรูป)
  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    //กำหนดรูปแบบของตัวอักษร
    const bodyStyle = TextStyle(fontFamily: "IBMPlexSansThai", fontSize: 19.0);

    //กำหนดรูปแบบของหน้า
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontFamily: "IBMPlexSansThai",
          fontSize: 28.0,
          fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      //Code : Set key
      key: introKey,
      globalBackgroundColor: Colors.white,
      //Code : Header
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('logocomsci.jpg', 150),
          ),
        ),
      ),
      pages: [
        //Code : PageModels
        PageViewModel(
          title: "ยินดีต้อนรับสู่ร้านหนังสือวิทยาการคอมพิวเตอร์",
          body:
              "ร้านหนังสือที่รวบรวมหนังสือคอมพิวเตอร์ไว้เพื่อนักศึกษาวิทยาการคอมพิวเตอร์ผู้มีใจรักในสาขาวิทยาการคอมพิวเตอร์ทุกคน",
          image: _buildImage("1.jpg"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "24/7 375",
          body:
              "เปิดทำการ \n24 ชั่วโมงต่อวัน 7 วันต่อสัปดาห์\n 365 วันต่อปี ... ร้านหนังสือที่เปิดทุกวัน ทุกเดือน ทุกปี ไม่มีวันหยุด",
          image: _buildImage('2.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          body:
              "พบกับร้านหนังสือที่รวบรวมหนังสือวิทยาการคอมพิวเตอร์ไว้มากที่สุด ไม่ว่าจะเป็นหนังสือเกี่ยวกับการพัฒนาโมบายแอปพลิเคชัน การพัฒนาเว็บแอปพลิเคชัน ปัญญาประดิษฐ์ วิทยาการข้อมูล อัลกอริทึม และอีกมากมาย",
          image: _buildImage('3.jpg'),
          decoration: pageDecoration,
        ),
        //เพิ่มหน้า
        PageViewModel(
          title: "",
          body:
              "แอปพลิเคชันขายหนังสือของเราเสนอเนื้อหาที่ไม่มีวันลดคุณค่า พัฒนาทักษะ, ทำให้ความรู้ของคุณขยายตัวอย่างที่ไม่เคยเป็นมาก่อน",
          image: _buildImage('4.jpeg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          body:
              "แอปของเราช่วยให้คุณสามารถนำความรู้และจินตนาการของคุณมาแบ่งปันกับผู้ใช้คนอื่นได้อย่างง่ายดาย พบกับชุดหนังสือที่ท้าทายความคิดของคุณและเปลี่ยนแปลงโลกไปพร้อมกับเรา",
          image: _buildImage('5.jpeg'),
          decoration: pageDecoration,
        ),
      ],

      //Code : On Intro End button and function
      onDone: () => _onIntroEnd(context),
      //Code : On Intro Skip button and function
      onSkip: () => _onIntroEnd(context),

      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      showDoneButton: true,
      showSkipButton: true,

      back: const Icon(Icons.arrow_back),
      //Code : Show skip button
      skip: const Text("ข้าม",
          style: TextStyle(
              color: Colors.blue,
              fontFamily: "IBMPlexSansThai",
              fontWeight: FontWeight.w600)),
      done: const Text("เสร็จสิ้น"),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.blueAccent,
      ),
      //Code : Show done button
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: Colors.blueAccent,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
