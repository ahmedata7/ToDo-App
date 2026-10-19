import 'package:flutter/material.dart';
import 'package:todo_app/ui/common/AppTextField.dart';
import 'package:todo_app/ui/login/LoginScreen.dart';
import 'package:todo_app/ui/validation_utils.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController fullName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static const String routeName = "register";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "ToDo App",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 10),
              AppTextField(
                title: "Full Name",
                hintText: "Enter Your Full Name",
                keyboard: TextInputType.name,
                validator: (text) {
                  if (text!.trim().isEmpty) {
                    return "InValid Name";
                  }
                  if (text.length < 6) {
                    return "Your Name Is Too Short";
                  }

                  return null;
                },
                controller: fullName,
              ),
              AppTextField(
                title: "Email Address",
                hintText: "Enter Your Email",
                keyboard: TextInputType.emailAddress,
                validator: (text) {
                  if (text!.trim().isEmpty) {
                    return "Email Required";
                  }
                  if (!isValidEmail(text)) {
                    return "InValid Email";
                  }
                  return null;
                },
                controller: emailAddress,
              ),
              AppTextField(
                title: "Password",
                hintText: "Enter Your Password",
                keyboard: TextInputType.text,
                isPassword: true,
                validator: (text) {
                  if (text!.trim().isEmpty) {
                    return "InValid Password";
                  }
                  if ((text.trim().length) < 6) {
                    return "Enter Strong Password";
                  }
                  return null;

                },
                controller: password,
              ),
              AppTextField(
                title: "Password Confirmation",
                hintText: "Confirm Your Password",
                keyboard: TextInputType.text,
                isPassword: true,
                validator: (text) {
                  if (text!.trim().isEmpty) {
                    return "InValid Password";
                  }
                  if (text != passwordConfirmation.text) {
                    return "In Correct Password";
                  }
                  return null;
                },
                controller: passwordConfirmation,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      register();
                    },
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You have an account?",style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white,fontSize: 14),),
                  TextButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  }, child:Text("Login",style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white,fontSize: 14),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void register(){
    formKey.currentState!.validate();
  }
}
