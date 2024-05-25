class Debounce {
  Debounce({this.debounceTimeMills});
  final int? debounceTimeMills;
  bool isDebouch = false;
  void execute(void Function() action) {
    if (!isDebouch) {
      isDebouch = true;
      Future.delayed(Duration(milliseconds: debounceTimeMills ?? 500), () {
        action();
        isDebouch = false;
      });
    }
  }
}
