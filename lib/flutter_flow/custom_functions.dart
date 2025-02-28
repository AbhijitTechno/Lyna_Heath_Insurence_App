import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

List<String>? getServiceNames(List<dynamic>? mainList) {
  List<String> serviceNames = [];
  if (mainList != null) {
    for (var element in mainList!) {
      if (element is Map<String, dynamic> &&
          element["name"] != null &&
          element["name"].isNotEmpty) {
        serviceNames.add(element["name"]);
      }
    }
  }
  return serviceNames;
}

int? getServiceIdByName(
  List<dynamic> mainList,
  String? servicename,
) {
  int? sId;
  for (var element in mainList) {
    if (element['name'] == servicename) {
      sId = element['id'];
    }
  }
  return sId;
}

String? stringNullCheck(String? string) {
  if (string != null && string.isNotEmpty && string != "null") {
    return string;
  } else {
    return "";
  }
}

int? getFolderIdByName(
  List<dynamic> mainList,
  String? foldername,
) {
  int? sId;
  for (var element in mainList) {
    if (element['folder_name'] == foldername) {
      sId = element['folder_id'];
    }
  }
  return sId;
}

List<String>? getFolderNames(List<dynamic>? mainList) {
  List<String> serviceNames = [];
  if (mainList != null) {
    for (var element in mainList!) {
      if (element is Map<String, dynamic> &&
          element["folder_name"] != null &&
          element["folder_name"].isNotEmpty) {
        serviceNames.add(element["folder_name"]);
      }
    }
  }
  return serviceNames;
}

String? stringNullCheckCopy(String? string) {
  if (string != null && string.isNotEmpty && string != "null") {
    return string;
  } else {
    return "0";
  }
}

List<dynamic>? createTimeslot(
  int start,
  int end,
  DateTime dateNew,
) {
  var now = dateNew ?? DateTime.now();
  List<dynamic> slotList = [];
  for (var i = start; i < end; i++) {
    // now.add(Duration(minutes: (60*i)))
    // 'start': '${DateTime(now.year, now.month, now.day, now.hour + i, 0)}',
    //     'end': '${DateTime(now.year, now.month, now.day, now.hour + i + 1, 0)}',
    //     'mer': 'AM'
    if (i < 12) {
      slotList.add({
        'start': '${DateTime(now.year, now.month, now.day, i, 0)}',
        'end': '${DateTime(now.year, now.month, now.day, i + 1, 0)}',
        'mer': 'AM'
      });
    } else if (i == 12) {
      // slotList.add({'start': '${i}', 'end': '${i + 1 - 12}', 'mer': 'PM'});
      slotList.add({
        'start': '${DateTime(now.year, now.month, now.day, i, 0)}',
        'end': '${DateTime(now.year, now.month, now.day, i + 1, 0)}',
        'mer': 'PM'
      });
    } else {
      // slotList.add({'start': '${i - 12}', 'end': '${i + 1 - 12}', 'mer': 'PM'});
      slotList.add({
        'start': '${DateTime(now.year, now.month, now.day, i, 0)}',
        'end': '${DateTime(now.year, now.month, now.day, i + 1, 0)}',
        'mer': 'PM'
      });
    }
  }
  return slotList;
}

double? intToDouble(int? num) {
  // integer to double
  if (num != null) {
    return num.toDouble();
  } else {
    return 0.0;
  }
}

int? intNullCheck(int? string) {
  if (string != null) {
    return string;
  } else {
    return 0;
  }
}

String? utcToTimeFormat(String utcStr) {
  final DateFormat formatter = DateFormat('hh:mm a');
  String formatted = formatter.format(DateTime.parse(utcStr).toLocal());
  return formatted;
}

DateTime? stringToDate(String? dateStr) {
  if (dateStr == null) {
    return null;
  }
  return DateTime.tryParse(dateStr)?.toLocal() ?? null;
}

String? utcToDateFormat(String utcStr) {
  final DateFormat formatter = DateFormat('yMMMd');
  String formatted = formatter.format(DateTime.parse(utcStr).toLocal());
  return formatted;
}

String? trimString(String? str) {
  // trim a string
  return str?.trim();
}

bool timeComparisonFunc(String timeStr) {
  // compare present time with a particular time string
  // Parse the time string into a DateTime object
  DateTime time = DateFormat('yyyy-MM-dd HH:mm:ss').parse(timeStr);

  // Get the current time
  DateTime now = DateTime.now();

  // Compare the two times
  return now.isAfter(time);
}

String? stringNullCheckCopyCopy(String? string) {
  if (string != null && string.isNotEmpty && string != "null") {
    return string;
  } else {
    return "N/A";
  }
}

DateTime getCurrentDate() {
  DateTime now = new DateTime.now();
  DateTime date = new DateTime(now.year, now.month, now.day);
  // get current datetime
  return date;
}

int doubleToInt(String? value) {
  // double to integer
  if (value == null) {
    return 0;
  }

  double? doubleValue = double.tryParse(value);

  if (doubleValue != null) {
    return doubleValue.toInt();
  } else {
    return 0;
  }
}

DateTime editTime(DateTime timeStr) {
  // increase a time string by 1 hour
  return timeStr.add(Duration(hours: 1));
}

List<dynamic>? sortArray(
  List<dynamic>? arr,
  String keyname,
) {
  // sort  array of object in ascending order
  if (arr == null || arr.isEmpty) {
    return null;
  }

  arr.sort((a, b) {
    // Assuming the objects have a property named 'value' to compare
    if (a[keyname] is String && b[keyname] is String) {
      return a[keyname].compareTo(b[keyname]);
    } else if (a[keyname] is int && b[keyname] is int) {
      return a[keyname].compareTo(b[keyname]);
    } else if (a[keyname] is double && b[keyname] is double) {
      return a[keyname].compareTo(b[keyname]);
    } else {
      return 0;
    }
  });

  return arr;
}

double? doubleNullCheck(double? dbl) {
  // double value null check funtion
  if (dbl != null) {
    return dbl;
  } else {
    return 0.0;
  }
}

int? stringToInt(String? str) {
  // string to integer
  if (str == null) {
    return 0;
  }

  try {
    return double.parse(str).round();
  } catch (e) {
    return 0;
  }
}
