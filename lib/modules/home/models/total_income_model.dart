class TotalIncomeModel {
  final List<double> totalIncomes;

  TotalIncomeModel({
    required this.totalIncomes,
  });

  factory TotalIncomeModel.fromJson(Map<String, dynamic> json) {
    return TotalIncomeModel(
      totalIncomes: json['totalIncomes'],
    );
  }
}

class TotalOutcomeModel {
  final List<double> totalOutcomes;

  TotalOutcomeModel({
    required this.totalOutcomes,
  });

  factory TotalOutcomeModel.fromJson(Map<String, dynamic> json) {
    return TotalOutcomeModel(
      totalOutcomes: json['totalOutcomes'],
    );
  }
}

class TotalSavingModel {
  final List<double> totalSavings;

  TotalSavingModel({
    required this.totalSavings,
  });

  factory TotalSavingModel.fromJson(Map<String, dynamic> json) {
    return TotalSavingModel(
      totalSavings: json['totalSavings'],
    );
  }
}
