import 'package:cashier/app/data/models/profile_model.dart';
import 'package:cashier/app/modules/authentication/controllers/auth_controller.dart';
import 'package:cashier/app/modules/event/controllers/event_controller.dart';
import 'package:cashier/app/modules/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  final AuthController authController = Get.put(AuthController());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final EventController themeController = Get.put(EventController());

  RegisterView({Key? key}) : super(key: key);

  Future<void> _submitProfile() async {
    Profile newProfile = Profile(
      nama: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
    );

    await authController.registerUser(
      emailController.text,
      passwordController.text,
      newProfile,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 60,
                ),
                SizedBox(height: 10),
                Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 0),
                Text(
                  'add new cashier account',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 80),
                Container(
                  width: 350,
                  height: 55,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF3F2F2),
                      labelText: 'Full name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 17.0),
                        child: Image.asset(
                          'assets/name.png',
                          width: 35,
                          height: 35,
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 350,
                  height: 55,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF3F2F2),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 17.0),
                        child: Image.asset(
                          'assets/mail.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 350,
                  height: 55,
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF3F2F2),
                      labelText: 'Phone number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 17.0),
                        child: Image.asset(
                          'assets/phone.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 350,
                  height: 55,
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF3F2F2),
                      labelText: 'Strong password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 17.0),
                        child: Image.asset(
                          'assets/lock.png',
                          width: 35,
                          height: 32,
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: _submitProfile,
                  style: ElevatedButton.styleFrom(
                    primary: themeController.isKemerdekaanTheme.value
                        ? Color(0xFFe6292f)
                        : themeController.isIdulFitriTheme.value
                            ? Color(0xFF308c1d)
                            : Color(0xFFCD2B21),
                    onPrimary: Colors.white,
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 145.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
