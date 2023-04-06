import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType textType=TextInputType.name;
  String labels="Mon nom";
  bool obscure_text;
  IconData icon;
   MyFormField({super.key, required this.controller, required this.labels,required this.textType,required this.icon,required this.obscure_text });


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$labels',style: TextStyle(
          color: Colors.grey,
          fontSize: 14.33,
    ),),
    SizedBox(height: 10,),
          TextFormField(
            validator: (value) => value!.isEmpty ? '$labels est requis' : null,
           controller: controller,
            keyboardType: textType,
          obscureText: obscure_text,
  decoration: InputDecoration(
    border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
    ),
     enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
    ),
    prefixIcon: Icon(icon),
    hintText: '$labels',
  ),
),
        ],
      ),
    );
  }
}