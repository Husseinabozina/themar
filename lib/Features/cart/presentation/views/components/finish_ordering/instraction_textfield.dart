import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InstructionTextField extends StatelessWidget {
  const InstructionTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 117.h,
      child: TextField(
        maxLines: 7,
        decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    style: BorderStyle.none, color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(15)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
