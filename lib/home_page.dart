import 'package:flutter/material.dart';
import 'package:login/utils/theme/text_theme.dart';
import 'package:login/utils/theme/theme.dart';
import 'package:circle_flags/circle_flags.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String selectedCurrency = "US Dollar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            height: 400,
            width: 410,
            child: Container(
              color: AppColors.skyBlue,
              height: 400,
              width: 420,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 60,
                          left: 15,
                          right: 20,
                        ),
                        child: Icon(
                          Icons.emoji_events_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: SizedBox(
                          height: 45,
                          width: 240,
                          child: TextField(
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 0), // Adjust top/bottom
                              hintText: 'Search "Payments"',
                              filled: true,
                              hintStyle: TTextTheme.lightTextTheme.bodyMedium
                                  ?.copyWith(color: Colors.white),
                              fillColor: AppColors.lightPurple,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: AppColors.lightPurple,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: AppColors.lightPurple,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white,
                                // size: 25,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          top: 60,
                          right: 10,
                          left: 20,
                        ),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ],
                  ),

                  //Circle Flag
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 14, left: 130),

                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 5),
                        child: DropdownButton<String>(
                          value: selectedCurrency,
                          dropdownColor: AppColors.lightPurple,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white60,
                            size: 12,
                          ),
                          underline: Container(
                            height: 0,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                              ),
                            ),

                          ),
                          items: [
                            DropdownMenuItem(
                              value: "US Dollar",
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: CircleFlag('us', size: 15),
                                  ),
                                  Text(
                                    "US Dollar",
                                    style: TTextTheme.lightTextTheme.labelMedium
                                        ?.copyWith(color: Colors.white60),
                                  ),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: "IN Rupee",
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: CircleFlag('in', size: 15),
                                  ),
                                  Text(
                                    "IN Rupee",
                                    style: TTextTheme.lightTextTheme.labelMedium
                                        ?.copyWith(color: Colors.white60),
                                  ),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: "CN Dollar",
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: CircleFlag('ca', size: 15),
                                  ),
                                  Text(
                                    "CN Dollar",
                                    style: TTextTheme.lightTextTheme.labelMedium
                                        ?.copyWith(color: Colors.white60),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          //pass
                          onChanged:
                              (value) =>
                          {
                            setState(() {
                              selectedCurrency = value!;
                            }),
                          },
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 110),
                        child: Text(
                          "\$20,000",
                          style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Available Balance
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: Text(
                          "Available Balance",
                          style: TTextTheme.lightTextTheme.labelMedium
                              ?.copyWith(color: Colors.white60),
                        ),
                      ),
                    ],
                  ),

                  //Add Money Container
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 110,
                          bottom: 20,
                          right: 110,
                        ),
                        child: Container(
                          height: 48,
                          width: 140,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70, width: 2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.account_balance_wallet,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Add Money",
                                  style: TTextTheme.lightTextTheme.labelMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //second container
          Positioned(
            top: 390,
            height: 500,
            width: 400,
            child: Container(
              color: AppColors.lightGrey,
              height: 350,
              width: 400,
              child: Column(children: []),
            ),
          ),

          //container which we want to place on top like stack wise
          Positioned(
            height: 130,
            top: 320,
            left: 15,
            right: 15,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 130,
                width: 335,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.creamColor,
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 20),
                          child:
                          Stack(
                            children: [
                              //remaining
                              // Positioned(top:400,height:100,width:100,child: Icon(Icons.arrow_upward)),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.darkBlue,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 3, top: 3),
                                  child: Icon(
                                    Icons.attach_money,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 23, top: 5),
                          child: Text("Send"),
                        ),


                        // Padding(
                        //   padding: const EdgeInsets.only(left: 30, top: 20),
                        //   child: Container(
                        //     height: 40,
                        //     width: 40,
                        //     decoration: BoxDecoration(
                        //       color: AppColors.Darkblue,
                        //       borderRadius: BorderRadius.circular(50),
                        //     ),
                        //     child: Padding(
                        //       padding: EdgeInsets.only(left: 12, top: 7),
                        //       child: FaIcon(
                        //         FontAwesomeIcons.dollarSign,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 23, top: 5),
                        //   child: Text("Send"),
                        // ),

                        // Image(image: AssetImage("asset/images/send_icon.png")),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(height: 35,
                        width: 10,
                        decoration: BoxDecoration(border: Border(
                            left: BorderSide(
                                width: 1, color: AppColors.greyColor))),),
                    ),


                    Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30, top: 20),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColors.yellow,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 3, top: 3),
                                child: Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 23, top: 5),
                            child: Text("Request"),
                          ),
                        ]
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(height: 35,
                        width: 10,
                        decoration: BoxDecoration(border: Border(
                            left: BorderSide(
                                width: 1, color: AppColors.greyColor))),),
                    ),
                    Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30, top: 20),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColors.yellow,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 3, top: 3),
                                child: Icon(
                                  Icons.account_balance,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(left: 23, top: 5),
                            child: Text("Bank"),
                          ),
                        ]
                    ),



                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
