import 'package:flutter/material.dart';
import 'package:login/utils/theme/text_theme.dart';

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
                  Text("Log in to Inventory Management",style: TTextTheme.lightTextTheme.bodyLarge),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: Text("Enter your registered email id to log in.",style:TTextTheme.lightTextTheme.bodySmall),
                  ),
                  Text("Email",style:TTextTheme.lightTextTheme.bodyMedium),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                    decoration: InputDecoration(

                      hintText: "abc@example.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: _emailController,
                    autofillHints: [AutofillHints.email],
                  ),

                  const SizedBox(height: 20),
                  Text("Password"),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }

                      String pattern =
                          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
                      RegExp regex = RegExp(pattern);

                      if (!regex.hasMatch(value)) {
                        return 'Password must be 8+ chars, include upper, lower, number, and special char';
                      }

                      return null;
                    },

                    decoration: InputDecoration(
                      hintText: "........",hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.lock,color: Colors.grey),
                      suffixIcon: Icon(Icons.visibility_outlined,color: Colors.grey),
                    ),
                    controller: _passwordController,
                    obscureText: true,
                  ),

                  TextButton(onPressed: (){
                    print("forgot password");
                  }, child: Text("forgot password?",style:TextStyle(color:Colors.indigo))
                  ),

                     ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // proceed with login
                        }
                      },
                      child: Text(
                        "Log in",style:TTextTheme.lightTextTheme.labelMedium,
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
