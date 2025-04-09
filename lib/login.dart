import 'package:flutter/material.dart';
import 'package:login/utils/theme/text_theme.dart';
import 'package:login/utils/theme/theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Log in to Inventory Management")),
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0, right: 20, left: 20),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                  SizedBox(height: 30),
              Text(
                "Log in to E-Mart",
                style: TTextTheme.lightTextTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 7),
              Text(
                "Enter your registered email id to log in.",
                style: TTextTheme.lightTextTheme.bodySmall?.copyWith(
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 26),

              CustomTextField(
                label: "Email",
                hint: "abc@example.com",
                hintStyle: TTextTheme.lightTextTheme.bodySmall?.copyWith(
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
                label: "Password",
                hint: "Enter your password",
                hintStyle: TTextTheme.lightTextTheme.bodySmall?.copyWith(
                    color: Colors.black38),
                obscureText: true,
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
                suffixIcon: Icons.visibility_outlined,


                // errorStyle: TextStyle(
                //
                //   fontSize: 12,
                //   color: Colors.red,
                //   height: 1.2,
                //   overflow: TextOverflow.visible,
                // ),
              ),


              InkWell(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Forgot Password?",
                    style: TTextTheme.lightTextTheme.labelSmall?.copyWith(
                      color: AppColors.bgAccent,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

    //
    }
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Text(
                    "Log in",
                    style: TTextTheme.lightTextTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                      // style: TElevatedButtonTheme.lightElevatedButtonTheme.style, // if you want to add for particular button
                      // onPressed: () {
                      //   if (_formKey.currentState!.validate()) {
                      //     // proceed with login
                      //   }

                    ),
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
  final IconData? suffixIcon;
  // final String? errorText;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.hintStyle,
    required this.obscureText,
    required this.controller,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom:5,left:3),
          child: Text(label, style: TTextTheme.lightTextTheme.bodyMedium),
        ),
        // SizedBox(height: 5),
        TextFormField(
          obscureText: obscureText,
          validator: validator,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,//to validate when user interacts
          cursorColor: Colors.blueAccent,
          decoration: InputDecoration(
            isDense: true,
            // labelText: label,
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            hintStyle: hintStyle,
            prefixIcon: Padding(
              padding: EdgeInsets.only(top: 2),
              child: Icon(prefixIcon, color: Colors.grey),
            ),
            suffixIcon: suffixIcon != null
                ? Padding(
              padding: EdgeInsets.only(top: 2),
              child: Icon(suffixIcon, color: Colors.grey),
            )
                : null,
            border: OutlineInputBorder(),
          ),
        ),
        // if (errorText != null)
        //   Padding(
        //     padding: const EdgeInsets.only(top: 4, left: 4),
        //     child: Text(
        //       errorText!,
        //       style: TextStyle(color: Colors.red, fontSize: 12),
        //       textAlign: TextAlign.start,
        //     ),
        //   ),
      ],
    );
  }
}


//         errorStyle: errorStyle ??
// const TextStyle(
// fontSize: 12,
// color: Colors.red,
// height: 1.2,
//
// overflow: TextOverflow.visible,

// autofillHints: [AutofillHints.email],

// TextFormField(
//   keyboardType: TextInputType.emailAddress,
//   cursorColor: Colors.indigoAccent,
//   validator: (value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter email';
//     }
//     // Simple email regex pattern
//     String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
//     RegExp regex = RegExp(pattern);
//
//     if (!regex.hasMatch(value)) {
//       return 'Enter a valid email address';
//     }
//     return null; // means valid
//   },
//   decoration: InputDecoration(
//     hintText: "abc@example.com",
//     prefixIcon: Padding(
//       padding: EdgeInsets.only(top: 2),
//       child: Icon(Icons.mail_outline, color: Colors.grey),
//     ),
//   ),
//   controller: _emailController,
//   autofillHints: [AutofillHints.email],
// ),
