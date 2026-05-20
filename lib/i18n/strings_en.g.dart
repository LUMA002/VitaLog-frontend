///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'VitaLog'
	String get appName => 'VitaLog';

	late final TranslationsNavEn nav = TranslationsNavEn._(_root);
	late final TranslationsDashboardEn dashboard = TranslationsDashboardEn._(_root);
	late final TranslationsLogsEn logs = TranslationsLogsEn._(_root);
	late final TranslationsCoursesEn courses = TranslationsCoursesEn._(_root);
	late final TranslationsProductsEn products = TranslationsProductsEn._(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
	late final TranslationsAuthEn auth = TranslationsAuthEn._(_root);
	late final TranslationsErrorsEn errors = TranslationsErrorsEn._(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
}

// Path: nav
class TranslationsNavEn {
	TranslationsNavEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'History'
	String get history => 'History';

	/// en: 'Courses'
	String get courses => 'Courses';

	/// en: 'Settings'
	String get settings => 'Settings';
}

// Path: dashboard
class TranslationsDashboardEn {
	TranslationsDashboardEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Today's Plan'
	String get title => 'Today\'s Plan';

	/// en: 'No courses scheduled for today.'
	String get empty => 'No courses scheduled for today.';

	/// en: 'Log intake'
	String get quickLog => 'Log intake';
}

// Path: logs
class TranslationsLogsEn {
	TranslationsLogsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'History'
	String get title => 'History';

	late final TranslationsLogsTabsEn tabs = TranslationsLogsTabsEn._(_root);

	/// en: 'No logs yet.'
	String get empty => 'No logs yet.';
}

// Path: courses
class TranslationsCoursesEn {
	TranslationsCoursesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Courses'
	String get title => 'Courses';

	/// en: 'New Course'
	String get create => 'New Course';

	/// en: 'Edit Course'
	String get edit => 'Edit Course';

	/// en: 'No active courses.'
	String get empty => 'No active courses.';

	late final TranslationsCoursesFieldsEn fields = TranslationsCoursesFieldsEn._(_root);
}

// Path: products
class TranslationsProductsEn {
	TranslationsProductsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Products'
	String get title => 'Products';

	/// en: 'New Product'
	String get kNew => 'New Product';

	/// en: 'Global'
	String get global => 'Global';

	/// en: 'Custom'
	String get custom => 'Custom';
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	late final TranslationsSettingsAccountEn account = TranslationsSettingsAccountEn._(_root);
	late final TranslationsSettingsSyncEn sync = TranslationsSettingsSyncEn._(_root);
	late final TranslationsSettingsNotificationsEn notifications = TranslationsSettingsNotificationsEn._(_root);
	late final TranslationsSettingsDeveloperEn developer = TranslationsSettingsDeveloperEn._(_root);
	late final TranslationsSettingsDangerEn danger = TranslationsSettingsDangerEn._(_root);
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthLoginEn login = TranslationsAuthLoginEn._(_root);
	late final TranslationsAuthRegisterEn register = TranslationsAuthRegisterEn._(_root);
}

// Path: errors
class TranslationsErrorsEn {
	TranslationsErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Network error. Please check your connection.'
	String get network => 'Network error. Please check your connection.';

	late final TranslationsErrorsAuthEn auth = TranslationsErrorsAuthEn._(_root);

	/// en: 'Sync failed. Will retry automatically.'
	String get sync => 'Sync failed. Will retry automatically.';

	/// en: 'Something went wrong.'
	String get unknown => 'Something went wrong.';

	/// en: 'Please check your device time and try again.'
	String get deviceTime => 'Please check your device time and try again.';
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Retry'
	String get retry => 'Retry';
}

// Path: logs.tabs
class TranslationsLogsTabsEn {
	TranslationsLogsTabsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Intake'
	String get intake => 'Intake';

	/// en: 'Wellbeing'
	String get wellbeing => 'Wellbeing';
}

// Path: courses.fields
class TranslationsCoursesFieldsEn {
	TranslationsCoursesFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Product'
	String get product => 'Product';

	/// en: 'Serving size'
	String get servingSize => 'Serving size';

	/// en: 'Time of day'
	String get timeOfDay => 'Time of day';

	/// en: 'Start date'
	String get startDate => 'Start date';

	/// en: 'End date (optional)'
	String get endDate => 'End date (optional)';
}

// Path: settings.account
class TranslationsSettingsAccountEn {
	TranslationsSettingsAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Account'
	String get title => 'Account';

	/// en: 'Guest'
	String get guest => 'Guest';

	/// en: 'Sign in to enable cloud sync'
	String get signInCta => 'Sign in to enable cloud sync';

	/// en: 'Sign out'
	String get logout => 'Sign out';

	/// en: 'Keep local data'
	String get keepData => 'Keep local data';

	/// en: 'Erase synced data'
	String get eraseData => 'Erase synced data';
}

// Path: settings.sync
class TranslationsSettingsSyncEn {
	TranslationsSettingsSyncEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Synchronization'
	String get title => 'Synchronization';

	/// en: 'Last sync'
	String get lastSync => 'Last sync';

	/// en: 'Sync now'
	String get syncNow => 'Sync now';

	/// en: 'Wi-Fi only'
	String get wifiOnly => 'Wi-Fi only';

	/// en: 'Never'
	String get never => 'Never';
}

// Path: settings.notifications
class TranslationsSettingsNotificationsEn {
	TranslationsSettingsNotificationsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Notifications'
	String get title => 'Notifications';

	/// en: 'Rebuild schedule'
	String get rebuild => 'Rebuild schedule';
}

// Path: settings.developer
class TranslationsSettingsDeveloperEn {
	TranslationsSettingsDeveloperEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Developer'
	String get title => 'Developer';

	/// en: 'View logs'
	String get viewLogs => 'View logs';
}

// Path: settings.danger
class TranslationsSettingsDangerEn {
	TranslationsSettingsDangerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Danger Zone'
	String get title => 'Danger Zone';

	/// en: 'Erase local database'
	String get eraseDb => 'Erase local database';
}

// Path: auth.login
class TranslationsAuthLoginEn {
	TranslationsAuthLoginEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Sign In'
	String get title => 'Sign In';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Sign In'
	String get submit => 'Sign In';

	/// en: 'Don't have an account? Register'
	String get noAccount => 'Don\'t have an account? Register';
}

// Path: auth.register
class TranslationsAuthRegisterEn {
	TranslationsAuthRegisterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Create Account'
	String get title => 'Create Account';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Create Account'
	String get submit => 'Create Account';

	/// en: 'Already have an account? Sign In'
	String get hasAccount => 'Already have an account? Sign In';
}

// Path: errors.auth
class TranslationsErrorsAuthEn {
	TranslationsErrorsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Session expired. Please sign in again.'
	String get expired => 'Session expired. Please sign in again.';

	/// en: 'Unauthorized.'
	String get unauthorized => 'Unauthorized.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appName' => 'VitaLog',
			'nav.today' => 'Today',
			'nav.history' => 'History',
			'nav.courses' => 'Courses',
			'nav.settings' => 'Settings',
			'dashboard.title' => 'Today\'s Plan',
			'dashboard.empty' => 'No courses scheduled for today.',
			'dashboard.quickLog' => 'Log intake',
			'logs.title' => 'History',
			'logs.tabs.intake' => 'Intake',
			'logs.tabs.wellbeing' => 'Wellbeing',
			'logs.empty' => 'No logs yet.',
			'courses.title' => 'Courses',
			'courses.create' => 'New Course',
			'courses.edit' => 'Edit Course',
			'courses.empty' => 'No active courses.',
			'courses.fields.product' => 'Product',
			'courses.fields.servingSize' => 'Serving size',
			'courses.fields.timeOfDay' => 'Time of day',
			'courses.fields.startDate' => 'Start date',
			'courses.fields.endDate' => 'End date (optional)',
			'products.title' => 'Products',
			'products.kNew' => 'New Product',
			'products.global' => 'Global',
			'products.custom' => 'Custom',
			'settings.title' => 'Settings',
			'settings.account.title' => 'Account',
			'settings.account.guest' => 'Guest',
			'settings.account.signInCta' => 'Sign in to enable cloud sync',
			'settings.account.logout' => 'Sign out',
			'settings.account.keepData' => 'Keep local data',
			'settings.account.eraseData' => 'Erase synced data',
			'settings.sync.title' => 'Synchronization',
			'settings.sync.lastSync' => 'Last sync',
			'settings.sync.syncNow' => 'Sync now',
			'settings.sync.wifiOnly' => 'Wi-Fi only',
			'settings.sync.never' => 'Never',
			'settings.notifications.title' => 'Notifications',
			'settings.notifications.rebuild' => 'Rebuild schedule',
			'settings.developer.title' => 'Developer',
			'settings.developer.viewLogs' => 'View logs',
			'settings.danger.title' => 'Danger Zone',
			'settings.danger.eraseDb' => 'Erase local database',
			'auth.login.title' => 'Sign In',
			'auth.login.email' => 'Email',
			'auth.login.password' => 'Password',
			'auth.login.submit' => 'Sign In',
			'auth.login.noAccount' => 'Don\'t have an account? Register',
			'auth.register.title' => 'Create Account',
			'auth.register.email' => 'Email',
			'auth.register.password' => 'Password',
			'auth.register.submit' => 'Create Account',
			'auth.register.hasAccount' => 'Already have an account? Sign In',
			'errors.network' => 'Network error. Please check your connection.',
			'errors.auth.expired' => 'Session expired. Please sign in again.',
			'errors.auth.unauthorized' => 'Unauthorized.',
			'errors.sync' => 'Sync failed. Will retry automatically.',
			'errors.unknown' => 'Something went wrong.',
			'errors.deviceTime' => 'Please check your device time and try again.',
			'common.cancel' => 'Cancel',
			'common.save' => 'Save',
			'common.delete' => 'Delete',
			'common.confirm' => 'Confirm',
			'common.loading' => 'Loading...',
			'common.retry' => 'Retry',
			_ => null,
		};
	}
}
