import '../../kyaru.dart';

abstract class IModule {
  bool isEnabled();

  List<ModuleFunction> getModuleFunctions();
}
