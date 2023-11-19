import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/blocking_model.dart';
import 'package:eliud_core_model/tools/query/query_tools.dart';

class MaintainBlocked {
  static Future<void> registerMemberAsBlocked(
      String myMemberId, String otherMember) async {
    var documentID = "$myMemberId-blocks-$otherMember";
    var blockingModel = BlockingModel(
        documentID: documentID,
        memberBlocking: myMemberId,
        memberBeingBlocked: otherMember);
    await blockingRepository()!.add(blockingModel);
  }

  static Future<void> unRegisterMemberAsBlocked(
      String myMemberId, String otherMember) async {
    var documentID = "$myMemberId-blocks-$otherMember";
    var blockingModel = BlockingModel(
        documentID: documentID,
        memberBlocking: myMemberId,
        memberBeingBlocked: otherMember);
    await blockingRepository()!.delete(blockingModel);
  }

  static Future<List<String>> getBlockedMembers(String myMemberId) async {
    var query = EliudQuery(theConditions: [
      EliudQueryCondition('memberBlocking', isEqualTo: myMemberId)
    ]);
    var valuesList = await blockingRepository()!.valuesList(eliudQuery: query);
    return valuesList.map((e) => e!.memberBeingBlocked ?? '?').toList();
  }
}
