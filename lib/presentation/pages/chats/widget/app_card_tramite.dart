import 'package:flutter/material.dart';
import 'package:sigevappsoportefrontend/config/theme/app_icons.dart';
import 'package:sigevappsoportefrontend/config/theme/app_theme.dart';
import 'package:sigevappsoportefrontend/core/utilities/utilities.dart';
import 'package:sigevappsoportefrontend/domain/models/chat.dart';

class AppCardTramite extends StatelessWidget {
  const AppCardTramite({super.key, required this.chat, this.onDeletePressed});

  final Chat chat;
  final VoidCallback? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onDeletePressed?.call(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing16,
          vertical: context.spacing12,
        ),
        decoration: BoxDecoration(
          boxShadow: AppTheme.smallElevationShadow,
          color: AppTheme.neutralColorWhite,
          borderRadius: BorderRadius.circular(context.spacing16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${chat.claveTramite ?? ''} ",
                        style: context.captionBoldTextStyle.copyWith(
                          color: AppTheme.neutralColorBlack,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                      Text(
                        "${Utilities().formatDate(chat.fechachat ?? DateTime.now())} ",
                        style: context.captionBoldTextStyle.copyWith(
                          color: AppTheme.neutralColorBlack,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: context.spacing4),
                  Text(
                    "${chat.nombreCliente ?? ''} ${chat.apellidoCliente ?? ''}",
                    style: context.captionBoldTextStyle.copyWith(
                      color: AppTheme.neutralColorBlack,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
