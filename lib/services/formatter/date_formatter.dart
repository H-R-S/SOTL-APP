import 'package:intl/intl.dart';

class DateFormatter {

  static String dateFormatter(String timestamp) {
  try {
    final inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    final outputFormat = DateFormat("dd MMM yyyy");
    final dateTime = inputFormat.parse(timestamp, true).toLocal();
    return outputFormat.format(dateTime);
  } catch (e) {
    return 'Invalid Date';
  }
}
}