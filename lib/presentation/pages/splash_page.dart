import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workiom/presentation/pages/account_registration_page.dart';
import 'package:workiom/presentation/pages/home_page.dart';
import '../controllers/auth_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final auth = Provider.of<AuthController>(context, listen: false);
    await auth.checkCurrentLogin();
    if (auth.currentLoginInfo != null && auth.currentLoginInfo!.result != null) {
      final user = auth.currentLoginInfo!.result['user'];
      if (user != null) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
      }
    }
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AccountRegistrationPage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}