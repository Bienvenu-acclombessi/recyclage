import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recyclage/controller/auth_controller.dart';
import 'package:recyclage/pages/login.dart';
import 'package:recyclage/pages/roote_page.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = Provider.of<User?>(context);
    final _user = ref.watch(userconnect);
    
    if (_user.value == null) {
      return const LoginPage();
    } else {
      return RoutePage();
    }
  }
}
