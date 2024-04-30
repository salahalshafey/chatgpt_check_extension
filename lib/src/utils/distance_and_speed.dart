import '../../l10n/l10n.dart';

String wellFormatedDistance(double distanceInMeter) {
  if (distanceInMeter >= 1000) {
    return '${(distanceInMeter / 1000).toStringAsFixed(1)} ${Strings.get.km}';
  }

  return '${distanceInMeter.toStringAsFixed(0)} ${Strings.get.meter}';
}

String fromMeterPerSecToKPerH(double speed) {
  return (speed * 3.6).toStringAsFixed(0);
}

String fromKilometerPerHourToMPerSec(double speed) {
  return (speed * (5 / 18)).toStringAsFixed(0);
}
