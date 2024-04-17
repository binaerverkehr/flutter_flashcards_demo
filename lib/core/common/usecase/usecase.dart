abstract class FutureUsecaseWithoutParams<T> {
  const FutureUsecaseWithoutParams();

  Future<T> call();
}

abstract class FutureUsecaseWithParams<T, Params> {
  const FutureUsecaseWithParams();

  Future<T> call(Params params);
}

abstract class StreamUsecaseWithParams<T, Params> {
  const StreamUsecaseWithParams();

  Stream<T> call(Params params);
}

abstract class StreamUsecaseWithoutParams<T> {
  const StreamUsecaseWithoutParams();

  Stream<T> call();
}
