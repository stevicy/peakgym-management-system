import 'package:web/web.dart' as web;

// UI hint only. All actual failed-attempt limits are enforced by FastAPI.
const _storageKey = 'peakgym_failed_login_display_count';

int readFailedLoginCount() {
  try {
    final count =
        int.tryParse(web.window.sessionStorage.getItem(_storageKey) ?? '') ?? 0;
    if (count <= 0) return 0;
    return count >= 2 ? 2 : count;
  } catch (_) {
    return 0; // Storage may be disabled by the browser.
  }
}

void saveFailedLoginCount(int count) {
  try {
    if (count <= 0) {
      web.window.sessionStorage.removeItem(_storageKey);
    } else {
      web.window.sessionStorage.setItem(
        _storageKey,
        count >= 2 ? '2' : '$count',
      );
    }
  } catch (_) {
    // Continue using widget state if browser storage is unavailable.
  }
}
