import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NumericKeyboard extends StatefulWidget {
  final ValueChanged<double> onChanged;

  const NumericKeyboard({super.key, required this.onChanged});

  @override
  State<NumericKeyboard> createState() => _NumericKeyboardState();
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  String _value = '';

  void _onNumberPressed(String number) {
    setState(() {
      _value += number;
    });

    _notifyValue();
  }

  void _onBackspacePressed() {
    if (_value.isEmpty) return;

    setState(() {
      _value = _value.substring(0, _value.length - 1);
    });

    _notifyValue();
  }

  void _notifyValue() {
    if (_value.isEmpty) {
      widget.onChanged(0.0);
      return;
    }

    final value = double.tryParse(_value) ?? 0.0;

    widget.onChanged(value / 100);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.5,
      children: [
        _Key(value: '1', onTap: () => _onNumberPressed('1')),
        _Key(value: '2', onTap: () => _onNumberPressed('2')),
        _Key(value: '3', onTap: () => _onNumberPressed('3')),
        _Key(value: '4', onTap: () => _onNumberPressed('4')),
        _Key(value: '5', onTap: () => _onNumberPressed('5')),
        _Key(value: '6', onTap: () => _onNumberPressed('6')),
        _Key(value: '7', onTap: () => _onNumberPressed('7')),
        _Key(value: '8', onTap: () => _onNumberPressed('8')),
        _Key(value: '9', onTap: () => _onNumberPressed('9')),
        _Key(value: '00', onTap: () => _onNumberPressed('00')),
        _Key(value: '0', onTap: () => _onNumberPressed('0')),
        _Key(icon: Icons.backspace_outlined, onTap: _onBackspacePressed),
      ],
    );
  }
}

class _Key extends StatelessWidget {
  final String? value;
  final IconData? icon;
  final VoidCallback onTap;

  const _Key({this.value, this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: value != null
            ? Text(
                value!,
                style: AppTextStyles.heading.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              )
            : Icon(icon, size: 22, color: AppColors.textPrimary),
      ),
    );
  }
}
