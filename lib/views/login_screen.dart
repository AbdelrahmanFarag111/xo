import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac/main.dart';

import '../utils/constants.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'Login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, loginViewModel, _) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppConstants.bgColor,
              leading: IconButton(
                onPressed: () {

                },
                icon: Icon(
                  Icons.list,
                  color: Colors.white,
                  size: 40.sp,
                ),
              ),
            ),
            backgroundColor: AppConstants.bgColor,
            body: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: loginViewModel.playerOne,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.sp),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.sp),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                )),
                            labelText: 'Name For Player (X)',
                            labelStyle: AppConstants.customFontWhite
                                .copyWith(fontSize: 14.sp)),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Single Player',
                            style: AppConstants.customFontWhite
                                .copyWith(fontSize: 14),
                          ),
                          CupertinoSwitch(
                            value: loginViewModel.switchValue,
                            onChanged: (value) {
                              loginViewModel.onSwitchValueChanged(value);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Visibility(
                        visible: !loginViewModel.switchValue,
                        child: TextField(
                          controller: loginViewModel.playerTwo,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.sp),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.sp),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                )),
                            labelText: 'Name For Player (O)',
                            labelStyle: AppConstants.customFontWhite
                                .copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.sp)),
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.h)),
                        onPressed: () {
                          loginViewModel.navigateToGameScreen(context);
                        },
                        child: Text(
                          'Let\'s Go',
                          style: AppConstants.customFontWhite
                              .copyWith(color: AppConstants.bgColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
