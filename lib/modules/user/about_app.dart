import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_cubit.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_states.dart';
import 'package:se7a_7alalk/shared/constants.dart';

class AboutAppScreen extends StatelessWidget {
  static const String id = "/AboutAppScreen";
  String aboutAppText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'aboutApp'.tr(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: kAppGradient,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    )),
                height: MediaQuery.of(context).size.height * 0.6,
              )
            ],
          ),
          Positioned(
            width: 130,
            height: 130,
            top: 130,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
          ),
          Positioned(
            top: 280,
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'aboutApp'.tr(),
                          style: TextStyle(
                              color: kAppColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    BlocBuilder<AppCubit, AppStates>(
                      bloc: AppCubit()
                        ..getAboutApp().then((value) {
                          aboutAppText = value["about"][0]["body"];
                        }),
                      builder: (context, state) {
                        return Container(
                          child: Text(
                            aboutAppText ?? "",
                            style: TextStyle(fontSize: 13, color: kAppColor),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
