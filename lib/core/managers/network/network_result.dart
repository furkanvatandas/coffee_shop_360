sealed class NetworkResult<S, F> {}

class NetworkResultSuccess<S, F> extends NetworkResult<S, F> {
  final S data;

  NetworkResultSuccess(this.data);
}

class NetworkResultFailure<S, F> extends NetworkResult<S, F> {
  final F failure;

  NetworkResultFailure(this.failure);
}

class NetworkResultException<S, F> extends NetworkResult<S, F> {
  final String exception;

  NetworkResultException(this.exception);
}
