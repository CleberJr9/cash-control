import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/enums/page_enum.dart';
import 'package:cash_control/features/profile/presentation/widgets/options_profile.dart';
import 'package:cash_control/features/profile/presentation/widgets/profile_edit.dart';
import 'package:cash_control/components/custom_navbar.dart';
import 'package:flutter/material.dart';

enum ProfileEnum { profile, options, amountMonth }

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // ignore: prefer_final_fields
  ProfileEnum _profileType = ProfileEnum.options;

  void _options() {
    setState(() {
      _profileType = ProfileEnum.options;
    });
  }

  void _profile() {
    setState(() {
      _profileType = ProfileEnum.profile;
    });
  }

  // void _amountMonth() {
  //   setState(() {
  //     _profileType = ProfileEnum.amountMonth;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24,
              children: [
                if (_profileType == ProfileEnum.options)
                  OptionsProfile(
                    nameUer: "Cleber Junior",
                    amount: 10000,
                    editProfile: _profile,
                  )
                else
                  ProfileEdit(backPage: _options),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavbarCashControl(page: PageEnum.profile),
    );
  }
}
