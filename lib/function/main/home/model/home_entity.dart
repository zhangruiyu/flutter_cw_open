import 'ali_product_item.dart';

class HomeEntity {
  String msg;
  HomeData data;
  int status;

  HomeEntity({this.msg, this.data, this.status});

  HomeEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new HomeData.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class HomeData {
  List<HomeDataTab> tab;
  List<AliProductItem> recommendProduct;
  List<AliProductItem> banner;
  List<String> sysNotices;
  List<HomeDataRecipe> recipe;

  bool isHiddenMovie;
  HomeData({this.tab, this.recommendProduct, this.banner, this.sysNotices});

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['tab'] != null) {
      tab = new List<HomeDataTab>();
      (json['tab'] as List).forEach((v) {
        tab.add(new HomeDataTab.fromJson(v));
      });
    }
    if (json['recommendProduct'] != null) {
      recommendProduct = new List<AliProductItem>();
      (json['recommendProduct'] as List).forEach((v) {
        recommendProduct.add(new AliProductItem.fromJson(v));
      });
    }
    if (json['banner'] != null) {
      banner = new List<AliProductItem>();
      (json['banner'] as List).forEach((v) {
        banner.add(new AliProductItem.fromJson(v));
      });
    }
    if (json['recipe'] != null) {
      recipe = new List<HomeDataRecipe>();
      (json['recipe'] as List).forEach((v) {
        recipe.add(new HomeDataRecipe.fromJson(v));
      });
    }
    sysNotices = json['sysNotices']?.cast<String>();
    isHiddenMovie = json['isHiddenMovie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tab != null) {
      data['tab'] = this.tab.map((v) => v.toJson()).toList();
    }
    if (this.recommendProduct != null) {
      data['recommendProduct'] =
          this.recommendProduct.map((v) => v.toJson()).toList();
    }
    if (this.banner != null) {
      data['banner'] = this.banner.map((v) => v.toJson()).toList();
    }
    if (this.recipe != null) {
      data['recipe'] = this.recipe.map((v) => v.toJson()).toList();
    }
    data['sysNotices'] = this.sysNotices;
    data['isHiddenMovie'] = this.isHiddenMovie;
    return data;
  }
}

class HomeDataTab {
  bool isH5;
  String imageUrl;
  String title;
  String action;
  dynamic skipUrl;
  List<List<String>> chips;

  HomeDataTab({this.isH5, this.imageUrl, this.title, this.skipUrl});

  HomeDataTab.fromJson(Map<String, dynamic> json) {
    isH5 = json['isH5'];
    imageUrl = json['imageUrl'];
    title = json['title'];
    skipUrl = json['skipUrl'];
    action = json['action'];
    if (json['chips'] != null) {
      chips = new List<List<String>>();
      (json['chips'] as List).forEach((v) {
        chips.add(new List.from(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isH5'] = this.isH5;
    data['imageUrl'] = this.imageUrl;
    data['title'] = this.title;
    data['skipUrl'] = this.skipUrl;
    data['action'] = this.action;
    if (this.chips != null) {
      data['chips'] = this.chips.map((v) => List.from(v)).toList();
    }
    return data;
  }
}

class HomeDataRecipe {
  String createTime;
  String name;
  int id;

  HomeDataRecipe({this.createTime, this.name, this.id});

  HomeDataRecipe.fromJson(Map<String, dynamic> json) {
    createTime = json['create_time'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['create_time'] = this.createTime;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
