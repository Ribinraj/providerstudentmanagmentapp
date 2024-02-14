import 'dart:io';
import 'package:flutter/material.dart';
import 'package:studentprovider/core/constants.dart';
import 'package:studentprovider/data/model/student.dart';

class ListCardWidget extends StatelessWidget {
  const ListCardWidget({
    super.key,
    required this.studentModel,
    required this.onpressupdate,
    required this.onpressdelete,
  });

  final StudentModel studentModel;
  final void Function()? onpressupdate;
  final void Function()? onpressdelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 196, 184, 184),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 0),
            spreadRadius: 2,
            color: Color(0x0D000000),
          )
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.14,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: FileImage(File(studentModel.profile!)),
            ),
            kWidth(MediaQuery.of(context).size.width * 0.03),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  studentModel.name!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(studentModel.gender!),
                Text(studentModel.studentClass!),
                Text(studentModel.rollNumber!),
                Text(studentModel.phoneNumber!),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: onpressupdate, icon: const Icon(Icons.edit)),
                IconButton(
                    onPressed: onpressdelete, icon: const Icon(Icons.delete))
              ],
            )
          ],
        ),
      ),
    );
  }
}
