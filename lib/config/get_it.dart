import 'package:flash/data/repository/gdrive_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton(GDriveRepo.new);
  getIt.registerLazySingleton(ImagePicker.new);
}
