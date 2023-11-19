import 'package:eliud_core_model/model/app_cache.dart';
import 'package:eliud_core_model/model/app_firestore.dart';
import 'package:eliud_core_model/model/app_repository.dart';
import 'package:eliud_core_model/model/member_cache.dart';
import 'package:eliud_core_model/model/member_repository.dart';
import 'package:eliud_core_model/tools/main_abstract_repository_singleton.dart';

import '../access/repo/user_repository.dart';
import 'bespoke_model/member_firestore_bespoke.dart';

class MainRepositorySingleton extends AbstractMainRepositorySingleton {
  MainRepositorySingleton() {
    _appRepository = AppCache(AppFirestore());
    _memberRepository = MemberCache(MemberFirestore());
    _userRepository = UserRepository();
  }

  @override
  AppRepository? appRepository() => _appRepository;
  AppRepository? _appRepository;

  @override
  MemberRepository? memberRepository() => _memberRepository;
  MemberRepository? _memberRepository;

  @override
  UserRepository? userRepository() => _userRepository;
  UserRepository? _userRepository;
}
