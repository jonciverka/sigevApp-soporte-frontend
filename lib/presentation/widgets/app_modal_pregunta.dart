import 'package:flutter/material.dart';
import 'package:sigevappsoportefrontend/config/theme/app_icons.dart';
import 'package:sigevappsoportefrontend/config/theme/app_theme.dart';
import 'package:sigevappsoportefrontend/presentation/widgets/app_buttons.dart';
import 'package:sigevappsoportefrontend/presentation/widgets/app_icon_buttons.dart';

Future<T?> showAppModalPregunta<T extends Object?>({
  required BuildContext context,
  required String title,
  String? question,
  required String yes,
  final String? no,
  required Function() onYes,
  Function()? onNo,
}) =>
    showGeneralDialog(
      context: context,
      fullscreenDialog: false,
      pageBuilder: (context, animation, secondaryAnimation) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.spacing24),
              color: AppTheme.neutralColorWhite,
            ),
            width: 400,
            padding: EdgeInsets.symmetric(
              horizontal: context.spacing20,
              vertical: context.spacing20,
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: context.headingLargeTextStyle,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    AppSecondaryIconButton(
                      icon: AppIcons.close,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                SizedBox(height: context.spacing12),
                AppBottomSheetPreguntaBody(
                  question: question,
                  yes: yes,
                  no: no,
                ),
              ],
            ),
          ),
        ),
      ),
    ).then((value) async {
      if (value == true) {
        onYes();
      } else if (value == false) {
        onNo?.call();
      }
      return null;
    });

class AppBottomSheetPreguntaBody extends StatelessWidget {
  const AppBottomSheetPreguntaBody({
    super.key,
    this.question,
    required this.yes,
    this.no,
  });
  final String? question;
  final String yes;
  final String? no;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (question != null)
          Text(
            question ?? '',
            style: context.bodyRegularTextStyle,
            textAlign: TextAlign.center,
          ),
        if (question != null) SizedBox(height: context.spacing16),
        AppPrimaryButton(
          label: yes,
          onPressed: () => Navigator.pop(context, true),
        ),
        SizedBox(height: context.spacing12),
        AppSecondaryButton(
          label: no ?? "No",
          onPressed: () => Navigator.pop(context, false),
        ),
        SizedBox(height: MediaQuery.paddingOf(context).bottom),
      ],
    );
  }
}
