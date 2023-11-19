import 'package:eliud_core_model/model/member_model.dart';
import 'package:eliud_core_model/tools/member_collection_info.dart';
import 'package:equatable/equatable.dart';

abstract class AccessState extends Equatable {
  const AccessState();

  @override
  List<Object?> get props => [];

  bool isLoggedIn();
  bool hasAccessToOtherApps();
  bool forceAcceptMembership(String appId);
  bool memberIsOwner(String appId);
  MemberModel? getMember();

  List<MemberCollectionInfo>? getMemberCollectionInfo();
}
