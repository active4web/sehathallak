import 'package:flutter/material.dart';

const Color kScaffoldColor = Color(0xff707070);
const Color kAppColor = Color(0xff1864A2);
const Color kAppSecondColor = Color(0xff36DBFF);
const Gradient kAppGradient = LinearGradient(
    colors: [kAppSecondColor, kAppColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

String kAboutAppText =
    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى،'
    ' حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.'
    ' إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد،'
    ' النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص،'
    ' حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.';
