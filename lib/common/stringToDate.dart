import 'package:intl/intl.dart';

class stringToDateConvert{
  static String formateDateFromString(String date){
    if(date == null || date.isEmpty)
      return '';

    try{
      DateTime parsedDate = DateTime.parse(date);
      return DateFormat('dd-MM-yyyy').format(parsedDate);

    }catch(e){
      return '';
    }
  }
}