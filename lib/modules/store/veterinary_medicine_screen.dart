// import 'package:easy_localization/src/public_ext.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:se7a_7alalk/cubits/service_cubit/service_cubit.dart';
// import 'package:se7a_7alalk/cubits/store_cubit/store_cubit.dart';
// import 'package:se7a_7alalk/model/products_model.dart';
// import 'package:se7a_7alalk/model/store_model.dart';
// import 'package:se7a_7alalk/modules/screens/product_screen.dart';
// import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
// import 'package:se7a_7alalk/shared/constants.dart';
// import 'package:se7a_7alalk/shared/widgets/components.dart';
//
// class VeterinaryMedicine extends StatefulWidget {
//   final int index;
//
//    VeterinaryMedicine({Key key,this.index}) : super(key: key);
//   @override
//   State<VeterinaryMedicine> createState() => _VeterinaryMedicineState();
// }
//
// class _VeterinaryMedicineState extends State<VeterinaryMedicine> {
//   StoreModel model;
//   ProductsModel productsModel;
//   int currentIndex = 0;
//   void initState() {
//     StoreCubit.get(context).getStore().then((value) {
//       model = value;
//       setState(() {});
//     });
//     super.initState();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: model != null
//           ? Scaffold(
//               appBar: GradientAppBar(
//                 title: model.categories[widget.index].name,
//                 actions: true,
//                 canNavigate: true,
//               ),
//               body: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   buildCategorySlider(),
//                   if (productsModel != null)
//                     productsModel.products.length > 0
//                         ? Expanded(
//                             child: GridView.count(
//                               padding: EdgeInsets.all(20),
//                               crossAxisCount: 2,
//                               crossAxisSpacing: 20,
//                               childAspectRatio: 0.57,
//                               mainAxisSpacing: 20,
//                               children: List.generate(
//                                   productsModel.products.length, (index) {
//                                 return buildProductCard(index);
//                               }),
//                             ),
//                           )
//                         : Center(
//                             child: Text("noProducts".tr()),
//                           )
//                 ],
//               ))
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }
//
//   Widget buildCategorySlider() => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: Text(
//               model.categories[widget.index].name,
//               style: TextStyle(fontSize: 14),
//             ),
//           ),
//           Container(
//             height: 100,
//             child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) => InkWell(
//                       onTap: () {
//                         StoreCubit.get(context)
//                             .getProducts(
//                                 model.categories[widget.index].subCats[index].id)
//                             .then((value) {
//                           productsModel = value;
//                           currentIndex = index;
//                           setState(() {});
//                         });
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Row(
//                           children: [
//                             Image.network(
//                               model.categories[widget.index].subCats[index].photo,
//                               width: 40,
//                               fit: BoxFit.cover,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               model.categories[widget.index].subCats[index].name,
//                               maxLines: 1,
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                 separatorBuilder: (context, index) => SizedBox(
//                       width: 10,
//                     ),
//                 itemCount: model.categories[widget.index].subCats.length),
//           )
//         ],
//       );
//
//   Widget buildProductCard(index) {
//     return Stack(
//       children: [
//         InkWell(
//           onTap: () {
//             navigateTo(
//                 context: context,
//                 page: ProductScreen(productId: productsModel.products[index].id,));
//
//           },
//           child: Container(
//             padding: EdgeInsets.all(15),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Align(
//                   alignment: Alignment.center,
//                   child: Image.network(
//                     productsModel.products[index].images[0],
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Text(
//                   productsModel.products[index].name,
//                   style: TextStyle(fontSize: 15),
//                 ),
//                 Text(
//                   "${productsModel.products[index].price}",
//                   style: TextStyle(fontSize: 9, color: Color(0xffFE6833)),
//                 ),
//                 Row(
//                   children: [
//                     RatingBar.builder(
//                       itemSize: 10,
//                       initialRating:
//                           // double.parse(productsModel.products[index].rating) ??
//                           0.0,
//                       minRating: 1,
//                       ignoreGestures: true,
//                       direction: Axis.horizontal,
//                       allowHalfRating: true,
//                       itemCount: 5,
//                       itemBuilder: (context, _) => Icon(
//                         Icons.star,
//                         color: Colors.amber,
//                       ),
//                       onRatingUpdate: (double value) {},
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       // "${double.parse(productsModel.products[index].rating)}",
//                       "",
//                       style:
//                           TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   width: double.infinity,
//                   color: kAppColor,
//                   margin: EdgeInsets.symmetric(horizontal: 10),
//                   child: Text(
//                     "اضف للسلة",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.white, fontSize: 9),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//             top: 5,
//             right: 5,
//             child: InkWell(
//               onTap: () async {
//                 var result = await StoreCubit.get(context)
//                     .addFavourite(productsModel.products[index].id);
//                 showToast(text: result["msg"]);
//                 setState(() {});
//               },
//               child: Icon(
//                 Icons.favorite,
//                 size: 30,
//                 color: productsModel.products[index].fav == 0
//                     ? kGreyColor
//                     : Colors.red,
//               ),
//             )),
//         Positioned(
//             top: 5,
//             left: 5,
//             child: Container(
//               padding: EdgeInsets.all(2),
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle, color: Color(0xffFE6833)),
//               child: Text(
//                 "${productsModel.products[index].offer}",
//                 style: TextStyle(color: Colors.white, fontSize: 10),
//               ),
//             )),
//       ],
//     );
//   }
// }
