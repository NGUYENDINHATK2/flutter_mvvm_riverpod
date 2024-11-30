import 'package:flutter/material.dart';
import 'package:flutter_mvvm_riverpod/features/common/ui/providers/app_theme_mode_provider.dart';
import 'package:flutter_mvvm_riverpod/features/profile/ui/widgets/common_rounded_item.dart';
import 'package:flutter_mvvm_riverpod/theme/app_colors.dart';
import 'package:flutter_mvvm_riverpod/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppearanceItem extends ConsumerWidget {
  final Widget icon;
  final String text;
  final ThemeMode value;
  final Function(ThemeMode?)? onSelected;
  final bool isFirst;
  final bool isLast;

  const AppearanceItem({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
    this.onSelected,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonRoundedItem(
      isFirst: isFirst,
      isLast: isLast,
      child: Row(
        children: [
          const SizedBox(width: 16),
          icon,
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 60,
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: AppTheme.bodyLarge16,
              ),
            ),
          ),
          Radio(
            groupValue: ref.watch(appThemeModeProvider).value,
            value: value,
            onChanged: (value) {
              if (value == null) return;
              ref.read(appThemeModeProvider.notifier).updateMode(value);
            },
            activeColor: AppColors.blueberry100,
          ),
        ],
      ),
    );
  }
}
