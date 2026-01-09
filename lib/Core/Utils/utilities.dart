
class DateUtils {
  static DateTime parseDate(String dateStr) {
    try {
      final parts = dateStr.split('/');
      return DateTime(
        int.parse(parts[2]),
        int.parse(parts[0]),
        int.parse(parts[1]),
      );
    } catch (_) {
      return DateTime.now();
    }
  }

  static String formatDate(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
  }
}
