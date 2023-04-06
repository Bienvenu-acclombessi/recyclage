import 'package:flutter/material.dart';
import 'package:recyclage/pages/panier.dart';
import 'package:recyclage/pages/widgets/produit_widget.dart';

class MyBoutique extends StatefulWidget {
  @override
  State<MyBoutique> createState() => _MyBoutiqueState();
}

class _MyBoutiqueState extends State<MyBoutique> {
  final List<String> categories = [    "Vêtements",    "Chaussures",    "Sacs",    "Accessoires",    "Montres",    "Parfums",    "Maquillage",    "Bijoux",    "Sports",    "Électronique",  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Image.asset('assets/logo2.png',height: 100,),
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                    "Bonjour, Bienvenu !",
                    style: TextStyle(fontSize: 18.0,),
                  ),
                  IconButton(icon:Icon(Icons.card_giftcard),onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                  },)
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Text('Categorie'),
                SizedBox(
                  height: 50.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Chip(
                          label: Text(categories[index]),
                          backgroundColor: Colors.grey[300],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Rechercher un produit",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  children: List.generate(10, (index) {
                    return MyProduit();
                  }),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
