import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    Key? key,
    this.isDefault = true,
    this.color = kWhiteColor,
    this.height = 30,
  }) : super(key: key);

  final bool isDefault;
  final Color color;
  final double height;
  @override
  Widget build(BuildContext context) {
    return isDefault
        ? Center(child: Image.asset("assets/images/ripple.gif"))
        : Center(
            child: SizedBox(
              height: height,
              child: AspectRatio(
                aspectRatio: 1,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  backgroundColor: color.withOpacity(.15),
                ),
              ),
            ),
          );
  }
}
