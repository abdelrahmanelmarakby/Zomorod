// ignore_for_file: library_private_types_in_public_api

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:zomorod/core/services/get_storage_helper.dart';

import '../../../data/api/auth_apis.dart';
import '../../../data/models/sign_in_model.dart';
import '../../../data/models/signup_model.dart';
import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;
  bool isLogin = true;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  void initState() {
    Get.put(LoginController());
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(const Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 14, 28),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                top: size.height * (animation2.value + .58),
                left: size.width * .21,
                child: CustomPaint(
                  painter: MyPainter(50),
                ),
              ),
              Positioned(
                top: size.height * .98,
                left: size.width * .1,
                child: CustomPaint(
                  painter: MyPainter(animation4.value - 30),
                ),
              ),
              Positioned(
                top: size.height * .5,
                left: size.width * (animation2.value + .8),
                child: CustomPaint(
                  painter: MyPainter(30),
                ),
              ),
              Positioned(
                top: size.height * animation3.value,
                left: size.width * (animation1.value + .1),
                child: CustomPaint(
                  painter: MyPainter(60),
                ),
              ),
              Positioned(
                top: size.height * .1,
                left: size.width * .8,
                child: CustomPaint(
                  painter: MyPainter(animation4.value),
                ),
              ),
              Positioned(
                bottom: size.height * .3,
                left: size.width * .3,
                child: CustomPaint(
                  painter: MyPainter(animation1.value),
                ),
              ),
              Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height * .1),
                      child: const Text(
                        'Zomrod',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          wordSpacing: 4,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (!isLogin)
                          FadeIn(
                            duration: const Duration(milliseconds: 800),
                            child: component1(
                                name,
                                Icons.account_circle_outlined,
                                'User name...',
                                false,
                                true),
                          ),
                        component1(email, Icons.alternate_email_outlined,
                            'Email...', false, false),
                        component1(password, Icons.lock_outline, 'Password...',
                            true, false),
                        if (!isLogin)
                          component1(confirmPassword, Icons.lock_outline,
                              'Confirm password...', true, false),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FadeIn(
                              child: component2(
                                isLogin ? 'LOGIN' : 'Register'.toUpperCase(),
                                2.58,
                                () async {
                                  if ((confirmPassword.text != password.text) &&
                                      isLogin != true) {
                                    Fluttertoast.showToast(
                                        msg:
                                            'confirm password and password mismatch');
                                    return;
                                  }
                                  if (!email.text.isEmail) {
                                    Fluttertoast.showToast(
                                        msg: 'Email is not correct');
                                    return;
                                  }
                                  if (password.text.length < 6) {
                                    Fluttertoast.showToast(
                                        msg:
                                            'password should be 6 digits at least');
                                    return;
                                  }
                                  if (isLogin) {
                                    SigninModel? model = await AuthApis.login(
                                        email: email.text,
                                        password: password.text);
                                    if (model?.error != null) {
                                      BotToast.showText(
                                          text: model!.error ??
                                              "Something went wrong");
                                    } else {
                                      CacheHelper.cacheToken(
                                          token: model?.accessToken ?? "");
                                      Get.toNamed(Routes.HOME);
                                    }
                                  } else {
                                    SignupModel? model =
                                        await AuthApis.register(
                                            name: name.text,
                                            email: email.text,
                                            password: password.text);
                                    if (model?.error != null) {
                                      BotToast.showText(
                                          text: model!.error ??
                                              "Something went wrong");
                                    } else {
                                      CacheHelper.cacheToken(
                                          token: model?.authorisation?.token ??
                                              "");
                                      Get.toNamed(Routes.HOME);
                                    }
                                  }
                                  HapticFeedback.lightImpact();
                                },
                              ),
                            ),
                            SizedBox(width: isLogin ? size.width / 20 : 0),
                            isLogin
                                ? FadeIn(
                                    duration: const Duration(milliseconds: 800),
                                    child: component2(
                                      'Forgotten password!',
                                      2.58,
                                      () {
                                        HapticFeedback.lightImpact();
                                        Fluttertoast.showToast(
                                            msg:
                                                'Forgotten password button pressed');
                                      },
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        component2(
                          'Create a new Account',
                          2,
                          () {
                            HapticFeedback.lightImpact();
                            setState(() {
                              isLogin = !isLogin;
                            });
                          },
                        ),
                        SizedBox(height: size.height * .05),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget component1(TextEditingController controller, IconData icon,
      String hintText, bool isPassword, bool isEmail) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          height: size.width / 8,
          width: size.width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: controller,
            style: TextStyle(color: Colors.white.withOpacity(.8)),
            cursorColor: Colors.white,
            obscureText: isPassword,
            keyboardType:
                isEmail ? TextInputType.emailAddress : TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.white.withOpacity(.7),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: hintText,
              filled: true,
              fillColor: Colors.transparent,
              hintStyle:
                  TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5)),
            ),
          ),
        ),
      ),
    );
  }

  Widget component2(String string, double width, VoidCallback voidCallback) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: voidCallback,
          child: Container(
            height: size.width / 8,
            width: size.width / width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              string,
              style: TextStyle(color: Colors.white.withOpacity(.8)),
            ),
          ),
        ),
      ),
    );
  }

  Widget component3(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 1, sigmaX: 1),
          child: Container(
            child: child,
          )),
    );
  }
}

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
              colors: [Color(0xff346751), Color(0xff003545)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: const Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
