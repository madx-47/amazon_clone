import 'dart:ui';

import 'package:flutter/material.dart';

const Color gray = Color(0xFF787878);
const Color white = Color(0xFFFFFFFF);
const Color black = Color(0xFF000000);

const appBarGradient = LinearGradient(
  colors: [
    Color.fromARGB(255, 29, 201, 192),
    Color.fromARGB(255, 125, 221, 216),
  ],
  stops: [0.5, 1.0],
);

 const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
 const backgroundColor = Colors.white;
 const Color greyBackgroundCOlor = Color(0xffebecee);
 var selectedNavBarColor = Colors.cyan[800]!;
 const unselectedNavBarColor = Colors.black87;


// const Color red = Color(0xffea5e4c);
// const Color red1 = Color(0xffcb2f16);
// const Color red2 = Color(0xffc23e2a);
// const Color redLight = Color(0xffFFD5D5);
//
// const Color themeColor = Color(0xff006DB6);
// const Color themeColorLight = Color(0xff0883D6);
// const Color themeColorAlpha10 = Color(0x1a006db6);
// const Color themeColorAlpha15 = Color(0x26006DB6);
// const Color themeColorAlpha30 = Color(0x4d006DB6);
// const Color themeColorAlpha50 = Color(0x80006DB6);
// const Color viewColor = Color(0xFFEEEEEE);
// const Color editTextColor = Color(0xFFE5E5E5);
// const Color editTextColor1 = Color(0xFFD0D0D0);
// const Color editTextColor2 = Color(0xFFBBBBBB);
// const Color editTextColor3 = Color(0xFFA9A9A9);
//
// const Color orange = Color(0xFFf89a2d);
// const Color grayText = Color(0xFF8A8A8A);
// const Color backgroundSettings = Color(0xFFF2F2F2);
// const Color adView = Color(0xFF203354);
// const Color audioBackground = Color(0xFF5172A4);
//
// const Color backgroundWhite = Color(0xFFf5f5f5);
// const Color selectedPoll = Color(0xFF4D75B0);
// const Color unselectedPoll = Color(0xFF7795C5);
// const Color themeColorAlpha69 = Color(0xb018333f);
// const Color unselected = Color(0xFFA9A9A9);
// const Color buttonBackground = Color(0xFFEAEAEA);
// const Color dotColor = Color(0xFFD9D9D9);
// const Color linkColor = Color(0xFF8FACB6);
// const Color storyColor = Color(0xFFDE0F0F);
// const Color textBlueColor = Color(0xFF3897F0);
// const Color bottomSheetColor = Color(0xFFF3F3F3);
// const Color dropdownGray = Color(0xFF1A1A1A);
//
// const Color blackSimmer1 = Color(0xFF101010);
// const Color blackSimmer2 = Color(0xFF1C1C1C);
//
// const Color green = Color(0xFF64B058);
// const Color greenAlpha = Color(0x2664B058);
//
// const Color redd = Color(0xFFED0000);
// const Color redAlpha = Color(0x26ED0000);
//
// const Color mapPinGreen = Color(0xFF8AC624);
//
// const Color cyan = Color(0xFF3EAF94);
// const Color offWhite = Color(0xFFF5F5F5);
// const Color transparent = Color(0xf9f9fb);