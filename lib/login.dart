import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/l10n/context_extension.dart';
// import 'package:login/on_boarding_page.dart';
import 'package:login/utils/theme/text_theme.dart';
import 'package:login/utils/theme/theme.dart';
import 'home_page.dart';
import 'models/user_model.dart';

class Login extends StatefulWidget {
  //const because we can reuse it not everytime rebuild it
  final Function(Locale) onLocaleChange;
  final Locale locale;
  const Login({required this.onLocaleChange, required this.locale, super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final assign only once
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Locale selectedLocale= const Locale('Eng');
  bool _isLoading = false;
  bool obscureText = true;


  @override
  void initState() {
    super.initState();
    selectedLocale = widget.locale;
  }

  //Authenticate user mail and password using API
  Future<void> _loginUser() async {
    setState(() {
      _isLoading = true; // Start loading

    });

    //uri.parse will convert the api into URI object format like scheme:https,host,path
    final url = Uri.parse('https://tcd-dev-api.sandbox-dev.co.uk/api/v2/login');
    final Map<String, dynamic> bodyData = {
      'email': _emailController.text.trim(),
      'password': _passwordController.text.trim(),
    };
    log('Sending JSON: ${jsonEncode(bodyData)}');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'mode': 'fantasy',
          'device': 'android',
        },

        //convert map to json sends data to api
        body: jsonEncode(bodyData),
      );
      log('Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');



      final decoded = jsonDecode(response.body);
      if (response.statusCode == 200 && decoded['status'] == "SUCCESS") {
        final userData = UserModel.fromJson(decoded['data']);

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login successful! Welcome ${userData.firstname} ${userData.lastname}'),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(onLocaleChange: widget.onLocaleChange,locale:widget.locale)),
        );
      }
      //convert JSON to dart obj
      // final decoded = jsonDecode(response.body);
      // if (response.statusCode == 200 && decoded['status'] == "SUCCESS") {
      //   //access data from object
      //   final userData = userModel.fromJson(decoded['data']);
      //
      //   //from data it will access first_name and last_name
      //   final firstName = userData['first_name'];
      //   final lastName = userData['last_name'];
      //
      //   //will check whether that widget is in widget screen or not
      //   if (!mounted) return;
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text('Login successful! Welcome $firstName $lastName'),
      //     ),
      //   );
      // }
      else {
        final errorMessage = decoded['message'] ?? 'Login failed. Try again.';

        //first it will check whether that widget is alive in widget tree or not
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login failed: $errorMessage')));
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again.')),
      );
    } finally {
      setState(() {
        _isLoading = false; // Stop loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Log in to Inventory Management")),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        //stack because on one screen we can put loader
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),


                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:220),
                        child: SizedBox(width:100,
                          child: DropdownButton<Locale>(
                            value: selectedLocale,
                            onChanged: (Locale? newLocale) {
                              if (newLocale != null) {
                                setState(() {
                                  selectedLocale = newLocale;
                                });
                                widget.onLocaleChange(newLocale);
                              }
                            },// Use widget.locale for current value
                            icon:Icon(Icons.arrow_drop_down,size:20),
                            items: [
                              DropdownMenuItem(
                                value: const Locale('en'),
                                child: Text('Eng',style:TTextTheme.lightTextTheme.labelMedium),
                              ),
                              DropdownMenuItem(
                                value: const Locale('hi'),
                                child: Text('हिंदी',style:TTextTheme.lightTextTheme.labelMedium),
                              ),
                              DropdownMenuItem(
                                value: const Locale('fr'),
                                child: Text('French',style:TTextTheme.lightTextTheme.labelMedium),
                              ),
                            ],
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
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    context.loc.loginTitle,
                    // AppLocalizations.of(context)!.loginTitle,
                    // "Log in to E-Mart",
                    style: TTextTheme.lightTextTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    context.loc.loginSubTitle,
                    // AppLocalizations.of(context)!.loginSubTitle,
                    // "Enter your registered email id to log in.",
                    style: TTextTheme.lightTextTheme.bodyLarge?.copyWith(
                      color: Colors.blue,
                      fontFamily: 'Poppins-Bold',
                    ),
                  ),
                  SizedBox(height: 26),
                  CustomTextField(
                    label:context.loc.email,
                    // AppLocalizations.of(context)!.email,
                    hint: "abc@example.com",
                    hintStyle: TTextTheme.lightTextTheme.bodyLarge?.copyWith(
                      color: Colors.black38,
                    ),
                    obscureText: false,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      // Simple email regex pattern
                      String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null; // means valid
                    },
                    prefixIcon: Icons.mail_outline,
                    suffixIcon: null,
                  ),

                  SizedBox(height: 16),
                  CustomTextField(

                    label:context.loc.password,
                    // AppLocalizations.of(context)!.password,

                    hint: context.loc.password,
                    hintStyle: TTextTheme.lightTextTheme.bodyLarge?.copyWith(
                      color: Colors.black38,
                    ),
                    obscureText: obscureText,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      // Simple email regex pattern
                      String pattern =
                          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value)) {
                        return 'Enter a valid password';
                      }
                      return null; // means valid
                    },
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                        size: 25,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;

                        });
                      },
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        context.loc.forgotPassword,
                        // AppLocalizations.of(context)!.forgotPassword,
                        // "Forgot Password?",
                        style: TTextTheme.lightTextTheme.labelMedium?.copyWith(
                          color: AppColors.bgAccent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 18),

                  _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _loginUser();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Text(
                        context.loc.loginButton,
                        // AppLocalizations.of(context)!.loginButton, // or simply "Log In"
                        strutStyle: StrutStyle(leading: 1.5),
                        style: TTextTheme.lightTextTheme.headlineSmall?.copyWith(color: Colors.white),
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final String hint;
  final FormFieldValidator validator;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.hintStyle,
    required this.obscureText,
    required this.controller,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 3),
          child: Text(
            label,
            style: TTextTheme.lightTextTheme.headlineSmall?.copyWith(
              fontFamily: 'Poppins-Light',
            ),
          ),
        ),
        // SizedBox(height: 5),
        TextFormField(
          obscureText: obscureText,
          validator: validator,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          //to validate when user interacts
          cursorColor: Colors.blueAccent,
          style: TTextTheme.lightTextTheme.bodyLarge,

          decoration: InputDecoration(
            isDense: true,
            // labelText: label,
            hintText: hint,

            // contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            hintStyle: hintStyle,
            prefixIcon: Padding(
              padding: EdgeInsets.only(top: 1),
              child: Icon(prefixIcon, color: Colors.grey, size: 25),
            ),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}


//     //convert JSON to dart obj
//     final decoded = jsonDecode(response.body);
//     if (response.statusCode == 200 && decoded['status'] == "SUCCESS") {
//       //access data from object
//       final userData = decoded['data'];
//
//       //from data it will access first_name and last_name
//       final firstName = userData['first_name'];
//       final lastName = userData['last_name'];
//
//       //will check whether that widget is in widget screen or not
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Login successful! Welcome $firstName $lastName'),
//         ),
//       );
//     }