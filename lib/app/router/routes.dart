abstract final class AppRoutes {
  static const dashboard = '/';
  static const logs = '/logs';
  static const courses = '/courses';
  static const coursesNew = '/courses/new';
  static const settings = '/settings';
  static const settingsSync = '/settings/sync';

  static String courseEdit(String id) => '/courses/$id/edit';
  static String productDetail(String id) => '/products/$id';
  static const productNew = '/products/new';
  static const authLogin = '/auth/login';
  static const authRegister = '/auth/register';
  static const devLogs = '/dev/logs';
}
