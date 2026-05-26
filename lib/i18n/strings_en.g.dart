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
	late final TranslationsWellbeingEn wellbeing = TranslationsWellbeingEn._(_root);
	late final TranslationsCoursesEn courses = TranslationsCoursesEn._(_root);
	late final TranslationsProductsEn products = TranslationsProductsEn._(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
	late final TranslationsAuthEn auth = TranslationsAuthEn._(_root);
	late final TranslationsValidationEn validation = TranslationsValidationEn._(_root);
	late final TranslationsErrorsEn errors = TranslationsErrorsEn._(_root);
	late final TranslationsNotificationsEn notifications = TranslationsNotificationsEn._(_root);
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

	/// en: 'Taken at {time}'
	String takenAt({required Object time}) => 'Taken at ${time}';
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

// Path: wellbeing
class TranslationsWellbeingEn {
	TranslationsWellbeingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add Entry'
	String get title => 'Add Entry';

	/// en: 'Mood'
	String get mood => 'Mood';

	/// en: 'Energy'
	String get energy => 'Energy';

	/// en: 'Sleep (hrs)'
	String get sleep => 'Sleep (hrs)';

	/// en: 'Notes'
	String get notes => 'Notes';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Wellbeing logged today ✓'
	String get success => 'Wellbeing logged today ✓';

	/// en: 'How are you feeling today? 📝'
	String get prompt => 'How are you feeling today? 📝';

	/// en: '{value} h'
	String sleepValue({required Object value}) => '${value} h';
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

	/// en: 'serving'
	String get serving => 'serving';

	/// en: 'servings'
	String get servings => 'servings';

	/// en: 'Delete this course? This cannot be undone.'
	String get deleteConfirmContent => 'Delete this course? This cannot be undone.';

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
	String get createTitle => 'New Product';

	/// en: 'Create'
	String get create => 'Create';

	/// en: 'Product Name'
	String get nameLabel => 'Product Name';

	/// en: 'Description (optional)'
	String get descriptionLabel => 'Description (optional)';

	/// en: 'Add Ingredient'
	String get addIngredient => 'Add Ingredient';

	/// en: 'Search ingredients...'
	String get ingredientSearchHint => 'Search ingredients...';

	/// en: 'Add {query} as custom ingredient'
	String addCustomIngredient({required Object query}) => 'Add ${query} as custom ingredient';

	/// en: 'Amount'
	String get amountLabel => 'Amount';

	/// en: 'Unit (e.g. mg, IU)'
	String get unitLabel => 'Unit (e.g. mg, IU)';

	/// en: 'Save Product'
	String get saveProduct => 'Save Product';

	/// en: 'No ingredients added yet.'
	String get noIngredients => 'No ingredients added yet.';

	/// en: 'Ingredients'
	String get ingredientsTitle => 'Ingredients';

	/// en: 'No specific ingredients listed.'
	String get noSpecificIngredients => 'No specific ingredients listed.';

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
	late final TranslationsSettingsLanguageEn language = TranslationsSettingsLanguageEn._(_root);
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
	late final TranslationsAuthValidationEn validation = TranslationsAuthValidationEn._(_root);
}

// Path: validation
class TranslationsValidationEn {
	TranslationsValidationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please select a product.'
	String get productRequired => 'Please select a product.';

	/// en: 'Must be greater than 0.'
	String get servingSizePositive => 'Must be greater than 0.';

	/// en: 'End date must be on or after the start date.'
	String get endDateOnOrAfterStart => 'End date must be on or after the start date.';

	/// en: 'Name is required.'
	String get nameRequired => 'Name is required.';
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

// Path: notifications
class TranslationsNotificationsEn {
	TranslationsNotificationsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'VitaLog'
	String get title => 'VitaLog';

	/// en: 'Time to take: {name}'
	String takeReminder({required Object name}) => 'Time to take: ${name}';
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

	/// en: 'How would you like to sign out?'
	String get logoutDialogContent => 'How would you like to sign out?';

	/// en: 'Keep local data'
	String get keepData => 'Keep local data';

	/// en: 'Sign out and erase data'
	String get eraseData => 'Sign out and erase data';

	/// en: 'Are you sure?'
	String get eraseDataConfirmTitle => 'Are you sure?';

	/// en: 'This will remove all local data from this device.'
	String get eraseDataConfirmContent => 'This will remove all local data from this device.';
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

// Path: settings.language
class TranslationsSettingsLanguageEn {
	TranslationsSettingsLanguageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Language'
	String get title => 'Language';

	/// en: 'English'
	String get en => 'English';

	/// en: 'Ukrainian'
	String get ua => 'Ukrainian';
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

	/// en: 'Clear local data'
	String get clearLocalData => 'Clear local data';

	/// en: 'This will permanently delete all local data. Synced data can be recovered by signing in again.'
	String get clearLocalDataConfirmContent => 'This will permanently delete all local data. Synced data can be recovered by signing in again.';
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

	/// en: 'Confirm password'
	String get confirmPassword => 'Confirm password';

	/// en: 'Create Account'
	String get submit => 'Create Account';

	/// en: 'Already have an account? Sign In'
	String get hasAccount => 'Already have an account? Sign In';
}

// Path: auth.validation
class TranslationsAuthValidationEn {
	TranslationsAuthValidationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Email is required'
	String get emailRequired => 'Email is required';

	/// en: 'Enter a valid email address'
	String get emailInvalid => 'Enter a valid email address';

	/// en: 'Email must be at most 255 characters'
	String get emailMaxLength => 'Email must be at most 255 characters';

	/// en: 'Password is required'
	String get passwordRequired => 'Password is required';

	/// en: 'Password must be at least 8 characters long.'
	String get passwordMinLength => 'Password must be at least 8 characters long.';

	/// en: 'Password must be at most 128 characters long.'
	String get passwordMaxLength => 'Password must be at most 128 characters long.';

	/// en: 'Password must contain at least one uppercase letter.'
	String get passwordUppercase => 'Password must contain at least one uppercase letter.';

	/// en: 'Password must contain at least one lowercase letter.'
	String get passwordLowercase => 'Password must contain at least one lowercase letter.';

	/// en: 'Password must contain at least one number.'
	String get passwordDigit => 'Password must contain at least one number.';

	/// en: 'Please confirm your password'
	String get confirmPasswordRequired => 'Please confirm your password';

	/// en: 'Passwords do not match'
	String get confirmPasswordMismatch => 'Passwords do not match';
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
			'dashboard.takenAt' => ({required Object time}) => 'Taken at ${time}',
			'logs.title' => 'History',
			'logs.tabs.intake' => 'Intake',
			'logs.tabs.wellbeing' => 'Wellbeing',
			'logs.empty' => 'No logs yet.',
			'wellbeing.title' => 'Add Entry',
			'wellbeing.mood' => 'Mood',
			'wellbeing.energy' => 'Energy',
			'wellbeing.sleep' => 'Sleep (hrs)',
			'wellbeing.notes' => 'Notes',
			'wellbeing.save' => 'Save',
			'wellbeing.success' => 'Wellbeing logged today ✓',
			'wellbeing.prompt' => 'How are you feeling today? 📝',
			'wellbeing.sleepValue' => ({required Object value}) => '${value} h',
			'courses.title' => 'Courses',
			'courses.create' => 'New Course',
			'courses.edit' => 'Edit Course',
			'courses.empty' => 'No active courses.',
			'courses.serving' => 'serving',
			'courses.servings' => 'servings',
			'courses.deleteConfirmContent' => 'Delete this course? This cannot be undone.',
			'courses.fields.product' => 'Product',
			'courses.fields.servingSize' => 'Serving size',
			'courses.fields.timeOfDay' => 'Time of day',
			'courses.fields.startDate' => 'Start date',
			'courses.fields.endDate' => 'End date (optional)',
			'products.title' => 'Products',
			'products.createTitle' => 'New Product',
			'products.create' => 'Create',
			'products.nameLabel' => 'Product Name',
			'products.descriptionLabel' => 'Description (optional)',
			'products.addIngredient' => 'Add Ingredient',
			'products.ingredientSearchHint' => 'Search ingredients...',
			'products.addCustomIngredient' => ({required Object query}) => 'Add ${query} as custom ingredient',
			'products.amountLabel' => 'Amount',
			'products.unitLabel' => 'Unit (e.g. mg, IU)',
			'products.saveProduct' => 'Save Product',
			'products.noIngredients' => 'No ingredients added yet.',
			'products.ingredientsTitle' => 'Ingredients',
			'products.noSpecificIngredients' => 'No specific ingredients listed.',
			'products.global' => 'Global',
			'products.custom' => 'Custom',
			'settings.title' => 'Settings',
			'settings.account.title' => 'Account',
			'settings.account.guest' => 'Guest',
			'settings.account.signInCta' => 'Sign in to enable cloud sync',
			'settings.account.logout' => 'Sign out',
			'settings.account.logoutDialogContent' => 'How would you like to sign out?',
			'settings.account.keepData' => 'Keep local data',
			'settings.account.eraseData' => 'Sign out and erase data',
			'settings.account.eraseDataConfirmTitle' => 'Are you sure?',
			'settings.account.eraseDataConfirmContent' => 'This will remove all local data from this device.',
			'settings.sync.title' => 'Synchronization',
			'settings.sync.lastSync' => 'Last sync',
			'settings.sync.syncNow' => 'Sync now',
			'settings.sync.wifiOnly' => 'Wi-Fi only',
			'settings.sync.never' => 'Never',
			'settings.language.title' => 'Language',
			'settings.language.en' => 'English',
			'settings.language.ua' => 'Ukrainian',
			'settings.notifications.title' => 'Notifications',
			'settings.notifications.rebuild' => 'Rebuild schedule',
			'settings.developer.title' => 'Developer',
			'settings.developer.viewLogs' => 'View logs',
			'settings.danger.title' => 'Danger Zone',
			'settings.danger.clearLocalData' => 'Clear local data',
			'settings.danger.clearLocalDataConfirmContent' => 'This will permanently delete all local data. Synced data can be recovered by signing in again.',
			'auth.login.title' => 'Sign In',
			'auth.login.email' => 'Email',
			'auth.login.password' => 'Password',
			'auth.login.submit' => 'Sign In',
			'auth.login.noAccount' => 'Don\'t have an account? Register',
			'auth.register.title' => 'Create Account',
			'auth.register.email' => 'Email',
			'auth.register.password' => 'Password',
			'auth.register.confirmPassword' => 'Confirm password',
			'auth.register.submit' => 'Create Account',
			'auth.register.hasAccount' => 'Already have an account? Sign In',
			'auth.validation.emailRequired' => 'Email is required',
			'auth.validation.emailInvalid' => 'Enter a valid email address',
			'auth.validation.emailMaxLength' => 'Email must be at most 255 characters',
			'auth.validation.passwordRequired' => 'Password is required',
			'auth.validation.passwordMinLength' => 'Password must be at least 8 characters long.',
			'auth.validation.passwordMaxLength' => 'Password must be at most 128 characters long.',
			'auth.validation.passwordUppercase' => 'Password must contain at least one uppercase letter.',
			'auth.validation.passwordLowercase' => 'Password must contain at least one lowercase letter.',
			'auth.validation.passwordDigit' => 'Password must contain at least one number.',
			'auth.validation.confirmPasswordRequired' => 'Please confirm your password',
			'auth.validation.confirmPasswordMismatch' => 'Passwords do not match',
			'validation.productRequired' => 'Please select a product.',
			'validation.servingSizePositive' => 'Must be greater than 0.',
			'validation.endDateOnOrAfterStart' => 'End date must be on or after the start date.',
			'validation.nameRequired' => 'Name is required.',
			'errors.network' => 'Network error. Please check your connection.',
			'errors.auth.expired' => 'Session expired. Please sign in again.',
			'errors.auth.unauthorized' => 'Unauthorized.',
			'errors.sync' => 'Sync failed. Will retry automatically.',
			'errors.unknown' => 'Something went wrong.',
			'errors.deviceTime' => 'Please check your device time and try again.',
			'notifications.title' => 'VitaLog',
			'notifications.takeReminder' => ({required Object name}) => 'Time to take: ${name}',
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
