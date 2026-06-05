import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';

enum MockupScreen { home, plan, grocery }

class AppMockup extends StatelessWidget {
  const AppMockup({
    super.key,
    required this.screen,
    this.width = 220,
    this.elevated = true,
  });

  final MockupScreen screen;
  final double width;
  final bool elevated;

  @override
  Widget build(BuildContext context) {
    final height = width * 2.05;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.divider),
        boxShadow: elevated
            ? [
                BoxShadow(
                  color: AppColors.ink.withValues(alpha: 0.08),
                  blurRadius: 32,
                  offset: const Offset(0, 16),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Column(
          children: [
            _StatusBar(width: width),
            Expanded(child: _ScreenContent(screen: screen, width: width)),
            _BottomNav(active: screen),
          ],
        ),
      ),
    );
  }
}

class _StatusBar extends StatelessWidget {
  const _StatusBar({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width * 0.12,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      color: AppColors.cream,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9:41',
            style: TextStyle(
              fontSize: width * 0.045,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
          Row(
            children: [
              Icon(Icons.signal_cellular_alt, size: width * 0.04, color: AppColors.inkMuted),
              SizedBox(width: width * 0.02),
              Icon(Icons.wifi, size: width * 0.04, color: AppColors.inkMuted),
              SizedBox(width: width * 0.02),
              Icon(Icons.battery_full, size: width * 0.04, color: AppColors.inkMuted),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.active});

  final MockupScreen active;

  @override
  Widget build(BuildContext context) {
    final items = [
      (MockupScreen.home, Icons.home_outlined, 'Home'),
      (MockupScreen.plan, Icons.calendar_month_outlined, 'Plan'),
      (MockupScreen.grocery, Icons.shopping_bag_outlined, 'Grocery'),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.divider)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (final (screen, icon, label) in items)
            _NavItem(
              icon: icon,
              label: label,
              selected: active == screen,
            ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
  });

  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.sage : AppColors.inkFaint;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 9,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _ScreenContent extends StatelessWidget {
  const _ScreenContent({required this.screen, required this.width});

  final MockupScreen screen;
  final double width;

  @override
  Widget build(BuildContext context) {
    final compact = width < 160;

    return ClipRect(
      child: switch (screen) {
        MockupScreen.home => _HomePlaceholder(compact: compact),
        MockupScreen.plan => _PlanPlaceholder(compact: compact),
        MockupScreen.grocery => _GroceryPlaceholder(compact: compact),
      },
    );
  }
}

class _HomePlaceholder extends StatelessWidget {
  const _HomePlaceholder({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final padding = compact ? AppSpacing.sm : AppSpacing.md;

    return Container(
      color: AppColors.cream,
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: compact ? 12 : 16,
                ),
          ),
          const SizedBox(height: AppSpacing.sm),
          _PlaceholderBlock(
            height: 56,
            color: AppColors.sage.withValues(alpha: 0.15),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.sage.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _Line(widthFactor: 0.6, color: AppColors.ink),
                      const SizedBox(height: 4),
                      _Line(widthFactor: 0.4, color: AppColors.inkMuted),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'This week',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 11),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              for (final day in ['M', 'T', 'W', 'T', 'F'])
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: _PlaceholderBlock(
                      height: 40,
                      color: day == 'W'
                          ? AppColors.sage.withValues(alpha: 0.25)
                          : AppColors.creamDark,
                      child: Center(
                        child: Text(
                          day,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: day == 'W' ? FontWeight.w600 : FontWeight.w500,
                            color: day == 'W' ? AppColors.sageDark : AppColors.inkFaint,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (!compact) ...[
            const Spacer(),
            _PlaceholderBlock(
              height: 48,
              color: AppColors.terracotta.withValues(alpha: 0.12),
              child: Center(
                child: Text(
                  'Week B starts Monday',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.terracotta,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PlanPlaceholder extends StatelessWidget {
  const _PlanPlaceholder({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final padding = compact ? AppSpacing.sm : AppSpacing.md;
    final weeks = compact
        ? [
            ('Week A', AppColors.sage),
            ('Week B', AppColors.terracotta),
          ]
        : [
            ('Week A', AppColors.sage),
            ('Week B', AppColors.terracotta),
            ('Week C', AppColors.sageDark),
          ];

    return Container(
      color: AppColors.cream,
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Meal Plans',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: compact ? 12 : 16,
                ),
          ),
          SizedBox(height: compact ? AppSpacing.sm : AppSpacing.md),
          for (final (name, color) in weeks)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: _PlaceholderBlock(
                height: compact ? 40 : 52,
                color: color.withValues(alpha: 0.1),
                child: Row(
                  children: [
                    Container(
                      width: compact ? 24 : 32,
                      height: compact ? 24 : 32,
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.repeat, size: compact ? 12 : 16, color: color),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: compact ? 10 : 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: compact ? 14 : 18,
                      color: AppColors.inkFaint,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _GroceryPlaceholder extends StatelessWidget {
  const _GroceryPlaceholder({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final padding = compact ? AppSpacing.sm : AppSpacing.md;
    final items = compact
        ? [
            ('Chicken', false),
            ('Rice', false),
            ('Broccoli', true),
          ]
        : [
            ('Chicken thighs', false),
            ('Brown rice', false),
            ('Broccoli', true),
            ('Olive oil', false),
            ('Garlic', true),
          ];

    return Container(
      color: AppColors.cream,
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Grocery List',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: compact ? 12 : 16,
                ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Week B · 12 items',
            style: TextStyle(fontSize: compact ? 8 : 10, color: AppColors.inkMuted),
          ),
          SizedBox(height: compact ? AppSpacing.sm : AppSpacing.md),
          for (final (item, checked) in items)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                children: [
                  Container(
                    width: compact ? 14 : 18,
                    height: compact ? 14 : 18,
                    decoration: BoxDecoration(
                      color: checked
                          ? AppColors.sage.withValues(alpha: 0.3)
                          : Colors.transparent,
                      border: Border.all(
                        color: checked ? AppColors.sage : AppColors.divider,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: checked
                        ? const Icon(Icons.check, size: 12, color: AppColors.sageDark)
                        : null,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      item,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: compact ? 9 : 11,
                        color: checked ? AppColors.inkFaint : AppColors.ink,
                        decoration: checked ? TextDecoration.lineThrough : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _PlaceholderBlock extends StatelessWidget {
  const _PlaceholderBlock({
    required this.height,
    required this.color,
    required this.child,
  });

  final double height;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({required this.widthFactor, required this.color});

  final double widthFactor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Container(
        height: 6,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.25),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}
