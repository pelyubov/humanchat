class Pagination<T> {
  late int pageIndex = 1;
  late int pageSize = 10;
  final Iterable<T> items;

  Pagination.fromItems({required this.items});

  setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }

  takePage(int pageIndex) {
    return items.skip((pageIndex - 1) * pageSize).take(pageSize);
  }

  getNumberOfPages() {
    return (items.length / pageSize).ceil();
  }
}
