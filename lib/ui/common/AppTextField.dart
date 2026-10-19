import 'package:flutter/material.dart';
typedef Validator = String?Function(String? text);
class AppTextField extends StatefulWidget {
  String title;
  String hintText;
  TextInputType keyboard;
  bool isPassword;
  Validator validator ;
  TextEditingController controller ;
  AppTextField({
    required this.title,
    required this.hintText,
    this.keyboard = TextInputType.text,
    this.isPassword = false,
    required this.validator,
    required this.controller
  });
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isVisible = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isVisible = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              suffixIcon:widget.isPassword ? InkWell(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Icon(
                  isVisible ? Icons.visibility_off : Icons.visibility,
                ),
              ):null,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),

            ),
            keyboardType: widget.keyboard,
            obscureText: isVisible,
            validator: widget.validator,
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
