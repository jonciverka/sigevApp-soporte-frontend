import 'package:flutter/material.dart';
import 'package:sigevappsoportefrontend/config/theme/app_icons.dart';
import 'package:sigevappsoportefrontend/config/theme/app_theme.dart';
import 'package:sigevappsoportefrontend/domain/models/chat.dart';

class AppHeaderChat extends StatelessWidget {
  const AppHeaderChat({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing16,
        vertical: context.spacing12,
      ),
      decoration: BoxDecoration(
        boxShadow: AppTheme.smallElevationShadow,
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(context.spacing16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: context.spacing24,
            backgroundColor: AppTheme.semanticColorInfo,
            child: Icon(AppIcons.person),
          ),
          SizedBox(width: context.spacing12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${chat.claveTramite ?? ''} ",
                  style: context.captionBoldTextStyle.copyWith(
                    color: AppTheme.neutralColorWhite,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: context.spacing4),
                Text(
                  "${chat.nombreCliente ?? ''} ${chat.apellidoCliente ?? ''}",
                  style: context.captionBoldTextStyle.copyWith(
                    color: AppTheme.neutralColorWhite,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
