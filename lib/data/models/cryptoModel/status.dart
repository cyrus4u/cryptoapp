class Status {
  String? timestamp;
  String? errorCode;
  String? errorMessage;
  String? elapsed;
  int? creditCount;

  Status({this.timestamp, this.errorCode, this.errorMessage, this.elapsed, this.creditCount});

  Status.fromJson(Map<String, dynamic> json) {
    if(json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
    if(json["error_code"] is String) {
      errorCode = json["error_code"];
    }
    if(json["error_message"] is String) {
      errorMessage = json["error_message"];
    }
    if(json["elapsed"] is String) {
      elapsed = json["elapsed"];
    }
    if(json["credit_count"] is int) {
      creditCount = json["credit_count"];
    }
  }

  static List<Status> fromList(List<Map<String, dynamic>> list) {
    return list.map(Status.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["timestamp"] = timestamp;
    _data["error_code"] = errorCode;
    _data["error_message"] = errorMessage;
    _data["elapsed"] = elapsed;
    _data["credit_count"] = creditCount;
    return _data;
  }
}