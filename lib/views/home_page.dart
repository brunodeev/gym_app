import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/models/user_manager.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 25),
        child: Consumer<UserManager>(
          builder: (_, userManager, __) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) => SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: kSecondaryColor,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Olá ${userManager.user?.name ?? ''}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
