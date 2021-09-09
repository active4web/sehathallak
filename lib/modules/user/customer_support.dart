import 'package:flutter/material.dart';
import 'package:se7a_7alalk/modules/screens/add_review_screen.dart';
import 'package:se7a_7alalk/modules/user/support_message.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class CustomerSupport extends StatelessWidget {
  static const String id = "CustomerSupport";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "خدمة العملاء", context: context),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: customButton(
                  text: "اطرح سؤالك",
                  onPressed: () {
                    navigateTo(context: context, page: SupportMessage.id);
                  },
                ),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => buildExpansionTile(),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: 5),
              )
            ],
          )),
    );
  }

  StatefulBuilder buildExpansionTile({
    String title,
    IconData icon,
    List<Map<String, String>> model,
  }) {
    return StatefulBuilder(
      builder: (context, setState) => ExpansionTile(
        title: Text(
          "كيف احصل على مكافئات",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        children: [
          Text(
              "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف")
        ],
      ),
    );
  }
}
