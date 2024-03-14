import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/common/text.dart';
import 'package:sreshtgeeth/controller/auth.dart';
import 'package:sreshtgeeth/view/bottomsheet/bottomsheet.dart';
import 'package:sreshtgeeth/view/paymodule/webCC.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../common/base_colors.dart';

class PaymentSelection extends StatefulWidget {
  final amount;
  final month;
  final plannn;
  const PaymentSelection({super.key,required this.amount,required this.month,required this.plannn});




  @override
  State<PaymentSelection> createState() => _PaymentSelectionState();
}

class _PaymentSelectionState extends State<PaymentSelection> {
  String? selectedvalue;
  AuthCon acon = Get.put(AuthCon());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () => Get.back(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                    icon: Icon(
                        Icons.arrow_back,
                        color: blackColor,
                    ),
                    onPressed: () => Get.back(),
                  ),
                    )),
                SizedBox(
                  width: 50,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Txt(
                          text: 'Package Summary',
                          fsize: 18,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: mHeight / 5,
              width: mWidth / 1,
              decoration: BoxDecoration(
                  color: lightgreenblueColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
                  child: Row(
                    children: [
                      Txt(
                        text: 'Premium For You',
                        fsize: 16,
                        weight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, top: 10, right: 30),
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
                                text: 'Ad free Music',
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
                                text: 'Unlimited Downloads',
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
                                text: 'Clear audio ',
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
                                text: 'free access',
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
              ]),
             ),
            // Container(
            //   height: mHeight / 3,
            //   child: ListView.builder(
            //       //physics: NeverScrollableScrollPhysics(),
            //       shrinkWrap: true,
            //       itemCount: 14,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Column(
            //           children: [
            //             Container(
            //               height: 60,
            //               //  color: Colors.blue,
            //               child: RadioListTile(
            //                 title: Txt(
            //                   text: "₹99 ₹59per month",
            //                   fsize: 13,
            //                   // color: greyColor,
            //                   weight: FontWeight.bold,
            //                 ),
            //                 subtitle: Txt(
            //                   text: 'Save 20% with autopay, Cancel anytime',
            //                   fsize: 13,
            //                 ),
            //                 value: "Could not reach Customer",
            //                 groupValue: selectedvalue,
            //                 onChanged: (value) {
            //                   setState(() {
            //                     selectedvalue = value.toString();
            //                   });
            //                 },
            //               ),
            //             ),
            //             Container(
            //               height: mHeight / 300,
            //               child: Divider(
            //                 thickness: 1,
            //               ),
            //             )
            //           ],
            //         );
            //       }),
            // ),
            Container(
              height: mHeight / 9,
              width: mWidth / 1,
              color: greyColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                child: Container(
                  height: mHeight / 13,
                  width: mWidth / 1,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Txt(
                            text: 'Apply Coupon',
                            fsize: 16,
                            weight: FontWeight.bold,
                            color: lightgreenblueColor,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: lightgreenblueColor,
                          )
                        ]),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            // Padding(
            //   padding: const EdgeInsets.only(top: 14.0, left: 10, bottom: 5),
            //   child: Row(
            //     children: [
            //       Txt(
            //         text: 'Mobile Number :',
            //       ),
            //       Txt(
            //         text: '+91************',
            //       ),
            //     ],
            //   ),
            // ),
            // Divider(
            //   thickness: 1,
            // ),
            Column(
              children: [
                Txt(
                  text: 'Details',
                )
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(
                        text: 'Music App-Pro (${widget.month})',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Txt(
                        text: 'Grand Total',
                        weight: FontWeight.bold,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Txt(
                        text: widget.amount,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Txt(
                        text: widget.amount,
                        weight: FontWeight.bold,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: ()async{
                await acon.paymentpage2(widget.plannn);
                log(acon.pay1!.paymentLink);
                await Get.to(webCC());
                // Get.offAll(Bottomsheet());

              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: mHeight / 20,
                  width: mWidth / 1,
                  decoration: BoxDecoration(
                      color: lightgreenblueColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Txt(
                      text: 'Continue With Rs. ${widget.amount}',
                      fsize: 16,
                      color: whiteColor,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
