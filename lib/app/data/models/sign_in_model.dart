class SigninModel {
  String? accessToken;
  String? tokenType;
  String? error;
  int? expiresIn;

  SigninModel({this.accessToken, this.tokenType, this.expiresIn, this.error});

  SigninModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    error = json["error"];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;

    data['error'] = error;

    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    return data;
  }
}
