import 'package:flutter/material.dart';
import 'package:recyclage/models/object_gate.dart';
import 'package:recyclage/pages/product_description_page.dart';

class MyObjet extends StatelessWidget {
  ObjetGate objet;
  MyObjet({super.key,required this.objet});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: EdgeInsets.symmetric(horizontal: 14,vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
               
       color: Color.fromRGBO(102, 255, 102, 0.25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: InkWell(
                  onTap: () {
                    },
                  child: Container(
                    decoration: BoxDecoration(
                      
                    ),
                    child: Image.network("${objet.objetUrlImg}",height: 100,))),
            ),
            SizedBox(height: 8.0),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Text("${objet.objetName}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Text("${objet.etat}"),
              ],)
              
                
                  ],
                  ),
              
            )
          ],
        ),
      ),
    );
  }
}

