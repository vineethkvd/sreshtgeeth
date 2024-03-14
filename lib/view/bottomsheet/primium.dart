import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sreshtgeeth/controller/auth.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../paymodule/payment.dart';
import 'package:http/http.dart'as http;

class PrimiumScreen extends StatefulWidget {
  const PrimiumScreen({super.key});

  @override
  State<PrimiumScreen> createState() => _PrimiumScreenState();
}

class _PrimiumScreenState extends State<PrimiumScreen> {

//
// Future<void> subcriptionns()async{
//   var url = Uri.parse("http://sreshtgeeth.com/RestApi/UserApi/subscription");
//   var cus = GetStorage().read('cusId');
//   var bodyy = jsonEncode({
//     "api_key":"REJOICE@2023",
//     "cus_id":cus
//   });
//   var headerr = {
//     'Content-Type': 'application/json'
//   };
// var response = await http.post(url,body: bodyy,headers: headerr);
// var decodes= jsonDecode(response.body);
// setState(() {
// active_plann=decodes["active_plan"];
// subscription_plan=decodes["Subscription_plan"];
// });
// }

   AuthCon acon = Get.put(AuthCon());

   calling()async{
   await acon.scbscriptionapi();
   setState(() {

   });
   }


   @override
  void initState() {

    super.initState();
    calling();
    // subcriptionns();
  }
  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.pink,
    Colors.purple,
  ];

  // List plan = [
  //   { "sub" : " ₹ 99","mon":" 1 month"},
  //   { "sub" : " ₹ 199","mon":" 3 month"},
  //   { "sub" : " ₹ 299","mon":" 6 month"},
  //   { "sub" : " ₹ 499","mon":" 1 year"},
  //
  //];
   
   
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Center(
            child:  acon.ssubscription?.subscriptionPlan?.length==null?Center(child:Column(children: [CircularProgressIndicator()],)):Column(
                children: [
              Text("Go primium",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              Text("get the best of music & podcast",style: TextStyle(fontSize: 14),),
                 Padding(
                   padding: const EdgeInsets.only(left: 15,top: 10),
                   child: Align(
                     alignment: Alignment.centerLeft,
                       child: Text("your Currect Pack",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                 ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child:acon.ssubscription!.activePlan.isNotEmpty
                        ?Text("₹ "+"${acon.ssubscription!.activePlan[0].amount.toString()}"+" / "+"${acon.ssubscription!.activePlan[0].validityInMonth.toString()}"+" month", style: TextStyle(fontWeight:FontWeight.bold,fontSize: 15),)

                            :Text("No Active Pack",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)

                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset(
                              'assets/dot.png',
                              scale: 5,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            acon.ssubscription!.activePlan.isNotEmpty?
                            Text("${acon.ssubscription?.activePlan?[0].heading1.toString()}"):Text("Ad Free Music"),
                            SizedBox(
                              width: 150,
                            ),
                            Image.asset(
                              'assets/dot.png',
                              scale: 5,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            acon.ssubscription!.activePlan.isNotEmpty?
                            Text("${acon.ssubscription?.activePlan?[0].heading2.toString()}"):Text("Clear Audio"),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset(
                              'assets/dot.png',
                              scale: 5,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            acon.ssubscription!.activePlan.isNotEmpty?
                            Text("${acon.ssubscription?.activePlan?[0].heading3.toString()}"):Text("Unlimited Download"),
                            SizedBox(
                              width: 112,
                            ),
                            Image.asset(
                              'assets/dot.png',
                              scale: 5,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            acon.ssubscription!.activePlan.isNotEmpty?
                            Text("${acon.ssubscription?.activePlan?[0].heading4.toString()}"):Text("Free Access")
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Txt(
                                  text: '  Do you want missing features ?',
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  //Get.to(PaymentSelection());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: lightgreenblueColor,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Txt(
                                      text: 'BUY NOW ?',
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: acon.ssubscription?.subscriptionPlan?.length??0,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                       colors[index],
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Txt(
                                              text: 'Premium For You',
                                              color: whiteColor,
                                              fsize: 16,
                                              weight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, top: 10, right: 30),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/tick.png',
                                                      scale: 5,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Txt(
                                                      text: "${
                                                          acon.ssubscription?.subscriptionPlan[index].heading1
                                                      }",
                                                      fsize: 14,
                                                      color: whiteColor,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/tick.png',
                                                      scale: 5,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Txt(
                                                      text: "${
                                                          acon.ssubscription?.subscriptionPlan[index].heading2
                                                      }",
                                                      fsize: 14,
                                                      color: whiteColor,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/tick.png',
                                                      scale: 5,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Txt(
                                                      text: "${
                                                          acon.ssubscription?.subscriptionPlan[index].heading3
                                                      }",
                                                      fsize: 14,
                                                      color: whiteColor,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/tick.png',
                                                      scale: 5,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Txt(
                                                      text: "${
                                                          acon.ssubscription?.subscriptionPlan[index].heading4
                                                      }",
                                                      fsize: 14,
                                                      color: whiteColor,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                         // GetStorage().write("planid",acon.ssubscription?.subscriptionPlan?[0].planId??"");
                                          Get.to(PaymentSelection(amount: acon.ssubscription?.subscriptionPlan[index].amount.toString(),month:acon.ssubscription?.subscriptionPlan[index].validityInMonth.toString(), plannn: acon.ssubscription?.subscriptionPlan?[index].planId.toString()));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                                color: whiteColor,
                                                borderRadius: BorderRadius.circular(15)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Txt(
                                                          text: "₹ ${acon.ssubscription?.subscriptionPlan[index].amount} / ${acon.ssubscription?.subscriptionPlan[index].validityInMonth} months",
                                                          fsize: 14,
                                                        ),
                                                        // SizedBox(
                                                        //   width: 20,
                                                        // ),
                                                        // Txt(
                                                        //   text: '₹ 59 / 3 month',
                                                        //   fsize: 14,
                                                        // ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          bottom: 80.0),
                                                      child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        size: 20,
                                                      ),
                                                    )
                                                  ]),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
