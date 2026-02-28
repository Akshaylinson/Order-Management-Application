import 'google_auth_service.dart';

final GoogleAuthService _googleAuthService = GoogleAuthService();

IconButton(
  icon: const Icon(Icons.logout),
  onPressed: () async {
    await _googleAuthService.signOut();
  },
)
