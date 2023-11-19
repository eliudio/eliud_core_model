// to keep the generated code simple, these repository methods allow to specify the appID, although they're ignored
import '../access/repo/user_repository.dart';
import '../model/app_repository.dart';
import '../model/member_repository.dart';

AppRepository? appRepository({String? appId}) =>
    AbstractMainRepositorySingleton.singleton.appRepository();
MemberRepository? memberRepository({String? appId}) =>
    AbstractMainRepositorySingleton.singleton.memberRepository();
UserRepository? userRepository({String? appId}) =>
    AbstractMainRepositorySingleton.singleton.userRepository();

abstract class AbstractMainRepositorySingleton {
  static late AbstractMainRepositorySingleton singleton;

  AppRepository? appRepository();
  MemberRepository? memberRepository();
  UserRepository? userRepository();

  void flush(String appId) {}
}
