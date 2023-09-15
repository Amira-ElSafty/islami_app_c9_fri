import 'package:flutter/material.dart';
import 'package:flutter_app_islami_c9_fri/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            provider.changeLanguage('en');
          },
          child: provider.appLanguage == 'en'
              ? getSelectedItemWidget(
                  context, AppLocalizations.of(context)!.english)
              : getUnSelectedItemWidget(
                  context, AppLocalizations.of(context)!.english),
        ),
        InkWell(
            onTap: () {
              provider.changeLanguage('ar');
            },
            child: provider.appLanguage == 'ar'
                ? getSelectedItemWidget(
                    context, AppLocalizations.of(context)!.arabic)
                : getUnSelectedItemWidget(
                    context, AppLocalizations.of(context)!.arabic)),
      ],
    );
  }

  Widget getSelectedItemWidget(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
          Icon(
            Icons.check,
            color: Theme.of(context).primaryColor,
            size: 30,
          )
        ],
      ),
    );
  }

  Widget getUnSelectedItemWidget(BuildContext context, String text) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ));
  }
}
