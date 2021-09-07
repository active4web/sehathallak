import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/constants.dart';


class RewardsScreen extends StatelessWidget {
  const RewardsScreen({Key key}) : super(key: key);
  static const String id = "rewardsScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('هل تريد كسب رصيد مكافأت'),
              SizedBox(height: 8,),
              Text('يمكنك كسب رصيد مكافئات عند الشراء'
                  ' او التعليق وتقييم المنتجات والخدمات'),
              /// Card
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                padding: EdgeInsets.all(12),
                height: MediaQuery.of(context).size.height*0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff4FC6E9)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('رصيد المكافئات يحسب كالتالي',style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),),
                    Text('1 ريال/ 1000 نقطة',style: TextStyle(
                      color: Colors.white
                    ),),
                    Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('عدد النقاط المكتسبة :',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),),
                        Text('2000',style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('المبلغ المستحق :',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        Text('2 ريال',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Text('سجلات النقاط المكتسبة',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),),
              SizedBox(height: 10,),
              ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('إضافة تقييم على منتج'),
                      Row(children: [
                        Text('100',style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('نقطة')
                      ],),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


