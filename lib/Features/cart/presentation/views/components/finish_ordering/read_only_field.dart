import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReadOnlyTextField extends StatelessWidget {
  const ReadOnlyTextField({super.key, required this.title, required this.icon});
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.h,
        child: TextField(
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
              hintText: title,
              hintTextDirection: TextDirection.rtl,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              // label: Padding(
              //   padding: EdgeInsets.only(left: 100),
              //   child: Text(
              //     title,
              //     textDirection: TextDirection.rtl,
              //   ),
              // ),
              prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(icon)),
              prefixIconConstraints: BoxConstraints(),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: Colors.grey.shade200, width: 0.5))),
        ));
  }
}
