// import 'package:easy_localization/src/public_ext.dart';
// import 'package:flutter/material.dart';
// import 'package:se7a_7alalk/cubits/clinic_cubit/clinic_cubit.dart';
// import 'package:se7a_7alalk/model/clinics_category_model.dart';
// import 'package:se7a_7alalk/model/clinics_model.dart';
// import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
// import 'package:se7a_7alalk/shared/constants.dart';
// import 'package:se7a_7alalk/shared/widgets/components.dart';
//
// import 'clinic_details.dart';
//
// class ReservationOfSpecialtyClinics extends StatefulWidget {
//   static const String id = "/ReservationOfSpecialtyClinics";
//
//   @override
//   State<ReservationOfSpecialtyClinics> createState() =>
//       _ReservationOfSpecialtyClinicsState();
// }
//
// class _ReservationOfSpecialtyClinicsState
//     extends State<ReservationOfSpecialtyClinics> {
//   ClinicsCategoryModel model;
//   ClinicsModel clinicModel;
//   void initState() {
//     ClinicCubit.get(context).getClinicsCategory().then((value) {
//       model = value;
//       setState(() {});
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: GradientAppBar(
//         title: "specializedVeterinaryClinics".tr(),
//       ),
//       body: model != null
//           ? Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Text("حجز عيادات بالتخصص"),
//                 ),
//                 buildCategorySlider(),
//                 if (clinicModel != null)
//                   Expanded(
//                     child: GridView.count(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 20,
//                       childAspectRatio: 0.9,
//                       crossAxisSpacing: 20,
//                       padding: EdgeInsets.all(16),
//                       children: List.generate(
//                           clinicModel.clinics.length,
//                           (index) => InkWell(
//                                 onTap: () {
//                                   navigateTo(
//                                       context: context,
//                                       page: ClinicDetails(clinicId: clinicModel.clinics[index].id),
//                                   );
//                                 },
//                                 child: Container(
//                                   height: 150,
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       border: Border.all(color: kGreyColor),
//                                       borderRadius: BorderRadius.circular(10)),
//                                   child: Column(
//                                     children: [
//                                       Image.network(
//                                         clinicModel
//                                             .clinics[index].images[0].path,
//                                         fit: BoxFit.cover,
//                                         height: 120,
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Text(
//                                         clinicModel.clinics[index].name,
//                                         style: TextStyle(
//                                             color: kAppColor,
//                                             fontWeight: FontWeight.bold),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               )),
//                     ),
//                   )
//               ],
//             )
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }
//
//   Widget buildCategorySlider() => Container(
//         height: 100,
//         child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) => InkWell(
//                   onTap: () {
//                     ClinicCubit.get(context)
//                         .getClinicsByCategory(model.clinicCats[index].id)
//                         .then((value) {
//                       clinicModel = value;
//                       setState(() {});
//                     });
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Row(
//                       children: [
//                         Image.asset("assets/images/test.png"),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           model.clinicCats[index].name,
//                           maxLines: 1,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//             separatorBuilder: (context, index) => SizedBox(
//                   width: 10,
//                 ),
//             itemCount: model.clinicCats.length),
//       );
// }
