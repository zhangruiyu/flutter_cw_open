import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:oktoast/oktoast.dart';
import '../component.dart';
import 'action.dart';
import 'state.dart';

Effect<CommitTextState> buildEffect() {
  return combineEffects(<Object, Effect<CommitTextState>>{
    CommitTextAction.UploadCommit: _onUploadCommit,
  });
}

Future _onUploadCommit(Action action, Context<CommitTextState> ctx) async {
  //图片上传完毕 开始把信息给服务端
  var result = await RequestClient.request<OutermostEntity>(
      ctx.context, HttpConstants.CommitDynamic,
      queryParameters: {
        'type': CommunityComponent.DynamicTypeText,
        'dynamicContent': ctx.state.contentTextEditingController.text,
      },
      showLoadingIndicator: true);
  if (result.hasSuccess) {
    showToast("动态发布成功");
    NavigatorHelper.popToMain(ctx.context);
  }
}
