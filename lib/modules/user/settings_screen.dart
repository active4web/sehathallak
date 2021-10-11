import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7a_7alalk/shared/cubit/app_cubit.dart';
import 'package:se7a_7alalk/shared/cubit/app_states.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = "settingsScreen";

  @override
  Widget build(BuildContext context) {
    String country = "السعويه";
    String currency = "ريال";
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: customAppBar(title: "settings".tr(), context: context),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                customDropDownMenu(
                    labelText: "chooseLanguage".tr(),
                    value: cubit.language,
                    items: <String>["en", "ar"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) {
                      cubit.changeLanguage(context, value: value);
                    }),
                customDropDownMenu(labelText: "country".tr(), value: country),
                customDropDownMenu(labelText: "currency".tr(), value: currency),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: customButton(text: "save".tr(), onPressed: () {}),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
