import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:sigevappsoportefrontend/config/theme/app_icons.dart';
import 'package:sigevappsoportefrontend/config/theme/app_theme.dart';
import 'package:sigevappsoportefrontend/core/constant/strings.dart';
import 'package:sigevappsoportefrontend/domain/models/chat.dart';
import 'package:sigevappsoportefrontend/domain/models/mensaje.dart';
import 'package:sigevappsoportefrontend/presentation/pages/home/cubit/home_cubit.dart';
import 'package:sigevappsoportefrontend/presentation/pages/messages/cubit/messages_cubit.dart';

class AppHeaderChat extends StatefulWidget {
  const AppHeaderChat({super.key, required this.chat});

  final Chat chat;

  @override
  State<AppHeaderChat> createState() => _AppHeaderChatState();
}

class _AppHeaderChatState extends State<AppHeaderChat> {
  OverlayEntry? _overlayEntry;

  void _showMenu() {
    var homeCubit = context.read<HomeCubit>();
    var messageCubit = context.read<MessageCubit>();

    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: _closeMenu,
            behavior: HitTestBehavior.translucent,
            child: Container(color: Colors.transparent),
          ),
          // El menú posicionado
          Positioned(
            top: offset.dy + renderBox.size.height,
            right: 32,
            child: Material(
              color: Colors.transparent,
              // 2. AQUÍ VA: Usamos .value para pasar la instancia existente
              child: MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: homeCubit),
                  BlocProvider.value(value: messageCubit), // Tu segundo Bloc
                ],
                child: AppMenuHeader(onClose: _closeMenu),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _closeMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
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
                      "${widget.chat.claveTramite ?? ''} ",
                      style: context.captionBoldTextStyle.copyWith(
                        color: AppTheme.neutralColorWhite,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: context.spacing4),
                    Text(
                      "${widget.chat.nombreCliente ?? ''} ${widget.chat.apellidoCliente ?? ''}",
                      style: context.captionBoldTextStyle.copyWith(
                        color: AppTheme.neutralColorWhite,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(AppIcons.more),
                color: AppTheme.neutralColorWhite,
                onPressed: () => _showMenu(),
              ),
            ],
          ),
        ),
        // AppMenuHeader(),
      ],
    );
  }
}

class AppMenuHeader extends StatelessWidget {
  const AppMenuHeader({super.key, required this.onClose});
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    var homeCubit = context.read<HomeCubit>();
    var messageCubit = context.read<MessageCubit>();
    return Container(
      width: 300,
      margin: const EdgeInsets.only(top: 3, right: 0, left: 0),
      padding: EdgeInsets.all(context.spacing12),
      decoration: BoxDecoration(
        boxShadow: AppTheme.smallElevationShadow,
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(context.spacing16),
      ),
      child: Column(
        children: [
          AppElementMenuHeader(
            title: AppLocale.infoCliente.getString(context),
            icon: AppIcons.info,
            onTap: () {
              homeCubit.showInfoClient();
              onClose();
            },
          ),
          AppElementMenuHeader(
            title: AppLocale.habilitarRecibirArchivos.getString(context),
            icon: AppIcons.galery,
            onTap: () {
              messageCubit.openModalFinalizarChat();
              onClose();
            },
          ),
          AppElementMenuHeader(
            title: AppLocale.finalizarSoporte.getString(context),
            icon: AppIcons.check,
            onTap: () {
              messageCubit.openModalFinalizarChat();
              onClose();
            },
          ),
        ],
      ),
    );
  }
}

class AppElementMenuHeader extends StatefulWidget {
  const AppElementMenuHeader({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final Function? onTap;

  @override
  State<AppElementMenuHeader> createState() => _AppElementMenuHeaderState();
}

class _AppElementMenuHeaderState extends State<AppElementMenuHeader> {
  late AppElementMenuHeaderState _state;
  late FocusNode _focusNode;

  @override
  void initState() {
    _state = AppElementMenuHeaderState(
      isPressed: false,
      isFocused: false,
      isHovered: false,
    );
    _focusNode = FocusNode(skipTraversal: true);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap?.call();
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      borderRadius: BorderRadius.circular(context.spacing16),
      onHover: (value) =>
          setState(() => _state = _state.copyWith(isHovered: value)),
      onFocusChange: (value) =>
          setState(() => _state = _state.copyWith(isFocused: value)),
      child: Container(
        decoration: BoxDecoration(
          color: _state.isHovered
              ? AppTheme.primaryColorHover
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(
          vertical: context.spacing12,
          horizontal: context.spacing16,
        ),
        child: Row(
          children: [
            Icon(widget.icon, color: AppTheme.neutralColorWhite),
            SizedBox(width: context.spacing12),
            Text(
              widget.title,
              style: context.bodyRegularTextStyle.copyWith(
                color: AppTheme.neutralColorWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppElementMenuHeaderState {
  final bool isPressed;
  final bool isFocused;
  final bool isHovered;
  AppElementMenuHeaderState({
    required this.isPressed,
    required this.isFocused,
    required this.isHovered,
  });

  AppElementMenuHeaderState copyWith({
    bool? isPressed,
    bool? isFocused,
    bool? isHovered,
  }) {
    return AppElementMenuHeaderState(
      isPressed: isPressed ?? this.isPressed,
      isFocused: isFocused ?? this.isFocused,
      isHovered: isHovered ?? this.isHovered,
    );
  }
}
