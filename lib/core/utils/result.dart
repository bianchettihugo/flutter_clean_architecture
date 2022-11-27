import 'failure.dart';

class Result<T> {
  final T? _data;
  final Failure? _failure;

  Result.success(this._data) : _failure = null;

  Result.failure(this._failure) : _data = null;

  bool get isSuccess => _data != null;

  T? get data => _data;

  Failure? get error => _failure;

  void when({
    required Function(T) success,
    required Function(Failure) failure,
  }) {
    if (_data != null) {
      success(_data as T);
    } else {
      failure(_failure ?? Failure(''));
    }
  }

  @override
  bool operator ==(covariant Result<T> other) {
    if (identical(this, other)) return true;

    return other._data == _data && other._failure == _failure;
  }

  @override
  int get hashCode => _data.hashCode ^ _failure.hashCode;
}
