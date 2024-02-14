import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentprovider/core/colors.dart';
import 'package:studentprovider/core/constants.dart';
import 'package:studentprovider/data/model/student.dart';
import 'package:studentprovider/presentation/provider/image_picker_provider.dart';
import 'package:studentprovider/presentation/provider/student_provider.dart';
import 'package:studentprovider/presentation/screens/add%20student/widgets/sections.dart';

class ScreenUpdateStudent extends StatefulWidget {
  const ScreenUpdateStudent({
    super.key,
    required this.studentModel,
  });

  final StudentModel studentModel;

  @override
  State<ScreenUpdateStudent> createState() => _ScreenUpdateStudentState();
}

class _ScreenUpdateStudentState extends State<ScreenUpdateStudent> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final rollNumberController = TextEditingController();
  final studentClassController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.studentModel.name!;

    genderController.text = widget.studentModel.gender!;
    phoneNumberController.text = widget.studentModel.phoneNumber!;

    rollNumberController.text = widget.studentModel.rollNumber!;
    studentClassController.text = widget.studentModel.studentClass!;
  }

  @override
  Widget build(BuildContext context) {
    final studentProvider =
        Provider.of<StudentProvider>(context, listen: false);
    final imagePickerProvider =
        Provider.of<ImagePickerProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 108, 97, 97),
                Color.fromARGB(255, 255, 255, 255)
              ])),
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
                      text: 'Edit Student \nInfo',
                      onTap: () {
                        imageProvider.pickImageFromGallery();
                      },
                      image: imageProvider.image.path == ''
                          ? Image.file(
                              File(widget.studentModel.profile!),
                            ).image
                          : Image.file(imageProvider.image).image,
                    );
                  }),
                  kHeight(MediaQuery.of(context).size.height * 0.04),
                  personalInfoSection(
                    nameController: nameController,
                    genderController: genderController,
                    phoneNumberController: phoneNumberController,
                    rollNumberController: rollNumberController,
                    studentClassController: studentClassController,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: MaterialButton(
          minWidth: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.07,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: kDarkBlue,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              studentProvider.updateStudent(StudentModel(
                id: widget.studentModel.id,
                name: nameController.text,
                gender: genderController.text,
                phoneNumber: phoneNumberController.text,
                profile: imagePickerProvider.image.path == ''
                    ? widget.studentModel.profile
                    : imagePickerProvider.image.path,
                rollNumber: rollNumberController.text,
                studentClass: studentClassController.text,
              ));
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Student details updated'),
                  backgroundColor: kBlueGrey,
                  margin: EdgeInsets.all(15),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Must fill all the fields'),
                  backgroundColor: kBlueGrey,
                  margin: EdgeInsets.all(15),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          child: const Text(
            'Update',
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
