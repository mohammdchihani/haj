import 'package:commerce/Singin.dart';
import 'package:commerce/screens/bottom_bar.dart';
import 'package:commerce/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/svg.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'Crud.dart';
import 'buttons/singupbutton.dart';
import 'colors.dart';
import 'endpoint.dart';
import 'inputs/textfiledemail0singup.dart';
import 'inputs/textfiledsingup0usernameval.dart';
import 'inputs/textfiledsinuppassword2.dart';
import 'inputs/textfiledsinuppassword3.dart';


class Singup extends StatefulWidget {
  Singup({Key? key}) : super(key: key);

  @override
  _SingupState createState() => _SingupState();
}

class _SingupState extends State<Singup> {

  final Crud _crud = Crud();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> signUp1() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _crud.postRequest(APIEndpoints.register, {

        "email": email.text,
        "password": password.text,
        "name": name.text,
      });
      print(response.toString());
      if (response != null) {
        print('home');
        Get.to(() =>  Singin());
      } else {
        print('Signup failed');
      }
    } catch (e) {
      print('Error during signup: $e');
      // Show AwesomeDialog for the error
      showUserExistsDialog(context);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void showUserExistsDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'المستخدم موجود بالفعل',
      titleTextStyle: TextStyle(color: MainColors.mainColor1),
      descTextStyle: TextStyle(color: MainColors.mainColor4),
      desc:
      'عنوان البريد الإلكتروني مُسجّل بالفعل. يرجى استخدام عنوان بريد إلكتروني مختلف أو تسجيل الدخول إذا كان لديك حساب بالفعل',
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }


  Widget _buildLoadingWidget() {
    return Center(
      child: Lottie.asset(
        "assets/animations/Animation - 1713222836422.json",
        height: 100.h,
        width: 100.w,
        repeat: true,
        animate: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: MainColors.mainColor4,
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: LightColors.lightColor1,
      body: isLoading ? _buildLoadingWidget() : _buildContentWidget(),
    );
  }

  Widget _buildContentWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(5), 0, 0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: LightColors.lightColor1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/Cream and Green Simple Minimalist Islamic Travel Agency Logo.svg', // Provide the correct path to your SVG file
                      height: 140.0,
                      width: 140.0,
                    ),
                    SizedBox(height: 15.h,),
                    Text(
                      " إنشاء حساب في بارع للحج",
                      style: Styles.textbig,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25.h),
                    Customuser0Field(
                      textfield: "أدخل الإسم ",
                      text: ": الإسم",
                      mycontroller: name,
                    ),
                    SizedBox(height: 10.h),
                    CustomEmailField0(
                      textfield: "أدخل البريد الالكتروني",
                      text:":البريد الالكتروني",
                      mycontroller: email,
                    ),
                    SizedBox(height: 10.h),
                    Custom4pass(
                      textfield:"ادخال كلمة السر",
                      text:":كلمة السر",
                      mycontroller:password ,
                    ),
                    SizedBox(height: 10.h),
                    Custom5pass(
                      textfield: "تأكيد كلمة السر",
                      text: ":تأكيد كلمة السر",

                    ),
                    SizedBox(height: 22.h),
                    CustomButton(
                      text: 'إنشاء',
                      onPressed: () async {
                        if (formKeyusername0.currentState!.validate() &&
                            formkeypass40.currentState!.validate() &&
                            formKey0email.currentState!.validate() &&
                            formkeypass50.currentState!.validate()) {
                          await signUp1(); // Pass the BuildContext argument here
                        }
                          // await signUp1(); // Pass the BuildContext argument here

                      },
                    ),

                 ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
