class ResponseMessage {
  String? status;
  String? message;
  dynamic data;

  ResponseMessage({
    this.status,
    this.message,
    this.data,
  });

  factory ResponseMessage.fromJson(Map<String, dynamic> json) =>
      ResponseMessage(
        status: json['status'] as String?,
        message: json['message'] as String?,
        data: json['data'],
      );
}
