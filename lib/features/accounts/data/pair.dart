import 'package:equatable/equatable.dart';

class Pair<T, V> extends Equatable{
  final T key;
  final V value;

  const Pair(this.key, this.value);

  @override
  List<Object?> get props => [key, value];
}