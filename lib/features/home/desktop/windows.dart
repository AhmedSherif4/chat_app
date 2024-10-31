import 'package:flutter/material.dart';

import '../components/app_bar.dart';

class HomeWindows extends StatefulWidget {
  const HomeWindows({super.key});

  @override
  State<HomeWindows> createState() => _HomeWindowsState();
}

class _HomeWindowsState extends State<HomeWindows> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomAppBarWidget(),
          ],
        ),
      ),
    );
  }
}
