import 'package:intl/intl.dart';

String formatDate(DateTime selectedDate) {
  return DateFormat("EEEE, d 'de' MMMM", 'pt_BR').format(selectedDate);
}
