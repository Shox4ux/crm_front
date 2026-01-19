import 'package:crm_app/app/utils/conts/api_urls.dart';
import 'package:flutter/cupertino.dart';

extension FullUrl on String? {
  String fullUrl() {
    var r = ApiUrls.baseUrl + (this ?? "");
    debugPrint(r, wrapWidth: 2);
    return r;
  }
}
