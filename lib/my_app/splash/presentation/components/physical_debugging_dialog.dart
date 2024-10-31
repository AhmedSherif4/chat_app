part of '../../splash_screen.dart';

class PhysicalDebuggingDialog extends StatelessWidget {
  final Function(bool) onTap;

  const PhysicalDebuggingDialog({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: ExitAndUpdateDialog(
        title: AppStrings.developerModeCheckTitle,
        message: "هذا الجهاز غير امن",
        imagePath: AppIconsAssets.sUpdate,
        withImage: false,
        titleColor: AppColors.primaryColor(context),
        confirm: onTap,
        isUpdateDialog: false,
        isSecurityDialog: true,
      ),
    );
  }
}
