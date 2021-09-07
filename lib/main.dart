import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7a_7alalk/modules/authintication/login_screen.dart';
import 'package:se7a_7alalk/modules/authintication/register_screen.dart';
import 'package:se7a_7alalk/modules/layout/home_layout.dart';
import 'package:se7a_7alalk/modules/screens/home_screen.dart';
import 'package:se7a_7alalk/shared/cubit/app_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
      ],
      child: MaterialApp(
        initialRoute: HomeLayout.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          HomeLayout.id: (context) => HomeLayout(),
          HomeScreen.id: (context) => HomeScreen(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Cairo'
        ),
        builder: (context, child) {
          return Directionality(textDirection: TextDirection.rtl, child: child);
        },
      ),
    );
  }
}
