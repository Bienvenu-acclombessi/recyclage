import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recyclage/controller/database_service.dart';
import 'package:recyclage/models/object_gate.dart';
import 'package:recyclage/pages/widgets/constants.dart';
import 'package:recyclage/pages/widgets/new_object.dart';
import 'package:recyclage/pages/widgets/objet_widget.dart';

class HomeWidget extends ConsumerStatefulWidget {
  const HomeWidget({super.key});

  @override
  ConsumerState<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends ConsumerState<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Image.asset('assets/logo2.png',height: 100,),
      ),
      body:SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Expanded(child: StreamBuilder<List<ObjetGate>>(
        stream: ref.watch(databaseProvider).objets,
        builder: (_, snapshot) {
          if ( snapshot.connectionState != ConnectionState.active) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }
            if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data!.length ,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final objet = snapshot.data![index];
              return MyObjet(objet: objet);
            },
          );
            }
            else{
          return 
             Container(
              width: 100,
              child: IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo,size: 60,color: Constants().color,)),);
        }
        },
      )
             
             ),
          ],
        ),
      )
      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
           CarDialog().showCarDialog(context,ImageSource.gallery);
        },
        child: Icon(Icons.add_a_photo,size: 30,color: Constants().color,),
        backgroundColor: Colors.white,
      ),
    );
  }
}