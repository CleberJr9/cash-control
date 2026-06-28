import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  const AppSwitch({super.key, this.initialValue = false, this.onChanged});
  @override
  State<AppSwitch> createState() => AppSwitchState();
}

class AppSwitchState extends State<AppSwitch> {
  late bool _value;
  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: _value,
      onChanged: (val) {
        setState(() => _value = val);
        widget.onChanged?.call(val);
      },
      trackOutlineWidth: WidgetStateProperty.all(0),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      thumbColor: AppColors.surface,
      activeTrackColor: AppColors.primary,
      inactiveTrackColor: AppColors.textMuted.withValues(alpha: 0.3),
    );
  }
}
