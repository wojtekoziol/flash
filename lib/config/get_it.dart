import 'package:flash/data/repository/gdrive_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton(GDriveRepo.new);
}
