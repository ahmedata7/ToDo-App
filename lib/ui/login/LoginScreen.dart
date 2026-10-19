import 'package:flutter/material.dart';
import 'package:todo_app/ui/common/AppTextField.dart';
import 'package:todo_app/ui/registration/RegisterScreen.dart';
import 'package:todo_app/ui/validation_utils.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static const String routeName = "login";
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
                      login();
                    },
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don,t have an account?",style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white,fontSize: 14),),
                  TextButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                  }, child:Text("Create account",style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white,fontSize: 14),))
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
  void login(){
    formKey.currentState!.validate();
  }
}
