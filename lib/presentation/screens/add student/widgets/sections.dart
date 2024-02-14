import 'package:flutter/material.dart';

import 'package:studentprovider/core/assets.dart';
import 'package:studentprovider/core/colors.dart';
import 'package:studentprovider/core/constants.dart';
import 'package:studentprovider/presentation/screens/add%20student/widgets/sub_heading.dart';
import 'package:studentprovider/presentation/widgets/custom_text_field.dart';
import 'package:studentprovider/presentation/widgets/heading.dart';


Column personalInfoSection({
  required TextEditingController nameController,
  required TextEditingController rollNumberController,
  required TextEditingController studentClassController,
  required TextEditingController genderController,
  required TextEditingController phoneNumberController,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SubHeadingWidget(
        text: 'Personal details',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: kBlackColor,
      ),
      CustomTextFieldWidget(
        textInputType: TextInputType.text,
        controller: nameController,
        labelText: 'Full name',
      ),
      CustomTextFieldWidget(
        textInputType: TextInputType.text,
        controller: genderController,
        labelText: 'Gender',
      ),
      CustomTextFieldWidget(
        textInputType: TextInputType.phone,
        controller: phoneNumberController,
        labelText: 'Phone number',
      ),
      CustomTextFieldWidget(
        textInputType: TextInputType.number,
        controller: rollNumberController,
        labelText: 'Roll no.',
      ),
      CustomTextFieldWidget(
        textInputType: TextInputType.number,
        controller: studentClassController,
        labelText: 'Class',
      ),
    ],
  );
}

Row headAndImageSection(
    {required String text,
    required void Function()? onTap,
    required ImageProvider<Object> image,
    required BuildContext context}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: 18,
              child: Image.asset(
                leftArrowIcon,
                color: kBlackColor,
              ),
            ),
          ),
          kHeight(MediaQuery.of(context).size.height * 0.05),
          HeadingWidget(
            text: text,
            textColor: kDarkBlue,
          ),
        ],
      ),
      const Spacer(),
      Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.38,
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(image: image, fit: BoxFit.cover),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 6),
                    spreadRadius: 0,
                    color: Color(0x1A000000),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text('Choose Profile'),
          )
        ],
      ),
    ],
  );
}
