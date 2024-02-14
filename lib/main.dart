import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:studentprovider/presentation/provider/image_picker_provider.dart';
import 'package:studentprovider/presentation/provider/student_provider.dart';
import 'package:studentprovider/presentation/screens/mainscreen/main_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StudentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ImagePickerProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Student Management',
        debugShowCheckedModeBanner: false,
        theme:  ThemeData(fontFamily: 'NetflixSans', primarySwatch: Colors.grey),
        home: const MainScreen(),
      ),
    );
  }
}
