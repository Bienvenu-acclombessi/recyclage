import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recyclage/controller/auth_controller.dart';
import 'login.dart';
import 'widgets/logo.dart';
import 'widgets/text_field.dart';
import 'package:recyclage/services/wrapper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final email_controller = TextEditingController();
  final nom_controller = TextEditingController();
  final prenom_controller = TextEditingController();
  final password_controller = TextEditingController();

  final keyForm = GlobalKey<FormState>();
  bool isLoading = false;
  signUp(email, pass, name, othername) async {
    setState(() {
      isLoading = true;
    });
    try {
      await AuthService().signUp(
          email: email,
          password: pass,
          nom: name,
          prenom: othername,
          context: context);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Wrapper()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Mot de passe trop petit.')),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cet email existe deja')),
        );
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Form(
          key: keyForm,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Logo(),
            MyFormField(
                controller: nom_controller,
                textType: TextInputType.name,
                labels: 'Nom',
                obscure_text: false,
                icon: Icons.person),
            SizedBox(
              height: 10,
            ),
            MyFormField(
                controller: prenom_controller,
                textType: TextInputType.name,
                labels: 'Prenom',
                obscure_text: false,
                icon: Icons.person),
            SizedBox(
              height: 10,
            ),
            MyFormField(
                controller: email_controller,
                textType: TextInputType.emailAddress,
                labels: 'Adresse email',
                obscure_text: false,
                icon: Icons.email),
            SizedBox(
              height: 10,
            ),
            MyFormField(
                controller: password_controller,
                textType: TextInputType.text,
                labels: 'Mot de passe',
                obscure_text: true,
                icon: Icons.security),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text('Mot de passe oublié'),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () async {
                  if (!isLoading && keyForm.currentState!.validate()) {
                    print(email_controller.text);
                    await signUp(
                        email_controller.text,
                        password_controller.text,
                        nom_controller.text,
                        prenom_controller.text);
                  }
                },
                child: isLoading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ))
                    : Text(
                        'Connexion',
                        style: TextStyle(fontSize: 17.92),
                      ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(0, 86, 27, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Connexion',
                  style: TextStyle(
                      fontSize: 17.92, color: Color.fromRGBO(0, 86, 27, 1)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(
                    color: Color.fromRGBO(0, 86, 27, 1),
                    width: 1.5,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Ou se connecter avec",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    )));
  }
}
