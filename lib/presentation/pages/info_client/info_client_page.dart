import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:sigevappsoportefrontend/config/theme/app_icons.dart';
import 'package:sigevappsoportefrontend/config/theme/app_theme.dart';
import 'package:sigevappsoportefrontend/core/constant/strings.dart';
import 'package:sigevappsoportefrontend/presentation/pages/home/cubit/home_cubit.dart';
import 'package:sigevappsoportefrontend/presentation/widgets/app_icon_buttons.dart';

class InfoClientPage extends StatelessWidget {
  const InfoClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = context.read<HomeCubit>();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing16,
        vertical: context.spacing32,
      ),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              AppIconButton(
                icon: AppIcons.close,
                onPressed: () => homeCubit.hideInfoClient(),
              ),
              Text(
                AppLocale.infoCliente.getString(context),
                style: context.bodyBoldTextStyle.copyWith(
                  color: AppTheme.neutralColorWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
