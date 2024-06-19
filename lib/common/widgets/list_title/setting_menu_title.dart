import 'package:flutter/material.dart';

class ESettingMenuTitle extends StatelessWidget {
  const ESettingMenuTitle({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    required this.onTap,
  });

  final Icon icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.bodyMedium),
      trailing: trailing,
    );
  }
}
