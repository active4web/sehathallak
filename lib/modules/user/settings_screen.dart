import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:se7a_7alalk/cubits/auth_cubit/auth_cubit.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_cubit.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_states.dart';
import 'package:se7a_7alalk/model/countries_model.dart';
import 'package:se7a_7alalk/networks/local/cache_helper.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    int country = CacheHelper.getData("countryId");
    int currency = CacheHelper.getData("currencyId");
    String languageValue = CacheHelper.getData("language");
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      bloc: AppCubit()..fetchData(),
      builder: (context, state) {
        return Scaffold(
          appBar: customAppBar(title: "settings".tr(), context: context),
          body: AuthCubit.get(context).languagesModel != null && AuthCubit.get(context).countriesModel != null && AuthCubit.get(context).currencyModel != null
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      StatefulBuilder(
                        builder: (context, setState) {
                          return customDropDownMenu(
                              labelText: "chooseLanguage".tr(),
                              value: languageValue,
                              items: <String>[
                                AuthCubit.get(context)
                                    .languagesModel
                                    .language
                                    .en,
                                AuthCubit.get(context)
                                    .languagesModel
                                    .language
                                    .ar
                              ].map((value) {
                                return DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList(),
                              onChanged: (value) {
                                print(value);
                                if (value == "English") {
                                  languageValue = value;
                                  CacheHelper.setData(
                                      key: "language", value: value);
                                } else {
                                  languageValue = value;
                                  CacheHelper.setData(
                                      key: "language", value: value);
                                }
                                print(languageValue);
                                setState(() {});
                              });
                        },
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return customDropDownMenu(
                              labelText: "country".tr(),
                              value: country,
                              items: AuthCubit.get(context)
                                  .countriesModel
                                  .data
                                  .countries
                                  .map((e) {
                                return DropdownMenuItem(
                                  child: Text(e.name),
                                  value: e.id,
                                );
                              }).toList(),
                              onChanged: (value) {
                                country = value;
                                // currency = value.currencyId;
                                CacheHelper.setData(
                                    key: "countryId", value: value);
                                setState(() {});
                              });
                        },
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return customDropDownMenu(
                              labelText: "currency".tr(),
                              value: currency,
                              items: AuthCubit.get(context)
                                  .currencyModel
                                  .currency
                                  .map((e) {
                                return DropdownMenuItem(
                                  child: Text(e.currencyName),
                                  value: e.id,
                                );
                              }).toList(),
                              onChanged: (value) {
                                currency = value;
                                CacheHelper.setData(
                                    key: "currencyId", value: value);
                                setState(() {});
                              });
                        },
                      ),
                      BlocConsumer<AppCubit, AppStates>(
                        builder: (context, state) {
                          return state is! UpdateLanguageLoadingState
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 30),
                                  child: customButton(
                                      text: "save".tr(),
                                      onPressed: () async {
                                        var result =
                                            await AppCubit.get(context)
                                                .updateLanguage(
                                                    languageValue == "English"
                                                        ? "en"
                                                        : "ar",
                                                    country,
                                              currency
                                            );
                                        AppCubit.get(context).changeLanguage(
                                            context,
                                            value: languageValue == "English"
                                                ? "en"
                                                : "ar");
                                        showToast(text: result["msg"]);
                                        if(result["success"]){
                                          Phoenix.rebirth(context);
                                        }
                                      }),
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                );
                        },
                        listener: (context, state) {},
                      )
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
