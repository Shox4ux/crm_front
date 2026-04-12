import 'package:crm_app/app/features/common/cubit/locale_cubit.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/common/extensions/l10n_ext.dart';
import 'package:crm_app/app/features/core/router/route_names.dart';
import 'package:crm_app/app/features/home/presentation/bloc/drawerx_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DrawerX extends StatelessWidget {
  const DrawerX({super.key});

  List<String> getDrawerItems(BuildContext context) {
    return [
      context.l10n.home,
      context.l10n.products,
      context.l10n.warehouse,
      context.l10n.wareProducts,
      context.l10n.clients,
      context.l10n.orders,
    ];
  }

  bool isSelected(BuildContext context, int index) {
    final state = context.watch<DrawerXCubit>().state;
    return state.selectedIndex == index;
  }

  void onTap(BuildContext context, int index) {
    context.read<DrawerXCubit>().changeIndex(index);
    context.read<DrawerXCubit>().toggleDrawer();
  }

  void _onSettingsTap(BuildContext context) {
    final localeCubit = context.read<LocaleCubit>();
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        final selectedLocale = localeCubit.state;
        return AlertDialog(
          title: Text(
            dialogContext.l10n.chooseLanguage,
            style: TextStyle(color: AppColour.backgroundLight),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioListTile<Locale>(
                title: Text(dialogContext.l10n.english),
                value: const Locale('en'),
                // ignore: deprecated_member_use
                groupValue: selectedLocale,
                // ignore: deprecated_member_use
                onChanged: (locale) {
                  if (locale != null) {
                    localeCubit.changeLocale(locale);
                    Navigator.of(dialogContext).pop();
                    Navigator.of(context).pop();
                  }
                },
              ),
              RadioListTile<Locale>(
                title: Text(dialogContext.l10n.russian),
                value: const Locale('ru'),
                // ignore: deprecated_member_use
                groupValue: selectedLocale,
                // ignore: deprecated_member_use
                onChanged: (locale) {
                  if (locale != null) {
                    localeCubit.changeLocale(locale);
                    Navigator.of(dialogContext).pop();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              context.l10n.appDrawer,
              textAlign: TextAlign.center,
              style: AppTxtStl.large.copyWith(fontSize: 24),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: getDrawerItems(context).length,
              itemBuilder: (context, index) {
                return DrawerItem(
                  selected: isSelected(context, index),
                  title: getDrawerItems(context)[index],
                  onTap: () => onTap(context, index),
                );
              },
            ),
          ),
          Divider(height: 0.5, color: AppColour.stroke),
          Column(
            children: [
              DrawerFooterItem(
                title: context.l10n.logout,
                onTap: () => context.go(Routes.login),
              ),
              DrawerFooterItem(
                title: context.l10n.settings,
                onTap: () => _onSettingsTap(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DrawerFooterItem extends StatelessWidget {
  const DrawerFooterItem({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, textAlign: TextAlign.center),
      onTap: onTap,
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const DrawerItem({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: 4,
          height: 48,
          decoration: BoxDecoration(
            color: selected ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            onTap: onTap,
            title: Container(
              decoration: BoxDecoration(
                borderRadius: AppRadius.drawerRadius,
                color: selected ? AppColour.secondaryDark : Colors.transparent,
              ),
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                textAlign: TextAlign.center,
                title,
                style: AppTxtStl.medium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
