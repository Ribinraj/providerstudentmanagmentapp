import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:studentprovider/core/assets.dart';
import 'package:studentprovider/core/colors.dart';
import 'package:studentprovider/core/constants.dart';
import 'package:studentprovider/presentation/screens/add%20student/screen_add_student.dart';
import 'package:studentprovider/presentation/screens/studentlist/screen_student_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
           decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 108, 97, 97),
                Color.fromARGB(255, 255, 255, 255)
              ])),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                kHeight(MediaQuery.of(context).size.height * 0),
                const Text(
                  'My School',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                    
                  ),
                  textAlign: TextAlign.center,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                        child: Lottie.asset(animation),
                      ),
                        kHeight(MediaQuery.of(context).size.height * 0.04),
                    _mainPageBtn(
                      btnText: 'Add New Student',
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScreenAddStudent(),
                      )),
                      context: context,
                    ),
                    kHeight(MediaQuery.of(context).size.height * 0.04),
                    _mainPageBtn(
                      btnText: 'View All Students',
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ScreenStudentList(),
                      )),
                      context: context,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  MaterialButton _mainPageBtn(
      {required String btnText,
      required void Function()? onPressed,
      required BuildContext context}) {
    return MaterialButton(
      padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color:kBlackColor,
      textColor: kWhiteColor,
      onPressed: onPressed,
      child: Text(
        btnText,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
