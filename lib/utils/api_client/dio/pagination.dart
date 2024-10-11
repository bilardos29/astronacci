class Pagination {
  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json['page'] ?? 1,
        perPage: json['perPage'] ?? 10,
        pages: json['pages'],
        dataCount: json['dataCount'],
      );
  Pagination({
    this.page = 1,
    this.perPage = 10,
    this.sort,
    this.pages,
    this.dataCount,
  });
  final int page;
  final int perPage;
  final SortType? sort;
  final int? pages;
  final int? dataCount;

  Map<String, dynamic> toJson({
    String sortPrefix = 'tanggalAwal',
  }) =>
      {
        'page': page,
        'perPage': perPage,
        if (sort != null) 'sort': sort?.stringify(prefix: sortPrefix),
      };

  Pagination copyWith({
    int? page,
    int? perPage,
    SortType? sort,
    int? pages,
    int? dataCount,
  }) {
    return Pagination(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      sort: sort ?? this.sort,
      pages: pages ?? this.pages,
      dataCount: dataCount ?? this.dataCount,
    );
  }
}

enum SortType {
  asc,
  desc;

  String stringify({required String prefix}) {
    switch (this) {
      case asc:
        return '$prefix-asc';
      case desc:
        return '$prefix-desc';
    }
  }
}
