import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentprovider/core/assets.dart';
import 'package:studentprovider/core/colors.dart';
import 'package:studentprovider/core/constants.dart';
import 'package:studentprovider/presentation/provider/image_picker_provider.dart';
import 'package:studentprovider/presentation/screens/add%20student/widgets/custombutton.dart';
import 'package:studentprovider/presentation/screens/add%20student/widgets/sections.dart';

class ScreenAddStudent extends StatelessWidget {
  ScreenAddStudent({super.key});

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final rollNumberController = TextEditingController();
  final studentClassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 108, 97, 97),
              Color.fromARGB(255, 255, 255, 255)
            ])),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  kHeight(MediaQuery.of(context).size.height * 0.04),
                  Consumer<ImagePickerProvider>(
                      builder: (context, imageProvider, child) {
                    return headAndImageSection(
                      context: context,
                      text: 'Add New \nStudent Info?',
                      onTap: () {
                        imageProvider.pickImageFromGallery();
                      },
                      image: imageProvider.image.path == ''
                          ? Image.asset(
                              management,
                              color: kDarkBlue,
                            ).image
                          : Image.file(
                              imageProvider.image,
                            ).image,
                    );
                  }),
                  kHeight(MediaQuery.of(context).size.height * 0.04),
                  personalInfoSection(
                    nameController: nameController,
                    rollNumberController: rollNumberController,
                    studentClassController: studentClassController,
                    genderController: genderController,
                    phoneNumberController: phoneNumberController,
                  ),
                
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: CustomAddButton(
        nameController: nameController,
        genderController: genderController,
        phoneNumberController: phoneNumberController,
        rollNumberController: rollNumberController,
        studentClassController: studentClassController,
        formkey: formKey,
      ),
    );
  }
}
