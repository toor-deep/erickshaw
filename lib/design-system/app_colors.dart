import 'package:flutter/material.dart';


const kPrimaryColor = Color(0xFF786CE6);
const kLightPrimaryColor = Color(0x90786CE6);
const kSecondaryLightColor = Color(0xFFF0EFFF);
const kDarkColor = Color(0xFF1E293B);

const kGreenAccent = Color(0xFFE8F5F5);
const kGreenColor = Colors.green;

const kYellowAccent = Color(0xFFFBF5E7);
const kYellowColor = Color(0xFFF4C043);

const kRedAccent = Color(0xFFFBDEDE);
const kRedColor = Color(0xFFEE7674);
const kBlueAccentColor = Color(0xFF6C7BE9);

const kGreyColor = Color(0xFF8B959E);
const kLightGreyColor = Color.fromRGBO(239, 239, 239, 1);

const listColor = Color(0xFFF7F8FA);
const backArrowColor = Color(0xFF8B959E);
const titleColor = Color(0xFF323A45);
const borderColor = Color(0xFFDADADA);
const greyWhiteBg = Color.fromRGBO(242, 243, 245, 1);
const blueColor = Color(0xFF00A8FF);
const redColor = Color(0xFFF02222);
const greenColor = Color(0xFF50C25F);

List<Color> colorsList = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.pink,
  Colors.amber
];

Color fromHex(String hexString) {
  try {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  } catch (e) {
    return kGreyColor;
  }
}

extension HexColorConverter on String {
  Color toColor() => fromHex(this);
}
