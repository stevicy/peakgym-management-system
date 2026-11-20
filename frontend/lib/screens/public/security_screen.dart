import 'package:flutter/material.dart';

import 'public_page_layout.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PublicPageLayout(
      currentPage: 'Security',
      title: 'Your account security',
      subtitle: 'Learn how PeakGym protects sign-ins, sessions, and staff information.',
      children: [
        PublicInfoCard(
          icon: Icons.verified_user_outlined,
          title: 'Secure sign-in verification',
          description:
              'Sign in using your username and password, complete the '
              'reCAPTCHA check, and enter the six-digit verification code '
              'sent to your registered email. The login code expires after '
              '3 minutes.',
        ),
        PublicInfoCard(
          icon: Icons.timer_outlined,
          title: 'Progressive account lockouts',
          description:
              'Incorrect passwords trigger temporary account lockouts at '
              '3, 6, and 9 failed attempts: 18, 36, and 72 seconds, '
              'respectively. Wait for the countdown before trying again.',
        ),
        PublicInfoCard(
          icon: Icons.shield_outlined,
          title: 'IP protection and security alerts',
          description:
              'Repeated failed logins from the same IP address may cause '
              'a temporary block. PeakGym records security events and '
              'sends alerts to help administrators review suspicious activity.',
        ),
        PublicInfoCard(
          icon: Icons.key_outlined,
          title: 'Password recovery',
          description:
              'The Forgot password? link appears after two failed '
              'credential attempts. Password recovery verifies your '
              'security-question answer and a code sent to your '
              'registered email before allowing a new password.',
        ),
        PublicInfoCard(
          icon: Icons.logout,
          title: 'Session and password safety',
          description:
              'Keep passwords and verification codes private. PeakGym '
              'protects authenticated sessions and signs out inactive '
              'users after the configured idle timeout. Always log out '
              'when finished, especially on shared devices.',
        ),
        PublicInfoCard(
          icon: Icons.privacy_tip_outlined,
          title: 'Privacy and role-based access',
          description:
              'Staff registration requires a private invitation and '
              'privacy consent. Access is limited by account role, '
              'and security activity is recorded for administrator review.',
        ),
      ],
    );
  }
}
