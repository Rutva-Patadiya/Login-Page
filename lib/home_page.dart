import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/l10n/context_extension.dart';
import 'package:login/local_storage.dart';
import 'package:login/login.dart';
import 'package:login/utils/theme/text_theme.dart';
import 'package:login/utils/theme/theme.dart';
import 'package:circle_flags/circle_flags.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCurrency = "US Dollar";
  int currentPageIndex = 0;

  // for display pages of bottom navigation bar
  @override
  Widget build(BuildContext context) {
    //for adjusting the color of status bar
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.skyBlue),
    );
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        // indicatorColor: AppColors.skyBlue,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: '',
          ),

          NavigationDestination(icon: Icon(Icons.pie_chart), label: ''),
          NavigationDestination(
            icon: Icon(Icons.qr_code_scanner_sharp),
            label: '',
          ),
          NavigationDestination(icon: Icon(Icons.message), label: ''),
          NavigationDestination(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body:
          <Widget>[
            /// Home page
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: AppColors.skyBlue,
                    child: SafeArea(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
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
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: context.loc.search_payment,
                                        // 'Search "Payments"',
                                        filled: true,
                                        hintStyle: TTextTheme
                                            .lightTextTheme
                                            .bodyMedium
                                            ?.copyWith(color: Colors.white),
                                        fillColor: AppColors.lightPurple,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                          borderSide: BorderSide(
                                            color: AppColors.lightPurple,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
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
                                            style: TTextTheme
                                                .lightTextTheme
                                                .labelMedium
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
                                            style: TTextTheme
                                                .lightTextTheme
                                                .labelMedium
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
                                            style: TTextTheme
                                                .lightTextTheme
                                                .labelMedium
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
                                            style: TTextTheme
                                                .lightTextTheme
                                                .labelMedium
                                                ?.copyWith(
                                                  color: Colors.white70,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CircleFlag('in', size: 15),
                                          SizedBox(width: 5),
                                          Text(
                                            "In Rupee",
                                            style: TTextTheme
                                                .lightTextTheme
                                                .labelMedium
                                                ?.copyWith(
                                                  color: Colors.white70,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CircleFlag('ca', size: 15),
                                          SizedBox(width: 5),
                                          Text(
                                            "Ca Dollar",
                                            style: TTextTheme
                                                .lightTextTheme
                                                .labelMedium
                                                ?.copyWith(
                                                  color: Colors.white70,
                                                ),
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
                            style: TTextTheme.lightTextTheme.titleMedium
                                ?.copyWith(
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
                            style: TTextTheme.lightTextTheme.labelMedium
                                ?.copyWith(color: Colors.white70, height: 2),
                          ),

                          SizedBox(height: 15),
                          //Add Money Container
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(32),
                              ),
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
                                      style: TTextTheme
                                          .lightTextTheme
                                          .labelMedium
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
                ),

                Stack(
                  clipBehavior: Clip.none, // Allows child to overflow upwards
                  // alignment: Alignment.topCenter,
                  children: [
                    // Grey container below
                    Container(
                      height: 350, // Just a spacer to reserve height
                      color: AppColors.lightGrey,

                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 60),

                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Text(
                                    context.loc.transaction,
                                    // "Transaction",
                                    style: TTextTheme
                                        .lightTextTheme
                                        .headlineLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                  ),

                                  // SizedBox(width: 150),
                                  Spacer(),
                                  Icon(Icons.arrow_right_alt, size: 30),
                                ],
                              ),
                            ),

                            //container After transaction
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 10, //
                                vertical: 5,
                              ),
                              child: Container(
                                // height: 290,
                                // width: 320,
                                margin: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SingleChildScrollView(
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
                                              backgroundColor:
                                                  AppColors.lPurple,
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
                                            style: TTextTheme
                                                .lightTextTheme
                                                .headlineSmall
                                                ?.copyWith(
                                                  color: AppColors.black,
                                                ),
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
                                                        color:
                                                            AppColors.darkRed,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                ),
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
                                            style: TTextTheme
                                                .lightTextTheme
                                                .headlineSmall
                                                ?.copyWith(
                                                  color: AppColors.black,
                                                ),
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
                                                        color:
                                                            AppColors.darkGreen,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                ),
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
                                              backgroundColor:
                                                  AppColors.lYellow,
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
                                            style: TTextTheme
                                                .lightTextTheme
                                                .headlineSmall
                                                ?.copyWith(
                                                  color: AppColors.black,
                                                ),
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
                                                        color:
                                                            AppColors.darkRed,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                ),
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
                                              backgroundColor:
                                                  AppColors.lOrange,
                                              child: Center(
                                                child: Icon(
                                                  Icons.savings_outlined,
                                                  color: AppColors.orange,
                                                ),
                                              ),
                                            ),
                                          ),

                                          Text(
                                            context.loc.saving,
                                            style: TTextTheme
                                                .lightTextTheme
                                                .headlineSmall
                                                ?.copyWith(
                                                  color: AppColors.black,
                                                ),
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
                                                      ?.copyWith(
                                                        color: AppColors.orange,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                ),
                                              ],
                                            ),
                                          ),

                                          // Arrow icon also aligned to the end
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // White floating card
                    Positioned(
                      top: -40,
                      left: 0,
                      right: 0,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              width: 360,
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 6,
                                    color: Colors.black12,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                children: [
                                  // Send
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: AppColors.darkBlue,
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
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
                    ),
                  ],
                ),
              ],
            ),

            const Center(child: Text("Pie chart page")),
            const Center(child: Text("QR Code Scanner page")),
            const Center(child: Text("Messages page")),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text("Person page"),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      await LocaleStorage.savePage(false);
                      await LocaleStorage.onBoard(true);

                      if (context.mounted) {
                        //before context is full ready using it
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      }
                      // Login();
                    },
                    child: Text(
                      "Log Out",
                      style: TTextTheme.lightTextTheme.bodyLarge?.copyWith(color: Colors.white)
                    ),
                  ),
                ),
              ],
            ),

            /// Messages page
          ][currentPageIndex],
    );
  }
}
