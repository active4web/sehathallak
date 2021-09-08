import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7a_7alalk/modules/layout/home_layout.dart';
import 'package:se7a_7alalk/shared/components/app_routes.dart';
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
        routes: routes,
        title: 'Seha Hlalk',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Color(0xffF9F9F9),
            fontFamily: 'Cairo'),
        builder: (context, child) {
          return Directionality(textDirection: TextDirection.rtl, child: child);
        },
      ),
    );
  }
}
