part of '../../splash_screen.dart';

class UpdateDialog extends StatelessWidget {
  final Function(bool) onTap;
  final bool canPop;

  const UpdateDialog({super.key, required this.onTap, required this.canPop});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      child: ExitAndUpdateDialog(
        title: AppStrings.updateAvailableTitle,
        message: AppStrings.updateAvailableBody,
        imagePath: AppIconsAssets.sUpdate,
        withImage: true,
        titleColor: AppColors.primaryColor(context),
        confirm: onTap,
        isUpdateDialog: true,
        requiredUpdate: canPop,
      ),
    );
  }
}
