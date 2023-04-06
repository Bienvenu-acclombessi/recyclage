import 'package:flutter/material.dart';
import 'package:recyclage/pages/product_description_page.dart';

class MyProduit extends StatelessWidget {
  const MyProduit({super.key});

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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDescriptionPage(
                                productName: 'Frigo',
                                productImage: 'productImage',
                                productPrice: 200,
                                productDescription:
                                    'La description de notre produit en deux choses differnt')));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      
                    ),
                    child: Image.asset("assets/klipartz.png",height: 100,))),
            ),
            SizedBox(height: 8.0),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Text("Frigo "),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Text("10.00 €"),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
                ),
                  child: Icon(Icons.add,color: Colors.white,))
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
