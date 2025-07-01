import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekdays_buttons/weekdays_screen/view/button_screen.dart';
import 'package:weekdays_buttons/weekdays_screen/viewModel/view_model.dart';

import 'complete_profile_screen/view/complete_profile_screen.dart';
import 'complete_profile_screen/viewModel/complete_profile_viewModel.dart';


void main() {
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> DoctorProfileViewModel()),
      ChangeNotifierProvider(create: (_)=> DayViewModel())

    ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home:DoctorProfileScreen()
    );
  }
}

