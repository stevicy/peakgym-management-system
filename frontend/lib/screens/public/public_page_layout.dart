import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import 'about_screen.dart';
import 'security_screen.dart';
import 'help_screen.dart';
import 'public_navigation.dart';

class PublicPageLayout extends StatelessWidget {
  final String currentPage;
  final String title;
  final String subtitle;
  final List<Widget> children;

  const PublicPageLayout({
    super.key,
    required this.currentPage,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  void _openPage(BuildContext context, String page) {
    if (page == 'Login') {
      // Public pages were opened from the login screen.
      Navigator.of(context).popUntil((route) => route.isFirst);
      return;
    }
    if (page == currentPage) return;

    final Widget screen;
    switch (page) {
      case 'About':
        screen = const AboutScreen();
        break;
      case 'Security':
        screen = const SecurityScreen();
        break;
      case 'Help':
        screen = const HelpScreen();
        break;
      default:
        return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      drawer: PublicNavigation(
        currentPage: currentPage,
        onSelected: (page) => _openPage(context, page),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF07110F),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        titleSpacing: MediaQuery.sizeOf(context).width < 600 ? 12 : 28,
        flexibleSpace: const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF080D0C),
                Color(0xFF0A1F1A),
                Color(0xFF074333),
              ],
              stops: [0, 0.6, 1],
            ),
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/logo_peak.png',
              width: MediaQuery.sizeOf(context).width < 600 ? 42 : 54,
              height: MediaQuery.sizeOf(context).width < 600 ? 42 : 54,
              semanticLabel: 'PeakGym logo',
            ),
            const SizedBox(width: 14),
            Container(
              width: 1,
              height: 42,
              color: const Color(0x805D897B),
            ),
            const SizedBox(width: 14),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PeakGym',
                  style: TextStyle(
                    color: AppTheme.primaryText,
                    fontSize: MediaQuery.sizeOf(context).width < 600 ? 18 : 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.4,
                  ),
                ),
                if (MediaQuery.sizeOf(context).width >= 600)
                  const Text(
                    'MANAGEMENT SYSTEM',
                    style: TextStyle(
                      color: Color(0xFFACC7BC),
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.2,
                    ),
                  ),
              ],
            ),
          ],
        ),
        actions: [
          Builder(
            builder: (drawerContext) => Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: OutlinedButton(
                  onPressed: () => Scaffold.of(drawerContext).openDrawer(),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.primaryText,
                    backgroundColor: const Color(0xAA0B3329),
                    side: const BorderSide(
                      color: Color(0xFF11CBA5),
                      width: 1.5,
                    ),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17,
                      vertical: 12,
                    ),
                    minimumSize: const Size(0, 46),
                  ).copyWith(
                    overlayColor: WidgetStateProperty.all(
                      const Color(0x3311CBA5),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.menu_rounded, size: 22),
                      const SizedBox(width: 9),
                      const Text(
                        'Menu',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (MediaQuery.sizeOf(context).width >= 600) ...[
                        const SizedBox(width: 8),
                        const Icon(Icons.keyboard_arrow_down_rounded, size: 19),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFF206451),
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Reuse the exact background asset and alignment from LoginScreen.
          Image.asset(
            'assets/login_dumbbell.jpg',
            fit: BoxFit.cover,
            alignment: const Alignment(0.7, -0.65),
            excludeFromSemantics: true,
            errorBuilder: (context, error, stackTrace) =>
                const ColoredBox(color: AppTheme.background),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xE6080D0B),
                  Color(0xB0080D0B),
                  Color(0xBB080D0B),
                ],
                stops: [0, 0.56, 1],
              ),
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.bottomLeft,
                radius: 1.2,
                colors: [Color(0x3300C9A7), Colors.transparent],
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 800;
              return SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  isWide ? 44 : 20,
                  isWide ? 40 : 26,
                  isWide ? 44 : 20,
                  36,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xCC074336),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(0x7739A38D),
                            ),
                          ),
                          child: Text(
                            currentPage.toUpperCase(),
                            style: const TextStyle(
                              color: AppTheme.primaryGreen,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          title,
                          style: TextStyle(
                            color: AppTheme.primaryText,
                            fontSize: isWide ? 44 : 33,
                            fontWeight: FontWeight.w900,
                            height: 1.13,
                            letterSpacing: -1.1,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            color: Color(0xFFD1DAD5),
                            fontSize: 15,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 23),
                        Container(
                          width: 92,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            gradient: const LinearGradient(
                              colors: [
                                AppTheme.primaryGreen,
                                AppTheme.accentYellow,
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 36),
                        ...children,
                        const SizedBox(height: 45),
                        const Divider(color: Color(0x6657776A)),
                        const SizedBox(height: 18),
                        SizedBox(
                          width: double.infinity,
                          child: Flex(
                            direction: isWide ? Axis.horizontal : Axis.vertical,
                            mainAxisAlignment: isWide
                                ? MainAxisAlignment.spaceBetween
                                : MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '© ${DateTime.now().year} PeakGym Fitness. '
                                'All rights reserved.',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFFC0CAC5),
                                  fontSize: 11,
                                  height: 1.6,
                                ),
                              ),
                              SizedBox(height: isWide ? 0 : 5),
                              const Text(
                                'Designed with passion for fitness',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFABB9B2),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Reusable introductory panel within the existing layout file.
class PublicIntroPanel extends StatelessWidget {
  final String label;
  final String title;
  final String description;

  const PublicIntroPanel({
    super.key,
    required this.label,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: const Color(0xE111201D),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0x9958796D)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.primaryGreen,
              fontSize: 12,
              letterSpacing: 2,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: AppTheme.primaryText,
              fontSize: 25,
              height: 1.2,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            description,
            style: const TextStyle(
              color: Color(0xFFD0DBD5),
              fontSize: 14,
              height: 1.75,
            ),
          ),
        ],
      ),
    );
  }
}

// Fit existing information cards into a responsive grid on desktop/mobile.
class PublicInfoGrid extends StatelessWidget {
  final List<Widget> children;

  const PublicInfoGrid({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 880
            ? 3
            : constraints.maxWidth >= 580
                ? 2
                : 1;
        final width = (constraints.maxWidth - 16 * (columns - 1)) / columns;
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            for (final child in children)
              SizedBox(width: width, child: child),
          ],
        );
      },
    );
  }
}

class PublicInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const PublicInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xE112211E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x99507466)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xCC0C4E3F),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: AppTheme.primaryGreen, size: 26),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              color: AppTheme.primaryText,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            description,
            style: const TextStyle(
              color: Color(0xFFD0DAD4),
              fontSize: 13.5,
              height: 1.65,
            ),
          ),
        ],
      ),
    );
  }
}
