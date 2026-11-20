import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class PublicNavigation extends StatelessWidget {
  final String? currentPage;
  final ValueChanged<String> onSelected;

  const PublicNavigation({
    super.key,
    this.currentPage,
    required this.onSelected,
  });

  void _select(BuildContext context, String page) {
    Navigator.of(context).pop(); // Close the drawer before navigating.
    onSelected(page);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 245,
      backgroundColor: AppTheme.cardBackground,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Container(
        decoration: const BoxDecoration(
          color: AppTheme.cardBackground,
          border: Border(right: BorderSide(color: AppTheme.borderColor)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/logo_peak.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.contain,
                      semanticLabel: 'PeakGym logo',
                    ),
                    const SizedBox(width: 5),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PEAKGYM',
                            maxLines: 1,
                            style: TextStyle(
                              color: AppTheme.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.7,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'MANAGEMENT SYSTEM',
                            maxLines: 1,
                            style: TextStyle(
                              color: AppTheme.secondaryText,
                              fontSize: 7,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _closeButton(context),
                  ],
                ),
                const SizedBox(height: 18),
                const Divider(height: 1, color: AppTheme.borderColor),
                const SizedBox(height: 28),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    'EXPLORE PEAKGYM',
                    style: TextStyle(
                      color: AppTheme.secondaryText,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _item(context, title: 'About', icon: Icons.info_outline),
                      _item(
                        context,
                        title: 'Security',
                        icon: Icons.shield_outlined,
                      ),
                      _item(
                        context,
                        title: 'Help',
                        icon: Icons.help_outline_rounded,
                      ),
                    ],
                  ),
                ),
                if (currentPage != null) ...[
                  const Divider(height: 1, color: AppTheme.borderColor),
                  const SizedBox(height: 18),
                  _loginAction(context),
                  const SizedBox(height: 26),
                ],
                const Text(
                  'Designed with passion for fitness',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.secondaryText,
                    fontSize: 10,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _closeButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Tooltip(
        message: 'Close menu',
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          hoverColor: const Color(0xFF20292B),
          onTap: () => Navigator.of(context).pop(),
          child: const SizedBox(
            width: 28,
            height: 34,
            child: Icon(Icons.close_rounded, size: 18,
                color: AppTheme.secondaryText),
          ),
        ),
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required String title,
    required IconData icon,
  }) {
    final active = currentPage == title;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: active
            ? AppTheme.primaryGreen.withValues(alpha: 0.08)
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: active
                ? AppTheme.primaryGreen.withValues(alpha: 0.25)
                : Colors.transparent,
          ),
        ),
        child: InkWell(
          onTap: active ? null : () => _select(context, title),
          borderRadius: BorderRadius.circular(4),
          hoverColor: const Color(0xFF20292B),
          child: Container(
            constraints: const BoxConstraints(minHeight: 48),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                if (active) ...[
                  Container(
                    width: 3,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(width: 11),
                ],
                Icon(
                  icon,
                  size: 18,
                  color: active
                      ? AppTheme.primaryText
                      : AppTheme.secondaryText,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: active
                          ? AppTheme.primaryText
                          : AppTheme.secondaryText,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginAction(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppTheme.borderColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: () => _select(context, 'Login'),
        borderRadius: BorderRadius.circular(4),
        hoverColor: const Color(0xFF20292B),
        child: const SizedBox(
          height: 46,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(Icons.login_rounded,
                    size: 18, color: AppTheme.secondaryText),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Authorized Personnel Login',
                    maxLines: 1,
                    style: TextStyle(
                      color: AppTheme.primaryText,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
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
