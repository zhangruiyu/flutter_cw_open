import 'constants.dart';

class HttpConstants {
  //  static final String BaseUrl = "http://192.168.1.76:8080/";
//  static final String BaseUrl = "https://api.mustbe.xyz/";
//  static final String BaseStaticUrl = "https://app.mustbe.xyz/";
//上线 为家里 测试为公司
  static final String BaseUrl = isOnline
      ? "https://www.keleyuanyuan.xyz/"
//          : "http://192.168.6.211:8080/";
//      : "http://123.207.154.134:8080/";
      : "http://192.168.1.7:8080/";

  static final String SendCode = "app/auth/sendLoginCode"; //发送验证码
  static final String SendThirdLoginCode =
      "app/auth/sendThirdLoginCode"; //发送验证码
  static final String LoginAndRegister = "app/auth/loginAndRegister";

  static final String UserProfile = "app/auth/user/profile"; //获取用户信息
  static final String UserUpdateProfile =
      "app/auth/common/user/updateProfile"; //修改用户信息
  static final String ImLogin = "app/auth/common/user/imLogin"; //极光im登录
  static final String SafeState = "app/auth/common/user/safeState"; //安全中心
  static final String BindQqOrWechat =
      "app/auth/common/user/bindQqOrWechat"; //解绑或者绑定微信qq

  //一键登录
  static final String Flashlogin = "app/auth/flashLogin";
  static final String PetType = "app/pet/type";
  static final String PetSubType = "app/pet/subType";
  static final String AddPet = "app/pet/common/addPet";
  static final String CommitDynamic = "app/dynamic/common/commitDynamic";

  //发表评论
  static final String CommitComment = "app/dynamic/common/commitComment";
  static final String DynamicLiked = "app/dynamic/common/dynamic/liked";
  static final String DynamicList = "app/dynamic/dynamic/list";
  static final String CommentList = "app/dynamic/comment/list";
  static final String ThirdLoginAndRegister = "app/auth/thirdLoginAndRegister";
  static final String HomeIndex = "app/main/home/index";
  static final String Update = "app/main/update";
  static final String AccountIndex = "app/main/common/account/index";
  static final String PeriodEffectiveSign =
      "app/cos/common/periodEffectiveSign";

  static String get AddTally => "app/tally/common/add/tally";

  static String get TallyTags => "app/tally/common/tags";

  static String get CurrentAllTally => "app/tally/common/currentAllTally";

  //签到
  static String get SignList => "app/sign/common/signList";

  static String get Sign => "app/sign/common/sign";

  //积分
  static String get IntegralList => "app/integral/common/integralList";

  //当前用户分享url
  static String get shareUrl => "app/integral/common/shareUrl";
  static String get shareAward => "app/integral/common/shareAward";

  static String get TotalIntegral => "app/integral/common/totalIntegral";

  //商城
  static String get AddAddress => "app/store/common/addAddress";

  static String get AddressList => "app/store/common/addressList";

  static String get StoreCommodityList =>
      "app/store/storeCommodityList"; //积分商城列表

  static String get BuyIntegralCommodity =>
      "app/store/common/buyIntegralCommodity"; //

  static String get IntegralOrderList =>
      "app/store/common/integralOrderList"; //兑换订单

  static String get CoreSearch => "app/core/search"; //淘宝客搜索
  static String get CoreProductDetailsPic =>
      "app/core/productDetailsPic"; //淘宝客详情
  static String get CoreProductConvert => "app/core/productConvert"; //淘宝客转链
  static String get RecipeList => "app/recipe/list"; //食谱
  static String get AdoptionAdd => "/app/adoption/common/add"; //添加领养
  static String get AdoptionList => "/app/adoption/list"; //领养列表
  static String get MyAdoptionList =>
      "/app/adoption/common/myAdoption"; //我的发布领养列表
  static String get UpdateAdoption =>
      "/app/adoption/common/updateAdoption"; //更改领养信息
  static String get PetList => "/app/pet/common/petList"; //当前用户宠物列表
  static String get Elema => "/app/coupon/common/elema"; //获取优惠券
  static String get PayPre => "/app/money/common/pay/wx/pre"; //充值支付pre
  static String get PayStatus => "/app/money/common/payStatus"; //查询充值状态
  static String get MoneyAllCommodity =>
      "/app/money/common/pay/allCommodity"; //充值的所有商品

  static String get movieCity => "/app/movie/movieCity"; //电影城市选择
  static String get detailmovie => "/app/movie/detailmovie"; //电影详情
  static String get movieParams => "/app/movie/movieParams"; //电影接口参数
  static String get movieItemPrice => "/app/movie/movieItemPrice"; //获取电影单价

  static String get MovieOrderInfo =>
      "/app/movie/common/movieOrderInfo"; //电影订单信息
  static String get payMovieOrder => "/app/movie/common/payMovieOrder"; //电影下单
  static String get inviteRecord => "app/auth/common/user/invite/record"; //邀请记录
}

class CosType {
  static const PIC_TYPE = 0;
  static const VIDEO_TYPE = 1;
  static const AVATAR_TYPE = 2;
  static const Pet_AVATAR_TYPE = 3;
  static const Tally_TYPE = 4;
  static const Adoption_TYPE = 5;
}
