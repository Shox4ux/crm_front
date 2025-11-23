import 'package:crm_app/app/utils/conts/api_urls.dart';

extension FullUrl on String? {
  String fullUrl() => ApiUrls.baseUrl + (this ?? "");
}
