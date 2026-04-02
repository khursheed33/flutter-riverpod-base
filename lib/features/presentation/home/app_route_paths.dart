/// Path segments for [GoRouter] (path URLs work on web).
abstract class AppRoutePaths {
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
  static const homeGallery = '/home/gallery';
  static const homeUsers = '/home/users';
  static const homeUsersNew = '/home/users/new';

  static String homeUser(String id) => '/home/users/$id';

  static String homeUserEdit(String id) => '/home/users/$id/edit';
}
