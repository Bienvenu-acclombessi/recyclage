import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recyclage/controller/auth_controller.dart';
import 'widgets/logo.dart';
import 'widgets/text_field.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  bool isLoading = false;
  signIn(email, password) async {
    setState(() {
      isLoading = true;
    });
    try {
      await AuthService().signIn(email, password, context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'No user found for that mail',
                style: TextStyle(color: Colors.white),
              )),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Mot de passe incorect',
                style: TextStyle(color: Colors.white),
              )),
        );
      }
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
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: 10),
            Logo(),
            MyFormField(
                controller: email_controller,
                textType: TextInputType.emailAddress,
                labels: 'Adresse email',
                obscure_text: false,
                icon: Icons.email),
            SizedBox(
              height: 20,
            ),
            MyFormField(
                controller: password_controller,
                textType: TextInputType.text,
                labels: 'Mot de passe',
                obscure_text: true,
                icon: Icons.person),
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
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () async {
                  if (!isLoading && keyForm.currentState!.validate()) {

                    await signIn(email_controller.text, password_controller.text);
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                },
                child: Text(
                  'Inscription',
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
