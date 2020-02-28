class NetException implements Exception {
  final code;
  final message;
  final errorData;

  NetException({this.code, this.message, this.errorData});

  String toString() {
    if (message == null) return "Exception";
    return "$message errorData $errorData}";
  }
}
