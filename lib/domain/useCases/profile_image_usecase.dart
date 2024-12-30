import 'package:book_bus_togo/data/repositories/user_preferences_repository.dart';
import 'package:riverpod/riverpod.dart';

class GetProfileImageUseCase {
  final UserPreferencesRepository repository;

  GetProfileImageUseCase(this.repository);

  Future<String?> execute() {
    return repository.getProfileImage();
  }
}

class SaveProfileImageUseCase {
  final UserPreferencesRepository repository;

  SaveProfileImageUseCase(this.repository);

  Future<void> execute(String path) {
    return repository.saveProfileImage(path);
  }
}

// Create providers for the use cases
final getProfileImageUseCaseProvider = Provider<GetProfileImageUseCase>((ref) {
  final repository = ref.read(userPreferencesRepositoryProvider);
  return GetProfileImageUseCase(repository);
});

final saveProfileImageUseCaseProvider = Provider<SaveProfileImageUseCase>((ref) {
  final repository = ref.read(userPreferencesRepositoryProvider);
  return SaveProfileImageUseCase(repository);
});
