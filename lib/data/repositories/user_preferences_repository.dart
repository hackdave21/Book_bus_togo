import 'package:riverpod/riverpod.dart';
import 'package:book_bus_togo/core/shared_preferences.dart';

class UserPreferencesRepository {
  Future<void> saveProfileImage(String path) async {
    await SharedPreferencesHelper.saveString('profile_image', path);
  }

  Future<String?> getProfileImage() async {
    return SharedPreferencesHelper.getString('profile_image');
  }
}

// Define a provider for the repository
final userPreferencesRepositoryProvider = Provider<UserPreferencesRepository>((ref) {
  return UserPreferencesRepository();
});
