import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showTopMessage({
  required String content,
  required BuildContext context,
  required String title,
  bool isSuccess = true,
}) {
  final overlay = Overlay.of(context);

  late OverlayEntry entry;

  entry = OverlayEntry(
    builder:
        (_) => _TopMessageWidget(
          title: title,
          content: content,
          isSuccess: isSuccess,
          onFinish: () => entry.remove(),
        ),
  );

  overlay.insert(entry);
}

class _TopMessageWidget extends StatefulWidget {
  final String title;
  final String content;
  final bool isSuccess;
  final VoidCallback onFinish;

  const _TopMessageWidget({
    required this.title,
    required this.content,
    required this.isSuccess,
    required this.onFinish,
  });

  @override
  State<_TopMessageWidget> createState() => _TopMessageWidgetState();
}

class _TopMessageWidgetState extends State<_TopMessageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _offset = Tween<Offset>(
      begin: const Offset(0, -1), // من فوق الشاشة
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () async {
      await _controller.reverse();
      widget.onFinish();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: _offset,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: widget.isSuccess ? AppColors.mainBlue : AppColors.coralRed,
            ),
            child: Row(
              children: [
                Icon(
                  widget.isSuccess ? Icons.info_outline : Icons.error_outline,
                  color: Colors.white,
                  size: 30,
                ),
                horizontalSpace(8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title, style: TextStyles.font17WhiteSemiBold),
                      verticalSpace(4),
                      Text(
                        widget.content,
                        style: TextStyles.font14WhiteRegular.copyWith(
                          height: 1.3,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
