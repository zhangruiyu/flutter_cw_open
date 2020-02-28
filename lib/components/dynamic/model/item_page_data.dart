import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class ItemPageData {
  String name;
  String filtrateType;
  int pageIndex;
  EasyRefreshController easyRefreshController;
  List<DynamicListData> data;

  ItemPageData(
      {this.name,
      this.filtrateType,
      this.data,
      this.pageIndex,
      this.easyRefreshController});
}
