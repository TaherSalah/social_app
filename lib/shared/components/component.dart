import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


///////////  Start  defualt Form Field Widget /////////////
Widget defualtFormField({
  String? Function(String?)? validate,
  required TextEditingController controller,
  required TextInputType type,
  required String hintText,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  VoidCallback? suffixPressed,
  double padding = 15.0,
  double borderRadius = 25.0,
  void Function()? onTap,
  ValueChanged<String>? onChanged,
  String? Function(String?)? onSubmitted,
}) =>
    Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextFormField(
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),

        obscureText: isPassword,
        validator: validate,
        onTap: onTap,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: Icon(prefix),
          suffixIcon: IconButton(icon: Icon(suffix), onPressed: suffixPressed),
          hintText: hintText,
        ),
      ),
    );
///////////  End  defualt Form Field Widget /////////////

Widget defualtButton(
    {
      required BuildContext context,
      required String name,
      Color? color ,
      required VoidCallback onPressed
    }
    )=>Padding(
  padding: const EdgeInsets.symmetric(horizontal: 25),
  child: Container(
      height: 67,
      width: 353,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: HexColor('53B175'),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child:  Text(
          name,
          style: TextStyle(
              color: color,
              fontSize: 18.0,
              fontWeight: FontWeight.w600
          ),
        ),
      )),
);
