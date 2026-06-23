import 'package:cash_control/assets/icons/icons_app.dart';
import 'package:cash_control/components/app_switch.dart';
import 'package:cash_control/components/button_app.dart';
import 'package:cash_control/components/icon_svg.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/pages/dashboard/widgets/card_balance.dart';
import 'package:cash_control/pages/dashboard/widgets/dashboard.dart';
import 'package:cash_control/shared/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Inter'),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              CardBalance(budget: 750000, moneySpent: 241830),
              Dashboard(
                values: [120000, 180000, 150000, 210000, 170000, 241830],
                totalValue: 241830,
              ),
              AppButton(
                label: "Adicionar despesa",
                onPressed: () {},
                fullWidth: true,
              ),
              AppSwitch(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: AppColors.primary,
        child: const CustomSvgIcon(
          color: AppColors.segment,
          size: 20,
          svgString: SvgIcons.plusIcon,
        ),
      ),
      bottomNavigationBar: NavbarCashControl(page: "Inicío"),
    );
  }
}
