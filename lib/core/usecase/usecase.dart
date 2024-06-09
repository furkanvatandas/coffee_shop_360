abstract interface class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();
  Future<Type> call(Params params);
}

abstract interface class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();
  Future<Type> call();
}
