import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/l10n/context_extension.dart';
import 'package:login/utils/theme/text_theme.dart';
import 'package:login/utils/theme/theme.dart';
import 'package:circle_flags/circle_flags.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required Function(Locale p1) onLocaleChange,
    required Locale locale,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String selectedCurrency = "US Dollar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue,
              child: Column(
                children: [
                  SizedBox(height: 64,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.emoji_events_rounded,
                          color: Colors.white,
                          size: 25,
                        ),

                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 0), // Adjust top/bottom
                                hintText: context.loc.search_payment,
                                // 'Search "Payments"',
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

                        Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 25,
                        ),
                      ],
                    ),
                  ),

                  //Circle Flag
                  DropdownButton<String>(
                    value: selectedCurrency,
                    // dropdownColor: AppColors.lightPurple,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white60,
                      size: 14,
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
                              style:
                              TTextTheme.lightTextTheme.labelMedium,
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
                              style:
                              TTextTheme.lightTextTheme.labelMedium,
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
                              style:
                              TTextTheme.lightTextTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ],

                    // 👇 This controls how the selected item looks (when dropdown is closed)
                    selectedItemBuilder: (BuildContext context) {
                      return [
                        Row(
                          children: [
                            CircleFlag('us', size: 15),
                            SizedBox(width: 5),
                            Text(
                              "US Dollar",
                              style: TTextTheme.lightTextTheme.labelMedium?.copyWith(color: Colors.white70),
                            ),
                          ],

                        ),
                        Row(
                          children: [
                            CircleFlag('in', size: 15),
                            SizedBox(width: 5),
                            Text(
                              "IN Rupee",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CircleFlag('ca', size: 15),
                            SizedBox(width: 5),
                            Text(
                              "CN Dollar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ];
                    },
                    //pass
                    onChanged:
                        (value) => {
                      setState(() {
                        selectedCurrency = value!;
                      }),
                    },
                  ),

                  Text(
                    "\$20,000",
                    style: TTextTheme.lightTextTheme.displayLarge
                        ?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),

                  //Available Balance
                  Text(context.loc.available_balance,

                    // "Available Balance",
                    style: TTextTheme.lightTextTheme.labelMedium
                        ?.copyWith(color: Colors.white60),
                  ),

                  SizedBox(height: 16,),
                  //Add Money Container
                  Container(
                    // color: Colors.red,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(32)),

                        border: Border.all(color: Colors.white)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.account_balance_wallet,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 8,),

                          Center(
                            child: Text('${context.loc.add} ${context.loc.money}',
                              // "Add Money",
                              style: TTextTheme.lightTextTheme.labelMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.red,
            ),
          )
        ],
      ),
    );
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
              height: 340,
              width: 410,
              child: Container(
                color: AppColors.skyBlue,
                height: 340,
                width: 410,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 45,
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
                          padding: const EdgeInsets.only(top: 50),
                          child: SizedBox(
                            height: 45,
                            width: 240,
                            child: TextField(
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 0), // Adjust top/bottom
                                hintText: context.loc.search_payment,
                                // 'Search "Payments"',
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
                            top: 45,
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
                          padding: const EdgeInsets.only(left: 5),
                          child: SizedBox(width: 190,
                            child: DropdownButton<String>(
                              value: selectedCurrency,
                              // dropdownColor: AppColors.lightPurple,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white60,
                                size: 14,
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
                                        style:
                                        TTextTheme.lightTextTheme.labelMedium,
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
                                        style:
                                        TTextTheme.lightTextTheme.labelMedium,
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
                                        style:
                                        TTextTheme.lightTextTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],

                              // 👇 This controls how the selected item looks (when dropdown is closed)
                              selectedItemBuilder: (BuildContext context) {
                                return [
                                  Row(
                                    children: [
                                      CircleFlag('us', size: 15),
                                      SizedBox(width: 5),
                                      Text(
                                        "US Dollar",
                                        style: TTextTheme.lightTextTheme.labelMedium?.copyWith(color: Colors.white70),
                                      ),
                                    ],

                                  ),
                                  Row(
                                    children: [
                                      CircleFlag('in', size: 15),
                                      SizedBox(width: 5),
                                      Text(
                                        "IN Rupee",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CircleFlag('ca', size: 15),
                                      SizedBox(width: 5),
                                      Text(
                                        "CN Dollar",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ];
                              },
                              //pass
                              onChanged:
                                  (value) => {
                                setState(() {
                                  selectedCurrency = value!;
                                }),
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: Text(
                            "\$20,000",
                            style: TTextTheme.lightTextTheme.displayLarge
                                ?.copyWith(
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
                          padding: const EdgeInsets.only(left: 130),
                          child: Text(context.loc.available_balance,

                            // "Available Balance",
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
                            top: 10,
                            left: 120,
                            bottom: 20,
                            right: 110,
                          ),
                          child: Container(
                            height: 40,
                            width: 120,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white70, width: 2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.account_balance_wallet,
                                  color: Colors.white,
                                  size: 20,
                                ),

                                Expanded(
                                  child: Center(
                                    child: Text('${context.loc.add} ${context.loc.money}',
                                      // "Add Money",
                                      style: TTextTheme.lightTextTheme.labelMedium
                                          ?.copyWith(color: Colors.white),
                                    ),
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
      
            // second container
            Positioned(
              top: 340,
              height: 500,
              width: 400,
              child: Container(
                color: AppColors.lightGrey,
                height: 340,
                width: 400,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, left: 20),
                      child: Row(
                        children: [
                          Text(context.loc.transaction,
                            // "Transaction",
                            style: TTextTheme.lightTextTheme.headlineLarge
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
      
                         SizedBox(width:150),
                          Expanded(child: Icon(Icons.arrow_right_alt, size: 30)),
                        ],
                      ),
                    ),
      
                    //container After transaction
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child:
                      Row(
                        children: [
                          Container(
                            height: 290,
                            width: 320,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                        left: 20,
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.lPurple,
                                        child: Center(
                                          child: Icon(
                                            Icons.credit_card,
                                            color: AppColors.skyBlue,
                                          ),
                                        ),
                                      ),
                                    ),
      
      
      
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20, right: 20, left: 10),
                                      child: Text(
                                        context.loc.spending,
                                        style: TTextTheme.lightTextTheme.headlineSmall,
                                      ),
                                    ),
      
                                    // Spacer pushes the remaining widgets to the right
                                    Spacer(),
      
                                    // Price aligned to the end
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20, right: 10),
                                      child: Text(
                                        "-\$500",
                                        style: TTextTheme.lightTextTheme.headlineSmall?.copyWith(
                                          color: AppColors.darkRed,
                                        ),
                                      ),
                                    ),
      
                                    // Arrow icon also aligned to the end
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20, right: 10),
                                      child: Icon(Icons.keyboard_arrow_right),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 20,right:20,left:10),
                                    //   child: Text(context.loc.spending,
                                    //     // "Spending",
                                    //     style:
                                    //     TTextTheme
                                    //         .lightTextTheme
                                    //         .headlineSmall,
                                    //   ),
                                    // ),
                                    //
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 20,left:60),
                                    //   child: Text(
                                    //     "-\$500",
                                    //     style: TTextTheme
                                    //         .lightTextTheme
                                    //         .headlineSmall
                                    //         ?.copyWith(color: AppColors.darkRed),
                                    //   ),
                                    // ),
                                    //
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 20),
                                    //   child: Icon(Icons.keyboard_arrow_right),
                                    // ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Divider(
                                  height: 5,
                                  thickness: 1,
                                  endIndent: 15,
                                  indent: 15,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                        left: 20,
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.lGreen,
                                        child: Center(
                                          child: FaIcon(FontAwesomeIcons.coins,
                                            color: AppColors.green,size:20,
                                          ),
                                        ),
                                      ),
                                    ),
      
      
      
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20, right: 20, left: 10),
                                      child: Text(
                                        context.loc.income,
                                        style: TTextTheme.lightTextTheme.headlineSmall,
                                      ),
                                    ),
      
                                    // Spacer pushes the remaining widgets to the right
                                    Spacer(),
      
                                    // Price aligned to the end
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20, right: 10),
                                      child: Text(
                                        "\$3000",
                                        style: TTextTheme.lightTextTheme.headlineSmall?.copyWith(
                                          color: AppColors.darkGreen,
                                        ),
                                      ),
                                    ),
      
                                    // Arrow icon also aligned to the end
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20, right: 10),
                                      child: Icon(Icons.keyboard_arrow_right),
                                    ),
      
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Divider(
                                  height: 2,
                                  thickness: 1,
                                  endIndent: 15,
                                  indent: 15,
                                ),Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                        left: 20,
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.lYellow,
                                        child: Center(
                                          child: Icon(
                                            Icons.receipt_long_outlined,
                                            color: Colors.deepOrange,
                                          ),
                                        ),
                                      ),
                                    ),
      
      
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20, right: 20, left: 10),
                                      child: Text(
                                        context.loc.bills,
                                        style: TTextTheme.lightTextTheme.headlineSmall,
                                      ),
                                    ),
      
                                    // Spacer pushes the remaining widgets to the right
                                    Spacer(),
      
                                    // Price aligned to the end
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20, right: 10),
                                      child: Text(
                                        "-\$800",
                                        style: TTextTheme.lightTextTheme.headlineSmall?.copyWith(
                                          color: AppColors.darkRed,
                                        ),
                                      ),
                                    ),
      
                                    // Arrow icon also aligned to the end
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20, right: 10),
                                      child: Icon(Icons.keyboard_arrow_right),
                                    ),
      
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Divider(
                                  height: 2,
                                  thickness: 1,
                                  endIndent: 15,
                                  indent: 15,
                                ),Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                        left: 20,
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.lOrange,
                                        child: Center(
                                          child: Icon(
                                            Icons.savings_outlined,
                                            color: AppColors.orange,
                                          ),
                                        ),
                                      ),
                                    ),
      
      
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20, right: 20, left: 10),
                                      child: Text(
                                        context.loc.savings,
                                        style: TTextTheme.lightTextTheme.headlineSmall,
                                      ),
                                    ),
      
                                    // Spacer pushes the remaining widgets to the right
                                    Spacer(),
      
                                    // Price aligned to the end
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20, right: 10),
                                      child: Text(
                                        "\$1000",
                                        style: TTextTheme.lightTextTheme.headlineSmall?.copyWith(
                                          color: AppColors.orange,
                                        ),
                                      ),
                                    ),
      
                                    // Arrow icon also aligned to the end
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20, right: 10),
                                      child: Icon(Icons.keyboard_arrow_right),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 20,right: 50,left:10),
                                    //   child: Text(context.loc.savings,
                                    //     // "Saving",
                                    //     style:
                                    //     TTextTheme
                                    //         .lightTextTheme
                                    //         .headlineSmall,
                                    //   ),
                                    // ),
                                    //
                                    // Padding(
                                    //   padding: const EdgeInsets.only(left: 50),
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.only(top: 20),
                                    //     child: Text(
                                    //       "-\$500",
                                    //       style: TTextTheme
                                    //           .lightTextTheme
                                    //           .headlineSmall
                                    //           ?.copyWith(color: AppColors.orange),
                                    //     ),
                                    //   ),
                                    // ),
                                    //
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 20,right:10),
                                    //   child: Icon(Icons.keyboard_arrow_right),
                                    // ),
                                  ],
                                ),
      
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      
            //container which we want to place on top like stack wise
            Positioned(
              height: 120,
              top: 260,
              left: 15,
              right: 15,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 120,
                  width: 335,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30, top: 15),
                            child: Stack(
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
                                    padding: EdgeInsets.only(left: 3, top: 1),
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
                            padding: const EdgeInsets.only(left: 23, top: 7),
                            child: Text(context.loc.send
                              // "Send"
                            ),
                          ),
                        ],
                      ),
      
                      VerticalDivider(
                        indent: 27,
                        endIndent: 27,
                        width: 60, // Space taken horizontally (affects spacing)
                        thickness: 1, // Line thickness
                      ),
      
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: CircleAvatar(
                                backgroundColor: AppColors.yellow,
                                child: Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
      
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 7,
                              top: 5,
                              right: 15,
                            ),
                            child: Text(
                            context.loc.request
                                // "Request"
                            ),
                          ),
                        ],
                      ),
      
                      VerticalDivider(
                        indent: 27,
                        endIndent: 27,
                        width: 40, // Space taken horizontally (affects spacing)
                        thickness: 1, // Line thickness
                      ),
      
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 15),
                            child: Center(
                              child: Icon(
                                Icons.account_balance_sharp,
                                color: AppColors.yellow,
                                size: 42,
                              ),
                            ),
                          ),
      
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 4),
                            child: Text(
                            context.loc.bank
                                // "Bank"
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
      
            // Positioned(
            //   top:720,
            //   child: Container(
            //     height: 60,
            //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(20)
            //       ),
            //
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Icon(Icons.home, color: Colors.blue),
            //         Icon(Icons.pie_chart, color: Colors.black54),
            //         Container(
            //           height: 60,
            //           width: 60,
            //           decoration: BoxDecoration(
            //             color: Colors.blue,
            //             borderRadius: BorderRadius.circular(20),
            //           ),
            //           child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
            //         ),
            //         Icon(Icons.chat_bubble_outline, color: Colors.black54),
            //         Icon(Icons.person_outline, color: Colors.black54),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      
        bottomNavigationBar: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
             Radius.circular(20)
            ),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.home, color: Colors.blue),
              Icon(Icons.pie_chart, color: Colors.black54),
              Container(
                height: 100,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
              ),
              Icon(Icons.chat_bubble_outline, color: Colors.black54),
              Icon(Icons.person_outline, color: Colors.black54),
            ],
          ),
        ),

    );
  }
}