import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:chongmeng/network/entity/share_url_entity.dart';
import 'package:chongmeng/network/entity/cos_entity.dart';
import 'package:chongmeng/network/entity/share_result_entity.dart';
import 'package:chongmeng/utils/model/jiguang_entity.dart';
import 'package:chongmeng/function/user_details/model/user_details_entity.dart';
import 'package:chongmeng/function/movie/movie_details/model/movie_details_entity.dart';
import 'package:chongmeng/function/movie/movie_details/model/movie_schedule_entity.dart';
import 'package:chongmeng/function/movie/movie_seat/model/movie_order_entity.dart';
import 'package:chongmeng/function/movie/movie_seat/model/seat_entity.dart';
import 'package:chongmeng/function/movie/movie_cinema/model/cinema_movies_entity.dart';
import 'package:chongmeng/function/movie/model/movie_params_entity.dart';
import 'package:chongmeng/function/movie/model/hot_movie_entity.dart';
import 'package:chongmeng/function/movie/movie_city/model/cinema_city_entity.dart';
import 'package:chongmeng/function/shipping_address/model/shipping_address_entity.dart';
import 'package:chongmeng/function/update/model/update_entity.dart';
import 'package:chongmeng/function/auto/model/login_entity.dart';
import 'package:chongmeng/function/recipe/model/recipe_entity.dart';
import 'package:chongmeng/function/safe_center/model/safe_entity.dart';
import 'package:chongmeng/function/my_order/model/my_order_entity.dart';
import 'package:chongmeng/function/adoption/my_adoption/model/my_adoption_entity.dart';
import 'package:chongmeng/function/search/model/search_result_entity.dart';
import 'package:chongmeng/function/tally/entity/current_user_tally_entity.dart';
import 'package:chongmeng/function/tally/entity/tally_tag_entity.dart';
import 'package:chongmeng/function/invite/model/invite_entity.dart';
import 'package:chongmeng/function/signin/model/sign_in_result_entity.dart';
import 'package:chongmeng/function/signin/model/sign_list_entity.dart';
import 'package:chongmeng/function/my_pet/selecttype/model/pet_type_entity.dart';
import 'package:chongmeng/function/my_pet/selectsubtype/model/pet_sub_type_entity.dart';
import 'package:chongmeng/function/my_pet/model/pet_entity.dart';
import 'package:chongmeng/function/product_details/model/share_product_entity.dart';
import 'package:chongmeng/function/product_details/model/details_entity.dart';
import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:chongmeng/function/main/adoption/model/adoption_entity.dart';
import 'package:chongmeng/function/main/account/model/account_entity.dart';
import 'package:chongmeng/function/main/community/details/model/comment_entity.dart';
import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:chongmeng/function/main/store/coupon_detail/model/coupon_entity.dart';
import 'package:chongmeng/function/main/store/model/integral_commodity_entity.dart';
import 'package:chongmeng/function/integral/recharge/model/recharge_commodity_entity.dart';
import 'package:chongmeng/function/integral/recharge/model/pay_result_entity.dart';
import 'package:chongmeng/function/integral/recharge/model/wx_pay_entity.dart';
import 'package:chongmeng/function/integral/model/total_integral_entity.dart';
import 'package:chongmeng/function/integral/model/integral_record_entity.dart';
import 'package:chongmeng/components/dynamic/dynamic_component/model/dynamic_liked_entity.dart';
import 'package:chongmeng/helper/model/auto_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "ShareUrlEntity") {
      return ShareUrlEntity.fromJson(json) as T;
    } else if (T.toString() == "CosEntity") {
      return CosEntity.fromJson(json) as T;
    } else if (T.toString() == "ShareResultEntity") {
      return ShareResultEntity.fromJson(json) as T;
    } else if (T.toString() == "JiguangEntity") {
      return JiguangEntity.fromJson(json) as T;
    } else if (T.toString() == "UserDetailsEntity") {
      return UserDetailsEntity.fromJson(json) as T;
    } else if (T.toString() == "MovieDetailsEntity") {
      return MovieDetailsEntity.fromJson(json) as T;
    } else if (T.toString() == "MovieScheduleEntity") {
      return MovieScheduleEntity.fromJson(json) as T;
    } else if (T.toString() == "MovieOrderEntity") {
      return MovieOrderEntity.fromJson(json) as T;
    } else if (T.toString() == "SeatEntity") {
      return SeatEntity.fromJson(json) as T;
    } else if (T.toString() == "CinemaMoviesEntity") {
      return CinemaMoviesEntity.fromJson(json) as T;
    } else if (T.toString() == "MovieParamsEntity") {
      return MovieParamsEntity.fromJson(json) as T;
    } else if (T.toString() == "HotMovieEntity") {
      return HotMovieEntity.fromJson(json) as T;
    } else if (T.toString() == "CinemaCityEntity") {
      return CinemaCityEntity.fromJson(json) as T;
    } else if (T.toString() == "ShippingAddressEntity") {
      return ShippingAddressEntity.fromJson(json) as T;
    } else if (T.toString() == "UpdateEntity") {
      return UpdateEntity.fromJson(json) as T;
    } else if (T.toString() == "LoginEntity") {
      return LoginEntity.fromJson(json) as T;
    } else if (T.toString() == "RecipeEntity") {
      return RecipeEntity.fromJson(json) as T;
    } else if (T.toString() == "SafeEntity") {
      return SafeEntity.fromJson(json) as T;
    } else if (T.toString() == "MyOrderEntity") {
      return MyOrderEntity.fromJson(json) as T;
    } else if (T.toString() == "MyAdoptionEntity") {
      return MyAdoptionEntity.fromJson(json) as T;
    } else if (T.toString() == "SearchResultEntity") {
      return SearchResultEntity.fromJson(json) as T;
    } else if (T.toString() == "CurrentUserTallyEntity") {
      return CurrentUserTallyEntity.fromJson(json) as T;
    } else if (T.toString() == "TallyTagEntity") {
      return TallyTagEntity.fromJson(json) as T;
    } else if (T.toString() == "InviteEntity") {
      return InviteEntity.fromJson(json) as T;
    } else if (T.toString() == "SignInResultEntity") {
      return SignInResultEntity.fromJson(json) as T;
    } else if (T.toString() == "SignListEntity") {
      return SignListEntity.fromJson(json) as T;
    } else if (T.toString() == "PetTypeEntity") {
      return PetTypeEntity.fromJson(json) as T;
    } else if (T.toString() == "PetSubTypeEntity") {
      return PetSubTypeEntity.fromJson(json) as T;
    } else if (T.toString() == "PetEntity") {
      return PetEntity.fromJson(json) as T;
    } else if (T.toString() == "ShareProductEntity") {
      return ShareProductEntity.fromJson(json) as T;
    } else if (T.toString() == "DetailsEntity") {
      return DetailsEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeEntity") {
      return HomeEntity.fromJson(json) as T;
    } else if (T.toString() == "AdoptionEntity") {
      return AdoptionEntity.fromJson(json) as T;
    } else if (T.toString() == "AccountEntity") {
      return AccountEntity.fromJson(json) as T;
    } else if (T.toString() == "CommentEntity") {
      return CommentEntity.fromJson(json) as T;
    } else if (T.toString() == "DynamicListEntity") {
      return DynamicListEntity.fromJson(json) as T;
    } else if (T.toString() == "CouponEntity") {
      return CouponEntity.fromJson(json) as T;
    } else if (T.toString() == "IntegralCommodityEntity") {
      return IntegralCommodityEntity.fromJson(json) as T;
    } else if (T.toString() == "RechargeCommodityEntity") {
      return RechargeCommodityEntity.fromJson(json) as T;
    } else if (T.toString() == "PayResultEntity") {
      return PayResultEntity.fromJson(json) as T;
    } else if (T.toString() == "WxPayEntity") {
      return WxPayEntity.fromJson(json) as T;
    } else if (T.toString() == "TotalIntegralEntity") {
      return TotalIntegralEntity.fromJson(json) as T;
    } else if (T.toString() == "IntegralRecordEntity") {
      return IntegralRecordEntity.fromJson(json) as T;
    } else if (T.toString() == "DynamicLikedEntity") {
      return DynamicLikedEntity.fromJson(json) as T;
    } else if (T.toString() == "AutoEntity") {
      return AutoEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
