class ResponseWrapper {
  bool success;
  dynamic response;
  int? code;

  ResponseWrapper({required this.success, this.response, this.code});

}