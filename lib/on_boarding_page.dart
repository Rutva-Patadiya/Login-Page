import 'package:flutter/material.dart';
import 'package:login/dot_indicator.dart';
import 'package:login/l10n/context_extension.dart';
import 'package:login/utils/theme/elevated_button_theme.dart';
import 'package:login/utils/theme/text_theme.dart';
// import 'l10n/app_localizations.dart';
// import 'local_provider.dart';
import 'login.dart';

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

                  // text: "Trusted by millions of people, part of one part",
                  text: context.loc.onBoardText3,
                  // AppLocalizations.of(context)!.onBoardText3,
                ),

                BoardingPage(
                  image: AssetImage("asset/images/coinpay_receive_money.png"),
                  // text: "Spend money abroad, and track your expense",
                  text: context.loc.onBoardText2,
                ),

                BoardingPage(
                  image: AssetImage("asset/images/send_money.png"),
                  // text: "Receive Money From Anywhere In The World",
                  text: context.loc.onBoardText1,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 20,
              right: 20,
              bottom: 30,
            ),
            child: ElevatedButton(
              style: TElevatedButtonTheme.lightElevatedButtonTheme.style,
              onPressed: () {
                if (_currentPage < 2) {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    // curve: Curves.linear,
                    // curve: Curves.linearToEaseOut,
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                }
              },
              child: Text(
                _currentPage < 2 ? "Next" : "Get Started",
                // style:TTextTheme.lightTextTheme.titleSmall?.copyWith(color: Colors.white,height: 0.4)
                style: TextStyle(color: Colors.white, height: 0.4),
              ),
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

//custom widget
class BoardingPage extends StatelessWidget {
  final String text;
  final ImageProvider image;

  // final ElevatedButton button;
  const BoardingPage({super.key, required this.image, required this.text});

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
