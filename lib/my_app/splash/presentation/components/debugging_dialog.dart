part of '../../splash_screen.dart';

class DebuggingDialog extends StatelessWidget {
  final Function(bool) onTap;

  const DebuggingDialog({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: ExitAndUpdateDialog(
        title: AppStrings.developerModeCheckTitle,
        message: AppStrings.developerModeCheckBody,
        imagePath: AppIconsAssets.sUpdate,
        withImage: false,
        titleColor: AppColors.primaryColor(context),
        confirm: onTap,
        isUpdateDialog: true,
      ),
    );
  }
}
