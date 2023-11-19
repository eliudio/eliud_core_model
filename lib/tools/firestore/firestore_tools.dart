import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../query/query_tools.dart';

dynamic getFirestoreField(dynamic conditionField) {
  if (conditionField is DocumentIdField) {
    return FieldPath.documentId;
  } else {
    return conditionField;
  }
}

typedef GetCollection = CollectionReference Function();

// process:
// If member has privilegeLevel >= 1, then
//     query the pages and dialogs. Pass in privilegeLevel = 3, 2 and 1 and then merge results from query with privilegeLevel = 3, privilegeLevel = 2 and privilegeLevel = 1
//     (if privilegeLevel = 2, then do this for 2 and 1, if privilegeLevel = 1, then do this for 1)
//
//     query the pages with privilegeLevel = 0
//
// If not logged in, or if privilegeLevel <= 0, theh query the pages with privilegeLevel = 0
Query? getQuery(collection,
    {String? orderBy,
    bool? descending,
    DocumentSnapshot? startAfter,
    int? limit,
    int? privilegeLevel,
    String? appId,
    EliudQuery? eliudQuery}) {
  var useThisCollection = collection;
  // Are we ordering?
  if (orderBy != null) {
    useThisCollection =
        useThisCollection.orderBy(orderBy, descending: descending);
  }

  if (privilegeLevel != null) {
    // Do we have some limits in terms of privilege?
    useThisCollection = useThisCollection
        .where('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel)
        .where('appId', isEqualTo: appId);
  }

  if ((eliudQuery != null) &&
/*
      (eliudQuery.conditions != null) &&
*/
      (eliudQuery.conditions.isNotEmpty)) {
    for (var i = 0; i < eliudQuery.conditions.length; i++) {
      var condition = eliudQuery.conditions[i];
      if (condition.isLessThanOrEqualTo != null) {
        useThisCollection = useThisCollection.where(
            getFirestoreField(condition.field),
            isLessThanOrEqualTo: condition.isLessThanOrEqualTo);
      }
      if (condition.isLessThan != null) {
        useThisCollection = useThisCollection.where(
            getFirestoreField(condition.field),
            isLessThan: condition.isLessThan);
      }
      if (condition.isEqualTo != null) {
        useThisCollection = useThisCollection.where(
            getFirestoreField(condition.field),
            isEqualTo: condition.isEqualTo);
      }
      if (condition.isGreaterThanOrEqualTo != null) {
        useThisCollection = useThisCollection.where(
            getFirestoreField(condition.field),
            isGreaterThanOrEqualTo: condition.isGreaterThanOrEqualTo);
      }
      if (condition.isGreaterThan != null) {
        useThisCollection = useThisCollection.where(
            getFirestoreField(condition.field),
            isGreaterThan: condition.isGreaterThan);
      }
      if (condition.isNull != null) {
        useThisCollection = useThisCollection.where(
            getFirestoreField(condition.field),
            isNull: condition.isNull);
      }
      if (condition.arrayContains != null) {
        useThisCollection = useThisCollection.where(
            getFirestoreField(condition.field),
            arrayContains: condition.arrayContains);
      }
      if (condition.arrayContainsAny != null) {
        useThisCollection = useThisCollection.where(
            getFirestoreField(condition.field),
            arrayContainsAny: condition.arrayContainsAny);
      }
      if (condition.whereIn != null) {
        useThisCollection = useThisCollection.where(
            getFirestoreField(condition.field),
            whereIn: condition.whereIn);
      }
    }
  }

  // Are we paginating?
  if (startAfter != null) {
    useThisCollection = useThisCollection.startAfterDocument(startAfter);
  }
  if (limit != null) {
    useThisCollection = useThisCollection.limit(limit);
  }
  return useThisCollection;
}

DateTime? timeStampToDateTime(Timestamp timestamp) {
  return timestamp.toDate();
}

String eliudDateFormat = "dd MM yyyy HH:mm:ss";

String? firestoreTimeStampToString(dynamic timestamp) {
  if (timestamp is Timestamp) {
    return DateFormat(eliudDateFormat).format(timestamp.toDate());
  } else {
    return null;
  }
}

DateTime dateFromTimestampString(String dateTime) {
  if (dateTime.length > 10) {
    var year = int.parse(dateTime.substring(6, 10));
    var month = int.parse(dateTime.substring(3, 5));
    var day = int.parse(dateTime.substring(0, 2));
    return DateTime(year, month, day);
  } else {
    throw Exception('Can not parse $dateTime');
  }
}

DateTime dateTimeFromTimestampString(String dateTime) {
  if (dateTime.length >= 19) {
    var year = int.parse(dateTime.substring(6, 10));
    var month = int.parse(dateTime.substring(3, 5));
    var day = int.parse(dateTime.substring(0, 2));
    var hour = int.parse(dateTime.substring(11, 13));
    var min = int.parse(dateTime.substring(14, 16));
    var second = int.parse(dateTime.substring(17, 19));
    return DateTime(year, month, day, hour, min, second);
  } else {
    throw Exception('Can not parse $dateTime');
  }
}

bool isSameDate(
  DateTime? dateTime1,
  DateTime? dateTime2,
) {
  if (dateTime1 == dateTime2) return true;
  if ((dateTime1 == null) && (dateTime2 == null)) return true;
  if ((dateTime1 == null) || (dateTime2 == null)) return true;
  if (dateTime1.year != dateTime2.year) return false;
  if (dateTime1.month != dateTime2.month) return false;
  if (dateTime1.day != dateTime2.day) return false;
  return true;
}

String formatHHMM(DateTime dateTime) {
  return DateFormat('HH:mm').format(dateTime);
}

String dateFormatFullPrecision = "dd MM yyyy HH:mm:ss";

String formatFullPrecision(DateTime? dateTime) {
  if (dateTime == null) {
    return "?";
  } else {
    return DateFormat('dd MM yyyy HH:mm:ss').format(dateTime);
  }
}

String verboseDateTimeRepresentation(DateTime? dateTime) {
  if (dateTime == null) return 'Unkown date/time';
  var now = DateTime.now();
  var justNow = now.subtract(Duration(minutes: 1));
  var localDateTime = dateTime.toLocal();
  if (!localDateTime.difference(justNow).isNegative) {
    return 'Just now';
  }
  var roughTimeString = DateFormat('jm').format(dateTime);
  if (localDateTime.day == now.day &&
      localDateTime.month == now.month &&
      localDateTime.year == now.year) {
    return roughTimeString;
  }
  var yesterday = now.subtract(Duration(days: 1));
  if (localDateTime.day == yesterday.day &&
      localDateTime.month == now.month &&
      localDateTime.year == now.year) {
    return 'Yesterday, $roughTimeString';
  }
  if (now.difference(localDateTime).inDays < 7) {
    var weekday = DateFormat('EEEE').format(localDateTime);
    return '$weekday, $roughTimeString';
  }
  return '${DateFormat('yMd').format(dateTime)}, $roughTimeString';
}
