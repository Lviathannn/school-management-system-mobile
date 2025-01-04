import 'package:intl/intl.dart';

String formatRupiah(int number, {bool withSymbol = true}) {
  final formatter = NumberFormat.currency(
    locale: 'id', 
    symbol: withSymbol ? 'Rp ' : '', 
    decimalDigits: 0, 
  );
  return formatter.format(number);
}
