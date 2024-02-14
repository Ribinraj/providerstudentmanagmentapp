import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentprovider/core/colors.dart';
import 'package:studentprovider/presentation/provider/student_provider.dart';
import 'package:studentprovider/presentation/screens/add%20student/widgets/sub_heading.dart';
import 'package:studentprovider/presentation/screens/studentlist/wigets/custom_appbar.dart';
import 'package:studentprovider/presentation/screens/studentlist/wigets/list_card.dart';
import 'package:studentprovider/presentation/screens/update%20student/screen_update_student.dart';

class ScreenStudentList extends StatelessWidget {
  const ScreenStudentList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<StudentProvider>().fetchAllStudent();
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          child: const CustomAppbarWidget(),
        ),
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
            child: Consumer<StudentProvider>(
              builder: (context, studentModel, child) {
                return studentModel.allStudent.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.only(bottom: 20),
                        itemCount: studentModel.allStudent.length,
                        itemBuilder: (context, index) {
                          return ListCardWidget(
                            onpressupdate: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ScreenUpdateStudent(
                                    studentModel: studentModel.allStudent[index],
                                  ),
                                ),
                              );
                            },
                            onpressdelete: () {
                              studentModel.deleteStudent(
                                  studentModel.allStudent[index].id!);
                            },
                            studentModel: studentModel.allStudent[index],
                          );
                        },
                      )
                    : const SubHeadingWidget(
                        text: 'List is Empty!!!',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: kDarkBlue,
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
