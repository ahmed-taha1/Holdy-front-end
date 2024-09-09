import 'package:event_bus/event_bus.dart';

class RefreshHomeEvent {}
class RefreshPlatformEvent {}
class RefreshAccountEvent {}
final EventBus eventBus = EventBus();