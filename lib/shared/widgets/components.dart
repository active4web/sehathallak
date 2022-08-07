import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:se7a_7alalk/cubits/store_cubit/store_cubit.dart';
import 'package:se7a_7alalk/modules/layout/home_layout.dart';
import 'package:se7a_7alalk/modules/screens/package_subscription_screen.dart';
import 'package:se7a_7alalk/modules/screens/payment_screen.dart';
import 'package:se7a_7alalk/shared/components/custom_dropdown_menu.dart';
import 'package:se7a_7alalk/shared/components/custom_text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';

Widget customTextField(
        {String labelText,
        String hintText,
        Widget prefixIcon,
        Function(String) validator,
        Function onTap,
        TextEditingController controller,
        Widget suffixIcon,
        TextInputType keyboardType,
        bool isPassword = false}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: kGreyColor,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: kGreyColor, width: 2),
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            obscureText: isPassword,
            controller: controller,
            validator: validator,
            onTap: onTap,
            keyboardType: isPassword ? TextInputType.visiblePassword : keyboardType,
            decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 14),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon),
          ),
        ),
      ],
    );

Widget customButton(
        {String text,
        double width = double.infinity,
        double height = 50,
        Function onPressed}) =>
    Container(
      decoration: BoxDecoration(gradient: kAppGradient),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: width,
        height: height,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Future navigateTo({BuildContext context, Widget page}) =>
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => page,
    ));

Future<dynamic> buildSuccessDialog({context, String msg}) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {
                      navigateTo(context: context,page: HomeLayout());
                    },
                    child: Image.asset("assets/images/close icon.png"))),
            Image.asset("assets/images/dialog image.png"),
            Text(msg)
          ],
        ),
      ),
    ),
  );
}

Future<dynamic> buildPayServiceDialog(context) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/images/close icon.png"))),
            Image.asset("assets/images/pay service.png"),
            Text("قيمة الخدمة 500 ريال"),
            Text("انت لست مشترك باحدى باقاتنا\nستنتقل الى شاشة الدفع"),
            customButton(
                text: "إتمام الدفع",
                onPressed: () {
                  navigateTo(context: context, page: PaymentScreen());
                }),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                navigateTo(page: PackageSubscription(
                ), context: context);
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: kAppColor),
                ),
                child: Center(
                  child: Text(
                    "الاشتراك بالباقات",
                    style: TextStyle(color: kAppColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Future navigateToAndStop({BuildContext context, Widget page}) =>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => page,), (route) => false);

Widget customAppBar(
        {String title, BuildContext context, bool canNavigate: true}) =>
    AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        canNavigate
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
                icon: Icon(Icons.arrow_forward, color: Colors.black))
            : SizedBox(),
        SizedBox(
          width: 10,
        ),
      ],
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
      centerTitle: true,
    );

Widget customDropDownMenu(
        {String labelText, dynamic value, List items, Function onChanged}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: kGreyColor,
            fontSize: 13,
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: kGreyColor),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton(
                underline: SizedBox(),
                items: items,
                value: value,
                isExpanded: true,
                onChanged: onChanged,
              ),
            ),
          ),
        )
      ],
    );

Widget buildImageContainer({String title, IconData icon, Function onPressed}) =>
    InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: TextButton.icon(
            onPressed: onPressed,
            icon: Icon(icon, color: Colors.grey),
            label: Text(
              title,
              style: TextStyle(color: Colors.grey),
            )),
      ),
    );

Widget textFieldWithTitle(
        {String title,
        String hintText,
        TextEditingController controller,
        int maxLines,
        Widget suffixIcon}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        CustomTextField(
          controller: controller,
          hintText: hintText,
          maxLines: maxLines,
          suffixIcon: suffixIcon,
        )
      ],
    );

Widget dropDownMenuWithTitle(
        {dynamic value,
        String hintText,
        Function onChanged,
        List<DropdownMenuItem> items,
        String title}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        CustomDropDownMenu(
          hintText: hintText,
          value: value,
          items: items,
          onChange: onChanged,
        ),
      ],
    );

Future<bool> showToast({@required String text}) {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
}

void launchURL(String url) async => await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

void launchWhatsApp(phone) async {
  if (!await launch('https://wa.me/$phone')) throw 'Could not launch wa.me/$phone';
}

Future<void> showPhotoDialog(XFile file,context) {
  return showDialog(
      context: context,
      builder: (BuildContext) {
        return AlertDialog(
          title: Text(
            "takeThePictureFrom".tr(),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextButton(
                child: Text(
                  "gallery".tr(),
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.right,
                ),
                onPressed: () async{
                  file = await StoreCubit.get(context).pickImage(file: file,camera: false);
                },
              ),
              TextButton(
                child: Text(
                  "camera".tr(),
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.right,
                ),
                onPressed: () async {
                  file = await StoreCubit.get(context).pickImage(file: file,camera: true);
                },
              ),
            ],
          ),
        );
      });
}
