import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main.dart';

final context = navigatorKey.currentContext!;

/// ### used to handel the Singular and plural problems in diffrent languages
/// * `second` and `seconds` for **en**.
/// * `ثانية` , `ثانيتين` , `ثواني` for **ar**.

String secondWithLocalization(int seconds) {
  if (seconds < 0) {
    throw ErrorHint("seconds can't be negative!!!");
  }

  if (seconds == 0 || seconds == 1) {
    return "$seconds ${AppLocalizations.of(context)!.second}";
  }

  if (seconds == 2) {
    return AppLocalizations.of(context)!.twoSeconds;
  }

  if (seconds >= 3 && seconds <= 10) {
    return AppLocalizations.of(context)!.secondsBeteenThreeAndTen(seconds);
  }

  return AppLocalizations.of(context)!.secondsMoreThanTen(seconds);
}

/// ### used to handel the Singular and plural problems in diffrent languages
/// * `minute` and `minutes` for **en**.
/// * `دقيقة` , `دقيقتين` , `دقائق` for **ar**.

String minuteWithLocalization(int minutes) {
  if (minutes < 0) {
    throw ErrorHint("minutes can't be negative!!!");
  }

  if (minutes == 0 || minutes == 1) {
    return "$minutes ${AppLocalizations.of(context)!.minute}";
  }

  if (minutes == 2) {
    return AppLocalizations.of(context)!.twoMinutes;
  }

  if (minutes >= 3 && minutes <= 10) {
    return AppLocalizations.of(context)!.minutesBeteenThreeAndTen(minutes);
  }

  return AppLocalizations.of(context)!.minutesMoreThanTen(minutes);
}

/// ### used to handel the Singular and plural problems in diffrent languages
/// * `hour` and `hours` for **en**.
/// * `ساعة` , `ساعتين` , `ساعات` for **ar**.

String hourWithLocalization(int hours) {
  if (hours < 0) {
    throw ErrorHint("hours can't be negative!!!");
  }

  if (hours == 0 || hours == 1) {
    return "$hours ${AppLocalizations.of(context)!.hour}";
  }

  if (hours == 2) {
    return AppLocalizations.of(context)!.twoHours;
  }

  if (hours >= 3 && hours <= 10) {
    return AppLocalizations.of(context)!.hoursBeteenThreeAndTen(hours);
  }

  return AppLocalizations.of(context)!.hoursMoreThanTen(hours);
}

/// ### used to handel the Singular and plural problems in diffrent languages
/// * `day` and `days` for **en**.
/// * `يوم` , `يومين` , `أيام` for **ar**.

String dayWithLocalization(int days) {
  if (days < 0) {
    throw ErrorHint("days can't be negative!!!");
  }

  if (days == 0 || days == 1) {
    return "$days ${AppLocalizations.of(context)!.day}";
  }

  if (days == 2) {
    return AppLocalizations.of(context)!.twoDays;
  }

  if (days >= 3 && days <= 10) {
    return AppLocalizations.of(context)!.daysBeteenThreeAndTen(days);
  }

  return AppLocalizations.of(context)!.daysMoreThanTen(days);
}

/// ### used to handel the Singular and plural problems in diffrent languages
/// * `week` and `weeks` for **en**.
/// * `إسبوع` , `إسبوعين` , `أسابيع` for **ar**.

String weekWithLocalization(int weeks) {
  if (weeks < 0) {
    throw ErrorHint("weeks can't be negative!!!");
  }

  if (weeks == 0 || weeks == 1) {
    return "$weeks ${AppLocalizations.of(context)!.week}";
  }

  if (weeks == 2) {
    return AppLocalizations.of(context)!.twoWeeks;
  }

  if (weeks >= 3 && weeks <= 10) {
    return AppLocalizations.of(context)!.weeksBeteenThreeAndTen(weeks);
  }

  return AppLocalizations.of(context)!.weeksMoreThanTen(weeks);
}

/// ### used to handel the Singular and plural problems in diffrent languages
/// * `month` and `months` for **en**.
/// * `شهر` , `شهرين` , `أشهر` for **ar**.

String monthWithLocalization(int months) {
  if (months < 0) {
    throw ErrorHint("months can't be negative!!!");
  }

  if (months == 0 || months == 1) {
    return "$months ${AppLocalizations.of(context)!.month}";
  }

  if (months == 2) {
    return AppLocalizations.of(context)!.twoMonths;
  }

  if (months >= 3 && months <= 10) {
    return AppLocalizations.of(context)!.monthsBeteenThreeAndTen(months);
  }

  return AppLocalizations.of(context)!.monthsMoreThanTen(months);
}

/// ### used to handel the Singular and plural problems in diffrent languages
/// * `year` and `years` for **en**.
/// * `سنة` , `سنتين` , `سنوات` for **ar**.

String yearWithLocalization(int years) {
  if (years < 0) {
    throw ErrorHint("years can't be negative!!!");
  }

  if (years == 0 || years == 1) {
    return "$years ${AppLocalizations.of(context)!.year}";
  }

  if (years == 2) {
    return AppLocalizations.of(context)!.twoYears;
  }

  if (years >= 3 && years <= 10) {
    return AppLocalizations.of(context)!.yearsBeteenThreeAndTen(years);
  }

  return AppLocalizations.of(context)!.yearsMoreThanTen(years);
}

/// ### used to handel the Singular and plural problems in diffrent languages
/// * `decade` and `decades` for **en**.
/// * `عقد` , `عقدين` , `عقود` for **ar**.

String decadeWithLocalization(int decades) {
  if (decades < 0) {
    throw ErrorHint("decades can't be negative!!!");
  }

  if (decades == 0 || decades == 1) {
    return "$decades ${AppLocalizations.of(context)!.decade}";
  }

  if (decades == 2) {
    return AppLocalizations.of(context)!.twoDecades;
  }

  if (decades >= 3 && decades <= 10) {
    return AppLocalizations.of(context)!.decadesBeteenThreeAndTen(decades);
  }

  return AppLocalizations.of(context)!.decadesMoreThanTen(decades);
}
