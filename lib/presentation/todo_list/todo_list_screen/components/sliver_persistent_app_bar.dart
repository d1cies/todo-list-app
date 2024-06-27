import 'package:flutter/material.dart';
import 'package:todo_list/app/theme/theme_color/theme_colors.dart';
import 'package:todo_list/app/theme/theme_text/theme_text.dart';

class SliverPersistentAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double minHeight;
  final int doneTodos;
  final bool showDoneTodos;
  final VoidCallback switchShowDone;

  SliverPersistentAppBar({
    required this.expandedHeight,
    required this.minHeight,
    required this.doneTodos,
    required this.showDoneTodos,
    required this.switchShowDone,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final shift = shrinkOffset / expandedHeight;
    final colors = Theme.of(context).extension<ThemeColors>()!;
    final text = Theme.of(context).extension<ThemeText>()!;
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.passthrough,
      children: [
        Container(
          height: expandedHeight,
          width: double.infinity,
          color: colors.backPrimary,
        ),
        Positioned(
          left: 60 - 44 * shift,
          top: 82 - 50 * shift,
          child: Text(
            'Мои дела',
            style: text.largeTitle.copyWith(
              color: colors.labelPrimary,
              fontSize: 40 - 8 * shift,
              height: (44 - 6 * shift) / (40 - 8 * shift),
            ),
          ),
        ),
        if (shrinkOffset != maxExtent - minExtent)
          Positioned(
            left: 60 - 250 * shift,
            top: 130 - 100 * shift,
            child: Opacity(
              opacity: (1 - shift + 0.5).clamp(0, 1),
              child: Text(
                'Выполнено - $doneTodos',
                style: text.body.copyWith(
                  color: colors.supportSeparator,
                ),
              ),
            ),
          ),
        Positioned(
          right: 24 - 6 * shift,
          top: 114 - 85 * shift,
          child: IconButton(
            icon: Icon(
              showDoneTodos ? Icons.visibility_off : Icons.visibility,
              color: colors.blue,
            ),
            onPressed: switchShowDone,
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
