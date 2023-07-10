class FinancialsModel {
  final int equation;
  final int followLength;
  final String name;
  final int result;

  FinancialsModel({
    required this.equation,
    required this.followLength,
    required this.name,
    required this.result,
  });

  factory FinancialsModel.fromJson(Map<String, dynamic> json) {
    final responseData = json['data'][0];
    final equation = responseData['equation'];
    final followLength = responseData['Teacher']['follow'].length;
    final name = responseData['Teacher']['name'];
    final result = responseData['result'];

    return FinancialsModel(
      equation: equation as int,
      followLength: followLength as int,
      name: name as String,
      result: result as int,
    );
  }
}
