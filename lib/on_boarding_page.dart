import 'package:flutter/material.dart';
import 'package:login/dot_indicator.dart';
import 'package:login/utils/theme/elevated_button_theme.dart';
import 'package:login/utils/theme/text_theme.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // PageView with 3 pages
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                BoardingPage(
                  image: AssetImage("asset/images/on_boarding_image.png"),
                  text: "Trusted by millions of people, part of one part",
                ),

                BoardingPage(
                  image: AssetImage("asset/images/coinpay_receive_money.png"),
                  text: "Spend money abroad, and track your expense",
                ),

                BoardingPage(
                  image: AssetImage("asset/images/send_money.png"),
                  text: "Receive Money From Anywhere In The World",
                ),
              ],
            ),
          ),
          // ElevatedButton(
          //   style:
          //   TElevatedButtonTheme.lightElevatedButtonTheme.style,
          //   onPressed: () {},
          //   child: Text(
          //     "Next",
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20,bottom:30),
            child: ElevatedButton(
              style: TElevatedButtonTheme.lightElevatedButtonTheme.style,
              onPressed: () {},
              child: Text("Next", style: TextStyle(color: Colors.white,height: 0.4)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 20,
              right: 20,
              bottom: 30,
            ),
            child: DotIndicator(currentPage: _currentPage),
          ),
        ],
      ),
    );
  }
}
// Image(image: Image.asset(name))
// Container(
//   child: Column(
//     children: [
//       SizedBox(height: 100),
//       Image(
//         image: AssetImage("asset/images/on_boarding_image.png"),
//       ),
//       SizedBox(height: 50),
//       // DotIndicator(currentPage: _currentPage),
//       Padding(
//         padding: const EdgeInsets.only(
//           top: 30,
//           bottom: 30,
//           left: 20,
//           right: 20,
//         ),
//         child: Text(
//           "Trusted by millions of people, part of one part",
//           style: TTextTheme.lightTextTheme.displayLarge
//               ?.copyWith(fontWeight: FontWeight.bold),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     ],
//   ),
// ),
//
// Container(
//   child: Column(
//     children: [
//       SizedBox(height: 100),
//       Image(
//         image: AssetImage(
//           "asset/images/coinpay_receive_money.png",
//         ),
//       ),
//       SizedBox(height: 50),
//       // DotIndicator(currentPage: _currentPage),
//       Padding(
//         padding: const EdgeInsets.only(
//           top: 30,
//           bottom: 30,
//           left: 20,
//           right: 20,
//         ),
//         child: Text(
//           "Spend money abroad, and track your expense",
//           style: TTextTheme.lightTextTheme.displayLarge
//               ?.copyWith(fontWeight: FontWeight.bold),
//           textAlign: TextAlign.center,
//         ),
//       ),
//       // Padding(
//       //   padding: const EdgeInsets.only(top:30,left:20,right: 20),
//       //   child: ElevatedButton(style:TElevatedButtonTheme.lightElevatedButtonTheme.style,onPressed: (){}, child: Text("Next",style:TextStyle(color:Colors.white))),
//       // )
//     ],
//   ),
// ),
//
// // Container(image: AssetImage("asset/images/send_money.png"),)
//
// Container(
//   child: Column(
//     children: [
//       SizedBox(height: 100),
//       Image(image: AssetImage("asset/images/send_money.png")),
//       SizedBox(height: 50),
//       Padding(
//         padding: const EdgeInsets.only(
//           top: 30,
//           bottom: 30,
//           left: 20,
//           right: 20,
//         ),
//         child: Text(
//           "Receive Money From Anywhere In The World",
//           style: TTextTheme.lightTextTheme.displayLarge
//               ?.copyWith(fontWeight: FontWeight.bold),
//           textAlign: TextAlign.center,
//         ),
//       ),
// Padding(
//   padding: const EdgeInsets.only(top:30,left:20,right: 20),
//   child: ElevatedButton(style:TElevatedButtonTheme.lightElevatedButtonTheme.style,onPressed: (){}, child: Text("Next",style:TextStyle(color:Colors.white))),
// )

// //custom widget
class BoardingPage extends StatelessWidget {
  final String text;
  final ImageProvider image;

  // final ElevatedButton button;
   const BoardingPage({super.key,required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        Image(image: image),
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            bottom: 30,
            left: 20,
            right: 20,
          ),
          child: Text(
            text,
            style: TTextTheme.lightTextTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),

      ],
    );
  }
}
