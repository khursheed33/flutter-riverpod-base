import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod_base/index.dart';

abstract class ConnectivityRepository {
  Future<Either<Failure, bool>> isConnected();
}
