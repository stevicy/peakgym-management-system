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
    Navigator.of(context).pop(); // Close the drawer first.
    onSelected(page);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      backgroundColor: AppTheme.background,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF11191A), Color(0xFF09281F)],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 10, 18),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/logo_peak.png',
                      width: 64,
                      height: 64,
                      semanticLabel: 'PeakGym logo',
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PeakGym',
                            style: TextStyle(
                              fontSize: 19,
                              color: AppTheme.primaryText,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Management System',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFFC0CEC6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      tooltip: 'Close menu',
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close_rounded,
                          color: AppTheme.primaryText),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: Color(0x66557469)),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'EXPLORE PEAKGYM',
                  style: TextStyle(
                    color: Color(0xFF9FAFA8),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.7,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: [
                    _item(context, title: 'About', icon: Icons.info_outline),
                    _item(context, title: 'Security', icon: Icons.shield_outlined),
                    _item(context, title: 'Help', icon: Icons.help_outline_rounded),
                    if (currentPage != null) ...[
                      const SizedBox(height: 12),
                      const Divider(color: Color(0x66557469)),
                      const SizedBox(height: 14),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: OutlinedButton.icon(
                          onPressed: () => _select(context, 'Login'),
                          icon: const Icon(Icons.login_rounded, size: 20),
                          label: const Text(
                            'Authorized Personnel Login',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppTheme.primaryText,
                            side: const BorderSide(color: AppTheme.primaryGreen),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Text(
                  'Designed with passion for fitness',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFAFBCB5),
                    fontSize: 11,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(BuildContext context,
      {required String title, required IconData icon}) {
    final selected = currentPage == title;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        selected: selected,
        selectedTileColor: const Color(0xFF0E5545),
        selectedColor: AppTheme.primaryGreen,
        iconColor: const Color(0xFFCFDAD3),
        textColor: AppTheme.primaryText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: selected
              ? const BorderSide(color: Color(0x8851B99F))
              : BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
        leading: Icon(icon, size: 24),
        title: Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        onTap: () => _select(context, title),
      ),
    );
  }
}
