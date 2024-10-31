part of '../../splash_screen.dart';

class RepairDialog extends StatelessWidget {
  final Function(bool) onTap;

  const RepairDialog({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: ExitAndUpdateDialog(
        title: AppStrings.repairing,
        message: '',
        imagePath: AppImagesAssets.sRepair,
        withImage: true,
        titleColor: AppColors.primaryColor(context),
        confirm: onTap,
        isUpdateDialog: true,
      ),
    );
  }
}
