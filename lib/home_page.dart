import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/l10n/context_extension.dart';
import 'package:login/utils/theme/text_theme.dart';
import 'package:login/utils/theme/theme.dart';
import 'package:circle_flags/circle_flags.dart';

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
  String selectedCurrency = "US Dollar";
  int _selectedIndex = 0;

  //for display pages of bottom navigation bar
  //   final List<Widget> _pages = [
  //     Center(child: Text('Welcome to Home', style: TextStyle(fontSize: 18))),
  //     Center(child: Text('Pie Chart Page')),
  //     Center(child: Text('QR Scanner Page')),
  //     Center(child: Text('Chat Page')),
  //     Center(child: Text('Profile Page')),
  //   ];
  @override
  Widget build(BuildContext context) {
    //for adjusting the color of status bar
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.skyBlue),
    );
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.skyBlue,
              child: Column(
                children: [
                  SizedBox(height: 50),
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
                            height: 45,
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              decoration: InputDecoration(
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

                                //give padding outside content also handles situation when text is long -> to ....
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5,
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

                  SizedBox(height: 20),
                  //Circle Flag
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isDense: true,
                          //shrinks vertical padding
                          // isExpanded: true
                          value: selectedCurrency,
                          // it will Remove default icon
                          icon: SizedBox.shrink(),
                          dropdownColor: Colors.white,
                          menuWidth: 200,
                          items: [
                            DropdownMenuItem(
                              value: "US Dollar",
                              child: Row(
                                children: [
                                  CircleFlag('us', size: 15),
                                  SizedBox(width: 5),
                                  Text(
                                    "US Dollar",
                                    style: TTextTheme.lightTextTheme.labelMedium
                                        ?.copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: "IN Rupee",
                              child: Row(
                                children: [
                                  CircleFlag('in', size: 15),
                                  SizedBox(width: 5),
                                  Text(
                                    "IN Rupee",
                                    style: TTextTheme.lightTextTheme.labelMedium
                                        ?.copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: "CN Dollar",
                              child: Row(
                                children: [
                                  CircleFlag('ca', size: 15),
                                  SizedBox(width: 5),
                                  Text(
                                    "CN Dollar",
                                    style: TTextTheme.lightTextTheme.labelMedium
                                        ?.copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          selectedItemBuilder: (context) {
                            return [
                              Row(
                                children: [
                                  CircleFlag('us', size: 15),
                                  SizedBox(width: 5),
                                  Text(
                                    "US Dollar",
                                    style: TTextTheme.lightTextTheme.labelMedium
                                        ?.copyWith(color: Colors.white70),
                                  ),
                                ],
                              ),
                            ];
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedCurrency = value!;
                            });
                          },
                        ),
                      ),

                      SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white60,
                        size: 14,
                      ),
                    ],
                  ),
                  Text(
                    "\$20,000",
                    style: TTextTheme.lightTextTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      height: 1.2,
                    ),
                  ),

                  //Available Balance
                  Text(
                    context.loc.available_balance,
                    // "Available Balance",
                    style: TTextTheme.lightTextTheme.labelMedium?.copyWith(
                      color: Colors.white70,
                      height: 2,
                    ),
                  ),

                  SizedBox(height: 15),
                  //Add Money Container
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.account_balance_wallet,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 8),

                          Center(
                            child: Text(
                              '${context.loc.add} ${context.loc.money}',
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
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none, // Allows child to overflow upwards
            alignment: Alignment.topCenter,
            children: [
              // Grey container below
              Container(
                height: 350, // Just a spacer to reserve height
                color: AppColors.lightGrey,

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60, left: 20),
                        child: Row(
                          children: [
                            Text(
                              context.loc.transaction,
                              // "Transaction",
                              style: TTextTheme.lightTextTheme.headlineLarge
                                  ?.copyWith(fontWeight: FontWeight.w500,color:Colors.black87),
                            ),

                            SizedBox(width: 150),
                            Expanded(
                              child: Icon(Icons.arrow_right_alt, size: 30),
                            ),
                          ],
                        ),
                      ),

                      //container After transaction
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        child: Row(
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
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 15,
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

                                      Text(
                                        context.loc.spending,
                                        style:
                                            TTextTheme
                                                .lightTextTheme
                                                .headlineSmall?.copyWith(color:AppColors.black),
                                      ),

                                      Spacer(),
                                      // Price aligned to the end
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 13,
                                          vertical: 13,
                                        ),

                                        child: Row(
                                          children: [
                                            Text(
                                              "-\$500",
                                              style: TTextTheme
                                                  .lightTextTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                    color: AppColors.darkRed,
                                                  ),
                                            ),
                                            Icon(Icons.keyboard_arrow_right),
                                          ],
                                        ),
                                      ),

                                      // Arrow icon also aligned to the end
                                    ],
                                  ),

                                  Divider(
                                    height: 5,
                                    thickness: 1,
                                    indent: 15,
                                    endIndent: 15,
                                    color: AppColors.grey,
                                  ),

                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 15,
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: AppColors.lGreen,
                                          child: Center(
                                            child: FaIcon(
                                              FontAwesomeIcons.coins,
                                              color: AppColors.green,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),

                                      Text(
                                        context.loc.income,
                                        style:
                                            TTextTheme
                                                .lightTextTheme
                                                .headlineSmall?.copyWith(color:AppColors.black),
                                      ),

                                      // Spacer pushes the remaining widgets to the right

                                      // Price aligned to the end
                                      Spacer(),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 13,
                                          vertical: 13,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "\$3000",
                                              style: TTextTheme
                                                  .lightTextTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                    color: AppColors.darkGreen,
                                                  ),
                                            ),
                                            Icon(Icons.keyboard_arrow_right),
                                          ],
                                        ),
                                      ),

                                      // Arrow icon also aligned to the end
                                    ],
                                  ),

                                  Divider(
                                    height: 2,
                                    thickness: 1,
                                    endIndent: 15,
                                    indent: 15,
                                    color: AppColors.grey,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 15,
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

                                      Text(
                                        context.loc.bills,
                                        style:
                                            TTextTheme
                                                .lightTextTheme
                                                .headlineSmall?.copyWith(color:AppColors.black),
                                      ),
                                      Spacer(),
                                      // Price aligned to the end
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 13,
                                          vertical: 13,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "-\$800",
                                              style: TTextTheme
                                                  .lightTextTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                    color: AppColors.darkRed,
                                                  ),
                                            ),
                                            Icon(Icons.keyboard_arrow_right),
                                          ],
                                        ),
                                      ),

                                      // Arrow icon also aligned to the end
                                    ],
                                  ),

                                  Divider(
                                    height: 2,
                                    thickness: 1,
                                    endIndent: 15,
                                    indent: 15,
                                    color: AppColors.grey,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 15,
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

                                      Text(
                                        context.loc.savings,
                                        style:
                                            TTextTheme
                                                .lightTextTheme
                                                .headlineSmall?.copyWith(color:AppColors.black),
                                      ),

                                      Spacer(),
                                      // Price aligned to the end
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 13,
                                          vertical: 13,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "\$1000",
                                              style: TTextTheme
                                                  .lightTextTheme
                                                  .headlineSmall
                                                  ?.copyWith(color: AppColors.orange),
                                            ),
                                            Icon(Icons.keyboard_arrow_right),
                                          ],
                                        ),
                                      ),

                                      // Arrow icon also aligned to the end

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

              // White floating card
              Positioned(
                top: -40,
                child: Container(
                  width: 320,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        color: Colors.black12,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Send
                      Column(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.darkBlue,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.attach_money,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(context.loc.send),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                        child: VerticalDivider(
                          width: 30,
                          color: AppColors.grey,
                        ),
                      ),
                      // Request
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.yellow,
                            child: Icon(
                              Icons.attach_money,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(context.loc.request),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                        child: VerticalDivider(
                          width: 30,
                          color: AppColors.grey,
                        ),
                      ),
                      // Bank
                      Column(
                        children: [
                          Icon(
                            Icons.account_balance_sharp,
                            color: AppColors.yellow,
                            size: 42,
                          ),
                          SizedBox(height: 5),
                          Text(context.loc.bank),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Stack(children: [
          //  //container which we want to place on top like stack wise
          //   Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Column(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 30, top: 15),
          //             child: Container(
          //               height: 40,
          //               width: 40,
          //               decoration: BoxDecoration(
          //                 color: AppColors.darkBlue,
          //                 borderRadius: BorderRadius.circular(50),
          //               ),
          //               child: Padding(
          //                 padding: EdgeInsets.only(left: 3, top: 1),
          //                 child: Icon(
          //                   Icons.attach_money,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(left: 23, top: 7),
          //             child: Text(context.loc.send
          //               // "Send"
          //             ),
          //           ),
          //         ],
          //       ),
          //
          //       VerticalDivider(
          //         indent: 27,
          //         endIndent: 27,
          //         width: 60, // Space taken horizontally (affects spacing)
          //         thickness: 1, // Line thickness
          //       ),
          //
          //       Column(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(top: 15),
          //             child: Container(
          //               height: 40,
          //               width: 40,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(50),
          //               ),
          //               child: CircleAvatar(
          //                 backgroundColor: AppColors.yellow,
          //                 child: Icon(
          //                   Icons.attach_money,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             ),
          //           ),
          //
          //           Padding(
          //             padding: const EdgeInsets.only(
          //               left: 7,
          //               top: 5,
          //               right: 15,
          //             ),
          //             child: Text(
          //             context.loc.request
          //                 // "Request"
          //             ),
          //           ),
          //         ],
          //       ),
          //
          //       VerticalDivider(
          //         indent: 27,
          //         endIndent: 27,
          //         width: 40, // Space taken horizontally (affects spacing)
          //         thickness: 1, // Line thickness
          //       ),
          //
          //       Column(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10, top: 15),
          //             child: Center(
          //               child: Icon(
          //                 Icons.account_balance_sharp,
          //                 color: AppColors.yellow,
          //                 size: 42,
          //               ),
          //             ),
          //           ),
          //
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10, top: 4),
          //             child: Text(
          //             context.loc.bank
          //                 // "Bank"
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ],
          // ),
          // Expanded(flex: 2, child: Container(color: AppColors.lYellow ),
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed, // To keep all 5 items visible
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Stats'),
          BottomNavigationBarItem(
            icon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 26),
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );

    //             color: AppColors.lightGrey,
    //             height: 340,
    //             width: 400,
    //             child: Column(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(top: 60, left: 20),
    //                   child: Row(
    //                     children: [
    //                       Text(context.loc.transaction,
    //                         // "Transaction",
    //                         style: TTextTheme.lightTextTheme.headlineLarge
    //                             ?.copyWith(fontWeight: FontWeight.w500),
    //                       ),
    //
    //                      SizedBox(width:150),
    //                       Expanded(child: Icon(Icons.arrow_right_alt, size: 30)),
    //                     ],
    //                   ),
    //                 ),
    //
    //                 //container After transaction
    //                 Padding(
    //                   padding: const EdgeInsets.only(left: 20, top: 5),
    //                   child:
    //                   Row(
    //                     children: [
    //                       Container(
    //                         height: 290,
    //                         width: 320,
    //                         decoration: BoxDecoration(
    //                           color: Colors.white,
    //                           borderRadius: BorderRadius.circular(10),
    //                         ),
    //                         child: Column(
    //                           children: [
    //                             Row(
    //                               children: [
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(
    //                                     top: 20,
    //                                     left: 20,
    //                                   ),
    //                                   child: CircleAvatar(
    //                                     backgroundColor: AppColors.lPurple,
    //                                     child: Center(
    //                                       child: Icon(
    //                                         Icons.credit_card,
    //                                         color: AppColors.skyBlue,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //
    //
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(top: 20, right: 20, left: 10),
    //                                   child: Text(
    //                                     context.loc.spending,
    //                                     style: TTextTheme.lightTextTheme.headlineSmall,
    //                                   ),
    //                                 ),
    //
    //                                 // Spacer pushes the remaining widgets to the right
    //                                 Spacer(),
    //
    //                                 // Price aligned to the end
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(top: 20, right: 10),
    //                                   child: Text(
    //                                     "-\$500",
    //                                     style: TTextTheme.lightTextTheme.headlineSmall?.copyWith(
    //                                       color: AppColors.darkRed,
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //                                 // Arrow icon also aligned to the end
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(top: 20, right: 10),
    //                                   child: Icon(Icons.keyboard_arrow_right),
    //                                 ),
    //                                 // Padding(
    //                                 //   padding: const EdgeInsets.only(top: 20,right:20,left:10),
    //                                 //   child: Text(context.loc.spending,
    //                                 //     // "Spending",
    //                                 //     style:
    //                                 //     TTextTheme
    //                                 //         .lightTextTheme
    //                                 //         .headlineSmall,
    //                                 //   ),
    //                                 // ),
    //                                 //
    //                                 // Padding(
    //                                 //   padding: const EdgeInsets.only(top: 20,left:60),
    //                                 //   child: Text(
    //                                 //     "-\$500",
    //                                 //     style: TTextTheme
    //                                 //         .lightTextTheme
    //                                 //         .headlineSmall
    //                                 //         ?.copyWith(color: AppColors.darkRed),
    //                                 //   ),
    //                                 // ),
    //                                 //
    //                                 // Padding(
    //                                 //   padding: const EdgeInsets.only(top: 20),
    //                                 //   child: Icon(Icons.keyboard_arrow_right),
    //                                 // ),
    //                               ],
    //                             ),
    //                             const SizedBox(height: 10),
    //                             Divider(
    //                               height: 5,
    //                               thickness: 1,
    //                               endIndent: 15,
    //                               indent: 15,
    //                             ),
    //                             Row(
    //                               children: [
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(
    //                                     top: 20,
    //                                     left: 20,
    //                                   ),
    //                                   child: CircleAvatar(
    //                                     backgroundColor: AppColors.lGreen,
    //                                     child: Center(
    //                                       child: FaIcon(FontAwesomeIcons.coins,
    //                                         color: AppColors.green,size:20,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //
    //
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(top: 20, right: 20, left: 10),
    //                                   child: Text(
    //                                     context.loc.income,
    //                                     style: TTextTheme.lightTextTheme.headlineSmall,
    //                                   ),
    //                                 ),
    //
    //                                 // Spacer pushes the remaining widgets to the right
    //                                 Spacer(),
    //
    //                                 // Price aligned to the end
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(top: 20, right: 10),
    //                                   child: Text(
    //                                     "\$3000",
    //                                     style: TTextTheme.lightTextTheme.headlineSmall?.copyWith(
    //                                       color: AppColors.darkGreen,
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //                                 // Arrow icon also aligned to the end
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(top: 20, right: 10),
    //                                   child: Icon(Icons.keyboard_arrow_right),
    //                                 ),
    //
    //                               ],
    //                             ),
    //                             const SizedBox(height: 10),
    //                             Divider(
    //                               height: 2,
    //                               thickness: 1,
    //                               endIndent: 15,
    //                               indent: 15,
    //                             ),Row(
    //                               children: [
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(
    //                                     top: 20,
    //                                     left: 20,
    //                                   ),
    //                                   child: CircleAvatar(
    //                                     backgroundColor: AppColors.lYellow,
    //                                     child: Center(
    //                                       child: Icon(
    //                                         Icons.receipt_long_outlined,
    //                                         color: Colors.deepOrange,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(top: 20, right: 20, left: 10),
    //                                   child: Text(
    //                                     context.loc.bills,
    //                                     style: TTextTheme.lightTextTheme.headlineSmall,
    //                                   ),
    //                                 ),
    //
    //                                 // Spacer pushes the remaining widgets to the right
    //                                 Spacer(),
    //
    //                                 // Price aligned to the end
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(top: 20, right: 10),
    //                                   child: Text(
    //                                     "-\$800",
    //                                     style: TTextTheme.lightTextTheme.headlineSmall?.copyWith(
    //                                       color: AppColors.darkRed,
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //                                 // Arrow icon also aligned to the end
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(top: 20, right: 10),
    //                                   child: Icon(Icons.keyboard_arrow_right),
    //                                 ),
    //
    //                               ],
    //                             ),
    //                             const SizedBox(height: 10),
    //                             Divider(
    //                               height: 2,
    //                               thickness: 1,
    //                               endIndent: 15,
    //                               indent: 15,
    //                             ),Row(
    //                               children: [
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(
    //                                     top: 20,
    //                                     left: 20,
    //                                   ),
    //                                   child: CircleAvatar(
    //                                     backgroundColor: AppColors.lOrange,
    //                                     child: Center(
    //                                       child: Icon(
    //                                         Icons.savings_outlined,
    //                                         color: AppColors.orange,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(top: 20, right: 20, left: 10),
    //                                   child: Text(
    //                                     context.loc.savings,
    //                                     style: TTextTheme.lightTextTheme.headlineSmall,
    //                                   ),
    //                                 ),
    //
    //                                 // Spacer pushes the remaining widgets to the right
    //                                 Spacer(),
    //
    //                                 // Price aligned to the end
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(top: 20, right: 10),
    //                                   child: Text(
    //                                     "\$1000",
    //                                     style: TTextTheme.lightTextTheme.headlineSmall?.copyWith(
    //                                       color: AppColors.orange,
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //                                 // Arrow icon also aligned to the end
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(top: 20, right: 10),
    //                                   child: Icon(Icons.keyboard_arrow_right),
    //                                 ),
    //                                 // Padding(
    //                                 //   padding: const EdgeInsets.only(top: 20,right: 50,left:10),
    //                                 //   child: Text(context.loc.savings,
    //                                 //     // "Saving",
    //                                 //     style:
    //                                 //     TTextTheme
    //                                 //         .lightTextTheme
    //                                 //         .headlineSmall,
    //                                 //   ),
    //                                 // ),
    //                                 //
    //                                 // Padding(
    //                                 //   padding: const EdgeInsets.only(left: 50),
    //                                 //   child: Padding(
    //                                 //     padding: const EdgeInsets.only(top: 20),
    //                                 //     child: Text(
    //                                 //       "-\$500",
    //                                 //       style: TTextTheme
    //                                 //           .lightTextTheme
    //                                 //           .headlineSmall
    //                                 //           ?.copyWith(color: AppColors.orange),
    //                                 //     ),
    //                                 //   ),
    //                                 // ),
    //                                 //
    //                                 // Padding(
    //                                 //   padding: const EdgeInsets.only(top: 20,right:10),
    //                                 //   child: Icon(Icons.keyboard_arrow_right),
    //                                 // ),
    //                               ],
    //                             ),
    //
    //                           ],
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //
    //         //container which we want to place on top like stack wise
    //         Positioned(
    //           height: 120,
    //           top: 260,
    //           left: 15,
    //           right: 15,
    //           child: Padding(
    //             padding: const EdgeInsets.only(top: 30),
    //             child: Container(
    //               height: 120,
    //               width: 335,
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(15),
    //                 color: Colors.white,
    //               ),
    //               child: Row(
    //                 children: [
    //                   Column(
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.only(left: 30, top: 15),
    //                         child: Stack(
    //                           children: [
    //                             //remaining
    //                             // Positioned(top:400,height:100,width:100,child: Icon(Icons.arrow_upward)),
    //                             Container(
    //                               height: 40,
    //                               width: 40,
    //                               decoration: BoxDecoration(
    //                                 color: AppColors.darkBlue,
    //                                 borderRadius: BorderRadius.circular(50),
    //                               ),
    //                               child: Padding(
    //                                 padding: EdgeInsets.only(left: 3, top: 1),
    //                                 child: Icon(
    //                                   Icons.attach_money,
    //                                   color: Colors.white,
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.only(left: 23, top: 7),
    //                         child: Text(context.loc.send
    //                           // "Send"
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //
    //                   VerticalDivider(
    //                     indent: 27,
    //                     endIndent: 27,
    //                     width: 60, // Space taken horizontally (affects spacing)
    //                     thickness: 1, // Line thickness
    //                   ),
    //
    //                   Column(
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.only(top: 15),
    //                         child: Container(
    //                           height: 40,
    //                           width: 40,
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(50),
    //                           ),
    //                           child: CircleAvatar(
    //                             backgroundColor: AppColors.yellow,
    //                             child: Icon(
    //                               Icons.attach_money,
    //                               color: Colors.white,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //
    //                       Padding(
    //                         padding: const EdgeInsets.only(
    //                           left: 7,
    //                           top: 5,
    //                           right: 15,
    //                         ),
    //                         child: Text(
    //                         context.loc.request
    //                             // "Request"
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //
    //                   VerticalDivider(
    //                     indent: 27,
    //                     endIndent: 27,
    //                     width: 40, // Space taken horizontally (affects spacing)
    //                     thickness: 1, // Line thickness
    //                   ),
    //
    //                   Column(
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.only(left: 10, top: 15),
    //                         child: Center(
    //                           child: Icon(
    //                             Icons.account_balance_sharp,
    //                             color: AppColors.yellow,
    //                             size: 42,
    //                           ),
    //                         ),
    //                       ),
    //
    //                       Padding(
    //                         padding: const EdgeInsets.only(left: 10, top: 4),
    //                         child: Text(
    //                         context.loc.bank
    //                             // "Bank"
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //
    //         // Positioned(
    //         //   top:720,
    //         //   child: Container(
    //         //     height: 60,
    //         //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //         //     decoration: BoxDecoration(
    //         //       color: Colors.white,
    //         //       borderRadius: BorderRadius.circular(20)
    //         //       ),
    //         //
    //         //     child: Row(
    //         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         //       children: [
    //         //         Icon(Icons.home, color: Colors.blue),
    //         //         Icon(Icons.pie_chart, color: Colors.black54),
    //         //         Container(
    //         //           height: 60,
    //         //           width: 60,
    //         //           decoration: BoxDecoration(
    //         //             color: Colors.blue,
    //         //             borderRadius: BorderRadius.circular(20),
    //         //           ),
    //         //           child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
    //         //         ),
    //         //         Icon(Icons.chat_bubble_outline, color: Colors.black54),
    //         //         Icon(Icons.person_outline, color: Colors.black54),
    //         //       ],
    //         //     ),
    //         //   ),
    //         // ),
    //       ],
    //     ),
  }
}
