import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

String googleApiKey = '';

const kPrimary = Color(0xFF30b9b2);
const kPrimaryLight = Color(0xFF40F3EA);
const kSecondary = Color(0xffffa44f);
const kSecondaryLight = Color(0xFFffe5db);
const kTertiary = Color(0xff0078a6);
const kGray = Color(0xff83829A);
const kGrayLight = Color(0xffC1C0C8);
const kLightWhite = Color(0xffFAFAFC);
const kWhite = Color(0xfffFFFFF);
const kDark = Color(0xff000000);
const kRed = Color(0xffe81e4d);
const kOffWhite = Color(0xffF3F4F8);

double height = 825.h;
double width = 375.w;

const String appBaseUrl = "http://localhost:6013";

final List<String> verificationReasons = [
  'Instant Notifications: Receive real-time updates on your order status, keeping you informed every step of the way.',
  'Seamless Communication: Enjoy hassle-free communication with a verified number, ensuring smooth interactions.',
  'Enhanced Security: Safeguard your account and confirm orders with top-notch security measures.',
  'Effortless Rescheduling: Address any issues promptly with a quick and easy call.',
  'Exclusive Offers: Be the first to know about special deals and promotions, staying ahead of the curve.'
];
