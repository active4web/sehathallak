import 'package:flutter/material.dart';
import '../constants.dart';

Widget customTextField(
        {String labelText,
        String hintText,
        IconData prefixIcon,
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
            fontSize: 13,
          ),
        ),
        TextField(
          obscureText: isPassword,
          keyboardType:
              isPassword ? TextInputType.visiblePassword : keyboardType,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14),
              prefixIcon: Icon(prefixIcon),
              suffixIcon: suffixIcon),
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

Future navigateTo({BuildContext context, String page, Object arguments}) =>
    Navigator.pushNamed(context, page, arguments: arguments);

Future<dynamic> buildSuccessDialog(context) {
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
            Image.asset("assets/images/dialog image.png"),
            Text("تم ارسال طلبك بنجاح"),
            Text("انت مشترك بالباقة السنويه")
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
            customButton(text: "إتمام الدفع", onPressed: () {}),
            SizedBox(
              height: 5,
            ),
            Container(
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
            )
          ],
        ),
      ),
    ),
  );
}

Future navigateToAndStop({BuildContext context, String page}) =>
    Navigator.pushNamedAndRemoveUntil(context, page, (route) => false);

Widget customAppBar({String title, BuildContext context}) => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
            icon: Icon(Icons.arrow_forward, color: Colors.black)),
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
        DropdownButtonHideUnderline(
            child: DropdownButton(
          items: items,
          value: value,
          isExpanded: true,
          onChanged: onChanged,
        ))
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
