import 'package:flutter/material.dart';

import 'public_page_layout.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PublicPageLayout(
      currentPage: 'Help',
      title: 'PeakGym Help Center',
      subtitle:
          'Get help with login, OTP, account recovery, registration, and support.',
      children: [
        PublicIntroPanel(
          label: 'QUICK HELP',
          title: 'Common Questions & Support',
          description:
              'Find answers about signing in, email verification, password '
              'recovery, account lockouts, and invitation-only staff registration.',
        ),
        SizedBox(height: 24),
        PublicInfoGrid(
          children: [
            PublicInfoCard(
              icon: Icons.person_outline,
              title: 'How do I log in?',
              description:
                  'Enter your PeakGym username and password, complete the '
                  'I\'m not a robot check, and select LOG IN. Then enter '
                  'the six-digit code sent to your registered email. '
                  'The login code expires after 3 minutes.',
            ),
            PublicInfoCard(
              icon: Icons.key_outlined,
              title: 'Where is Forgot password?',
              description:
                  'The Forgot password? link becomes visible after two '
                  'incorrect username or password attempts. Missing CAPTCHA '
                  'verification and email delivery errors do not count as '
                  'failed password attempts.',
            ),
            PublicInfoCard(
              icon: Icons.lock_reset_outlined,
              title: 'How can I reset my password?',
              description:
                  'Choose Forgot password?, identify your account, and '
                  'complete reCAPTCHA. Answer one of your registered '
                  'security questions, verify the email reset code, and '
                  'create a new password.',
            ),
            PublicInfoCard(
              icon: Icons.hourglass_bottom,
              title: 'Why is my account locked?',
              description:
                  'PeakGym applies 18-, 36-, and 72-second account '
                  'lockouts after 3, 6, and 9 failed passwords. Repeated '
                  'failures from the same IP may also temporarily block '
                  'new login attempts. Wait for the restriction to end.',
            ),
            PublicInfoCard(
              icon: Icons.person_add_alt_1_outlined,
              title: 'How do I create a staff account?',
              description:
                  'PeakGym does not allow public staff sign-up. Ask your '
                  'administrator for a private registration invitation. '
                  'Complete the registration fields, privacy consent, '
                  'CAPTCHA, and email verification.',
            ),
            PublicInfoCard(
              icon: Icons.mail_outline,
              title: 'What if my email code does not arrive?',
              description:
                  'Check the email address registered with PeakGym and your '
                  'Spam or Junk folder. If the code expired, request a new '
                  'one when the resend option is available. Contact your '
                  'administrator if email delivery continues to fail.',
            ),
            PublicInfoCard(
              icon: Icons.support_agent,
              title: 'How do I change my password or get access help?',
              description:
                  'Signed-in staff can change their password in Settings. '
                  'If your account is inactive, recovery is unavailable, '
                  'or you need administrator-account assistance, contact '
                  'the PeakGym administrator.',
            ),
          ],
        ),
      ],
    );
  }
}
