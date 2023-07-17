import 'dart:convert';
import 'package:flutter/material.dart';

abstract class BaseModel {
  Map<String, dynamic> toMap();

  static bool boolConverter(dynamic value, {bool fallbackValue = false}) {
    if (value == null || value.toString().isEmpty) return fallbackValue;
    if (value.runtimeType == bool) return value;
    return value == 1;
  }

  static Duration durationConverter(
    dynamic value, {
    Duration fallbackValue = const Duration(),
  }) {
    if (value == null || value.toString().isEmpty) return fallbackValue;
    if (value.runtimeType == Duration) return value;
    List<String> time = value.toString().split(":");
    if (time.length == 1) {
      int seconds = int.parse(time[0]);
      return Duration(seconds: seconds);
    }
    if (time.length == 2) {
      int minutes = int.parse(time[0]);
      int seconds = int.parse(time[1]);
      return Duration(minutes: minutes, seconds: seconds);
    } else if (time.length == 3) {
      int hours = int.parse(time[0]);
      int minutes = int.parse(time[1]);
      int seconds = int.parse(time[2].split('.').first);
      return Duration(hours: hours, minutes: minutes, seconds: seconds);
    }
    return fallbackValue;
  }

  static DateTime dateConverter(
    dynamic value, {
    bool trim = false,
    DateTime? fallbackValue,
  }) {
    // if (value.runtimeType == DateTime) return (value as DateTime).toUtc();
    if (value != null &&
        value.runtimeType == String &&
        value.toString().isNotEmpty &&
        trim) {
      value = value.toString().split("+").first;
    }
    return value != null
        ? getUtcDate(value, keepCurrent: trim)
        : (fallbackValue ?? DateTime.now());
  }

  static Map<String, dynamic> mapConverter(
    dynamic value, {
    Map<String, dynamic> fallbackValue = const {},
  }) {
    if (value == null) return fallbackValue;
    if (value.runtimeType == String) {
      if (value.toString().contains("{")) {
        return json.decode(value);
      }

      return {value: value};
    }
    return Map.from(value);
  }

  static List stringToList(String value) {
    if (value.isEmpty) return List.empty();
    return value.split(";");
  }

  static double doubleConverter(dynamic input, {double fallbackValue = 0}) {
    if (input == null || input.toString().isEmpty) return fallbackValue;

    return double.parse(input.toString());
  }

  static int intConverter(dynamic input, {int fallbackValue = 0}) {
    if (input == null || input.toString().isEmpty) return fallbackValue;

    if (input.runtimeType == double) {
      return (input as double).toInt();
    }

    return int.tryParse(input.toString()) ?? 0;
  }

  static String stringConverter(dynamic input, {String fallbackValue = ""}) =>
      (input ?? fallbackValue).toString();

  static List listConverter(dynamic input, {List fallbackValue = const []}) {
    if (input == null) return fallbackValue;
    if (input is Map<String, dynamic>) return input.values.toList();
    return (input as List).isEmpty ? fallbackValue : input;
  }

  static TimeOfDay timeOfDayConverter(dynamic input) {
    List<String> parts = stringConverter(input).split(":");

    if (parts.length < 2) {
      return const TimeOfDay(hour: 00, minute: 00);
    }

    return TimeOfDay(
      hour: intConverter(parts[0]),
      minute: intConverter(parts[1]),
    );
  }
}

DateTime getUtcDate(dynamic input, {bool keepCurrent = false}) {
  if (input.runtimeType == String && input.toString().isNotEmpty) {
    input = DateTime.parse(input.toString());
  } else if (input.runtimeType == String && input.toString().isEmpty) {
    input = DateTime.now();
  } else if (input.runtimeType == int) {
    input = DateTime.fromMillisecondsSinceEpoch(input);
  }
  DateTime output = input ?? DateTime.now();
  return !keepCurrent ? output.toLocal() : output;
}
