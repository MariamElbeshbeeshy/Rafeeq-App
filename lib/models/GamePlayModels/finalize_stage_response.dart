class FinalizeStageResponse {
  final int? nextState; // 1 = Continue, 2 = Finished
  final bool? passed;
  final int? scorePercentage;

  FinalizeStageResponse({this.nextState, this.passed, this.scorePercentage});

  factory FinalizeStageResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return FinalizeStageResponse(
      nextState: data != null ? data['nextState'] : null,
      passed: data != null ? data['passed'] : null,
      scorePercentage: data != null ? data['scorePercentage'] : null,
    );
  }
}