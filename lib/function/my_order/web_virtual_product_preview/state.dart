import 'package:chongmeng/function/my_order/virtual_product_review/model/virtual_pruduct.dart';
import 'package:fish_redux/fish_redux.dart';

class WebVirtualProductPreviewState
    implements Cloneable<WebVirtualProductPreviewState> {
  List<VirtualProduct> data;

  @override
  WebVirtualProductPreviewState clone() {
    return WebVirtualProductPreviewState()..data = data;
  }
}

WebVirtualProductPreviewState initState(Map<String, dynamic> args) {
  return WebVirtualProductPreviewState()..data = args['data'];
}
