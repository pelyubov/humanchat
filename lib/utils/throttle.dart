class Throttle {
  Throttle({this.throttleGapMills});
  final int? throttleGapMills;
  int? lastActionTime;

  dynamic execute(dynamic Function() action) {
    if (lastActionTime == null) {
      action();
      lastActionTime = DateTime.now().microsecondsSinceEpoch;
    } else {
      if (DateTime.now().microsecondsSinceEpoch - lastActionTime! > (throttleGapMills ?? 500)) {
        action();
        lastActionTime = DateTime.now().microsecondsSinceEpoch;
      }
    }
  }
}
