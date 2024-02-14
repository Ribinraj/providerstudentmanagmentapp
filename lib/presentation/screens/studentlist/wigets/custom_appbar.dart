import 'package:flutter/material.dart';
import 'package:studentprovider/core/assets.dart';
import 'package:studentprovider/core/colors.dart';
import 'package:studentprovider/core/constants.dart';
import 'package:studentprovider/presentation/widgets/heading.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDarkBlue,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 5),
                    width: 18,
                    child: Image.asset(
                      leftArrowIcon,
                      color: kWhiteColor,
                    ),
                  ),
                ),
                kWidth(MediaQuery.of(context).size.width * 0.05),
                const HeadingWidget(
                  text: 'List of Students',
                  textColor: kWhiteColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
