import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension WidgetAnimationExtension on Widget {
  //? from place to another
  //! to show any widget from right[start] to left[end]
  /// from start to end with fade
  Widget animateRightLeft({
    Duration duration = const Duration(milliseconds: 500),
    bool isFromStart = true,
  }) {
    return animate()
        .fadeIn(
          duration: 500.ms,
          curve: Curves.easeInOutQuart,
        )
        .moveX(
          delay: 500.ms,
          begin: isFromStart ? 50 : -50,
          end: 0,
          duration: duration,
          curve: Curves.easeInOutQuart,
        );
  }

  ///! to show any widget from bottom to top
  /// from bottom to top with fade
  Widget animateBottomToTop({
    Duration duration = const Duration(milliseconds: 500),
    bool isFromBottom = true,
  }) {
    return animate()
        .fadeIn(
          duration: 500.ms,
          curve: Curves.easeInOutQuart,
        )
        .moveY(
          delay: 500.ms,
          begin: isFromBottom ? 50 : -50,
          end: 0,
          duration: 500.ms,
          curve: Curves.easeInOutQuart,
        );
  }

  //? shine widget
  //! like shimmer, but all widget is gray then normal color, repeatedly
  /// from half gray to normal color repeated
  Widget animateHalfGrayToNormalColorRepeated({
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return animate(
      onPlay: (controller) => controller.repeat(reverse: true),
    ).desaturate(
      begin: 0.5,
      end: 1.0,
      delay: 500.ms,
      duration: duration,
      curve: Curves.easeInOutQuart,
    );
  }

  ///! to buttons and colorful widgets, icons, حاجة بتلمع
  /// make shimmer in the widget
  Widget animateShimmer({
    List<Color>? colors,
    Duration duration = const Duration(milliseconds: 1500),
  }) {
    return animate(
      onPlay: (controller) => controller.repeat(reverse: true),
    ).shimmer(
      delay: 500.ms,
      duration: duration,
      colors: colors,
    );
  }

  //? be carful widget
  //! to alarm things / errors / something wrong / wrong answers, عايز تنبه لحاجة
  /// like alarm
  Widget animateShakeAlarm({
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return animate(
      onPlay: (controller) => controller.repeat(),
    ).shake(
      hz: 10,
      delay: 2500.ms,
      duration: duration,
    );
  }

  //? show from nowhere
  //! to show texts, images, icons, etc, حاجة تظهر من النص وتبدأ تكبر
  /// go from alignment [default=Center] to normal place vertically
  Widget animateFlipVertical({
    Duration duration = const Duration(milliseconds: 500),
    Alignment alignment = Alignment.center,
  }) {
    return animate().flipV(
      alignment: alignment,
      begin: 0.5,
      end: 0,
      delay: 500.ms,
      duration: duration,
      curve: Curves.easeInOutQuart,
    );
  }

  ///! to show texts, images, icons, etc, حاجة تظهر من النص وتبدأ تكبر
  /// go from alignment [default=Center] to normal place horizontally
  Widget animateFlipHorizontal({
    Duration duration = const Duration(milliseconds: 500),
    Alignment alignment = Alignment.center,
  }) {
    return animate().flipH(
      alignment: alignment,
      begin: 0.5,
      end: 0,
      delay: 500.ms,
      duration: duration,
      curve: Curves.easeInOutQuart,
    );
  }

  ///! to show texts, images, icons, etc, حاجة تظهر بشقلبة
  // بيشقلب
  Widget animateRotate({
    Duration duration = const Duration(seconds: 1),
    Alignment alignment = Alignment.center,
  }) {
    return animate().rotate(
      alignment: alignment,
      begin: 0.5,
      end: 1,
      curve: Curves.easeInOutQuart,
      delay: 500.ms,
      duration: duration,
    );
  }

  ///! to show texts, images, icons, etc, حاجة تظهر من النص وتبدأ تكبر
  /// become bigger vertically
  Widget animateScaleNFadeVertical({
    Duration duration = const Duration(milliseconds: 1000),
    Alignment alignment = Alignment.center,
  }) {
    return animate(
      onPlay: (controller) => controller.repeat(reverse: true),
    )
        .fadeIn(
          duration: 500.ms,
          curve: Curves.easeInOutQuart,
        )
        .scaleY(
          alignment: alignment,
          begin: 0.5,
          end: 1,
          curve: Curves.easeInOutQuart,
          delay: 500.ms,
          duration: duration,
        );
  }

  ///! to show texts, images, icons, etc, حاجة تظهر من النص وتبدأ تكبر
  /// become bigger horizontally
  Widget animateScaleNFadeHorizontal({
    Duration duration = const Duration(milliseconds: 1000),
    Alignment alignment = Alignment.center,
  }) {
    return animate()
        .fadeIn(
          duration: 500.ms,
          curve: Curves.easeInOutQuart,
        )
        .scaleX(
          alignment: alignment,
          begin: 0.0,
          end: 1,
          curve: Curves.easeInOutQuart,
          delay: 500.ms,
          duration: duration,
        );
  }

  ///! so normal animation
  Widget animateSlideTopToNormal({
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return animate().slide(
      delay: 500.ms,
      duration: duration,
    );
  }

  //? show to hide case
  /// After a while it disappears
  Widget animateAfterDurationHide({
    Duration duration = const Duration(milliseconds: 500),
    bool maintain = false,
  }) {
    return animate().hide(
      maintain: maintain,
      delay: 500.ms,
      duration: 500.ms,
    );
  }

  //? hide to visibility case
  /// After a while it appears
  Widget animateAfterDurationVisibility({
    Duration duration = const Duration(milliseconds: 500),
    bool maintain = false,
  }) {
    return animate().visibility(
      maintain: maintain,
      delay: 500.ms,
      duration: 500.ms,
    );
  }

  //? blur to normal case
  /// from blur to normal
  Widget animateBlur({
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return animate().blur(
      end: const Offset(0, 0),
      begin: const Offset(2, 2),
      delay: 500.ms,
      duration: 500.ms,
      curve: Curves.easeInOutQuart,
    );
  }
}
