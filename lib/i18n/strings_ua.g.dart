///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsUa with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsUa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ua,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ua>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsUa _root = this; // ignore: unused_field

	@override 
	TranslationsUa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsUa(meta: meta ?? this.$meta);

	// Translations
	@override String get appName => 'VitaLog';
	@override late final TranslationsNavUa nav = TranslationsNavUa._(_root);
	@override late final TranslationsDashboardUa dashboard = TranslationsDashboardUa._(_root);
	@override late final TranslationsLogsUa logs = TranslationsLogsUa._(_root);
	@override late final TranslationsWellbeingUa wellbeing = TranslationsWellbeingUa._(_root);
	@override late final TranslationsCoursesUa courses = TranslationsCoursesUa._(_root);
	@override late final TranslationsProductsUa products = TranslationsProductsUa._(_root);
	@override late final TranslationsSettingsUa settings = TranslationsSettingsUa._(_root);
	@override late final TranslationsAuthUa auth = TranslationsAuthUa._(_root);
	@override late final TranslationsValidationUa validation = TranslationsValidationUa._(_root);
	@override late final TranslationsErrorsUa errors = TranslationsErrorsUa._(_root);
	@override late final TranslationsNotificationsUa notifications = TranslationsNotificationsUa._(_root);
	@override late final TranslationsCommonUa common = TranslationsCommonUa._(_root);
}

// Path: nav
class TranslationsNavUa implements TranslationsNavEn {
	TranslationsNavUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get today => 'Сьогодні';
	@override String get history => 'Історія';
	@override String get courses => 'Курси';
	@override String get settings => 'Опції';
}

// Path: dashboard
class TranslationsDashboardUa implements TranslationsDashboardEn {
	TranslationsDashboardUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get title => 'План на сьогодні';
	@override String get empty => 'На сьогодні курсів не заплановано.';
	@override String get quickLog => 'Відмітити прийом';
	@override String takenAt({required Object time}) => 'Прийнято о ${time}';
}

// Path: logs
class TranslationsLogsUa implements TranslationsLogsEn {
	TranslationsLogsUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Історія';
	@override late final TranslationsLogsTabsUa tabs = TranslationsLogsTabsUa._(_root);
	@override String get empty => 'Записів ще немає.';
}

// Path: wellbeing
class TranslationsWellbeingUa implements TranslationsWellbeingEn {
	TranslationsWellbeingUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Додати запис';
	@override String get mood => 'Настрій';
	@override String get energy => 'Енергія';
	@override String get sleep => 'Сон (год)';
	@override String get notes => 'Нотатки';
	@override String get save => 'Зберегти';
	@override String get success => 'Ви вже зафіксували самопочуття сьогодні. Дякуємо!';
	@override String get prompt => 'Як ви почуваєтесь сьогодні? 📝';
	@override String sleepValue({required Object value}) => '${value} год';
}

// Path: courses
class TranslationsCoursesUa implements TranslationsCoursesEn {
	TranslationsCoursesUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Курси';
	@override String get create => 'Новий курс';
	@override String get edit => 'Редагувати курс';
	@override String get empty => 'Активних курсів немає.';
	@override String get serving => 'порція';
	@override String get servings => 'порцій';
	@override String get deleteConfirmContent => 'Видалити цей курс? Дію неможливо скасувати.';
	@override late final TranslationsCoursesFieldsUa fields = TranslationsCoursesFieldsUa._(_root);
}

// Path: products
class TranslationsProductsUa implements TranslationsProductsEn {
	TranslationsProductsUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Продукти';
	@override String get createTitle => 'Новий продукт';
	@override String get create => 'Створити';
	@override String get nameLabel => 'Назва продукту';
	@override String get descriptionLabel => 'Опис (необов\'язково)';
	@override String get addIngredient => 'Додати інгредієнт';
	@override String get ingredientSearchHint => 'Пошук інгредієнтів...';
	@override String addCustomIngredient({required Object query}) => 'Додати ${query} як власний інгредієнт';
	@override String get amountLabel => 'Кількість';
	@override String get unitLabel => 'Одиниця (напр. мг, МО)';
	@override String get saveProduct => 'Зберегти продукт';
	@override String get noIngredients => 'Інгредієнти ще не додані.';
	@override String get ingredientsTitle => 'Інгредієнти';
	@override String get noSpecificIngredients => 'Конкретні інгредієнти не вказані.';
	@override String get global => 'Загальний';
	@override String get custom => 'Власний';
}

// Path: settings
class TranslationsSettingsUa implements TranslationsSettingsEn {
	TranslationsSettingsUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Налаштування';
	@override late final TranslationsSettingsAccountUa account = TranslationsSettingsAccountUa._(_root);
	@override late final TranslationsSettingsSyncUa sync = TranslationsSettingsSyncUa._(_root);
	@override late final TranslationsSettingsLanguageUa language = TranslationsSettingsLanguageUa._(_root);
	@override late final TranslationsSettingsNotificationsUa notifications = TranslationsSettingsNotificationsUa._(_root);
	@override late final TranslationsSettingsDeveloperUa developer = TranslationsSettingsDeveloperUa._(_root);
	@override late final TranslationsSettingsDangerUa danger = TranslationsSettingsDangerUa._(_root);
}

// Path: auth
class TranslationsAuthUa implements TranslationsAuthEn {
	TranslationsAuthUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsAuthLoginUa login = TranslationsAuthLoginUa._(_root);
	@override late final TranslationsAuthRegisterUa register = TranslationsAuthRegisterUa._(_root);
	@override late final TranslationsAuthValidationUa validation = TranslationsAuthValidationUa._(_root);
}

// Path: validation
class TranslationsValidationUa implements TranslationsValidationEn {
	TranslationsValidationUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get productRequired => 'Оберіть продукт.';
	@override String get servingSizePositive => 'Значення має бути більше 0.';
	@override String get endDateOnOrAfterStart => 'Дата закінчення не може бути раніше дати початку.';
	@override String get nameRequired => 'Вкажіть назву.';
}

// Path: errors
class TranslationsErrorsUa implements TranslationsErrorsEn {
	TranslationsErrorsUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get network => 'Помилка мережі. Перевірте підключення.';
	@override late final TranslationsErrorsAuthUa auth = TranslationsErrorsAuthUa._(_root);
	@override String get sync => 'Синхронізація не вдалась. Ми спробуємо ще раз.';
	@override String get unknown => 'Щось пішло не так.';
	@override String get deviceTime => 'Перевірте час на пристрої та спробуйте знову.';
}

// Path: notifications
class TranslationsNotificationsUa implements TranslationsNotificationsEn {
	TranslationsNotificationsUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get title => 'VitaLog';
	@override String takeReminder({required Object name}) => 'Час прийому: ${name}';
}

// Path: common
class TranslationsCommonUa implements TranslationsCommonEn {
	TranslationsCommonUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Скасувати';
	@override String get save => 'Зберегти';
	@override String get delete => 'Видалити';
	@override String get confirm => 'Підтвердити';
	@override String get loading => 'Завантаження...';
	@override String get retry => 'Повторити';
}

// Path: logs.tabs
class TranslationsLogsTabsUa implements TranslationsLogsTabsEn {
	TranslationsLogsTabsUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get intake => 'Прийоми';
	@override String get wellbeing => 'Самопочуття';
}

// Path: courses.fields
class TranslationsCoursesFieldsUa implements TranslationsCoursesFieldsEn {
	TranslationsCoursesFieldsUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get product => 'Продукт';
	@override String get servingSize => 'Розмір порції';
	@override String get timeOfDay => 'Час прийому';
	@override String get startDate => 'Дата початку';
	@override String get endDate => 'Дата закінчення (необов\'язково)';
}

// Path: settings.account
class TranslationsSettingsAccountUa implements TranslationsSettingsAccountEn {
	TranslationsSettingsAccountUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Акаунт';
	@override String get guest => 'Гість';
	@override String get signInCta => 'Увійдіть, щоб увімкнути хмарну синхронізацію';
	@override String get logout => 'Вийти';
	@override String get logoutDialogContent => 'Як ви хочете вийти?';
	@override String get keepData => 'Зберегти локальні дані';
	@override String get eraseData => 'Вийти та видалити дані';
	@override String get eraseDataConfirmTitle => 'Ви впевнені?';
	@override String get eraseDataConfirmContent => 'Це видалить усі локальні дані з цього пристрою.';
}

// Path: settings.sync
class TranslationsSettingsSyncUa implements TranslationsSettingsSyncEn {
	TranslationsSettingsSyncUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Синхронізація';
	@override String get lastSync => 'Остання синхронізація';
	@override String get syncNow => 'Синхронізувати зараз';
	@override String get wifiOnly => 'Тільки Wi-Fi';
	@override String get never => 'Ніколи';
}

// Path: settings.language
class TranslationsSettingsLanguageUa implements TranslationsSettingsLanguageEn {
	TranslationsSettingsLanguageUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Мова';
	@override String get en => 'Англійська';
	@override String get ua => 'Українська';
}

// Path: settings.notifications
class TranslationsSettingsNotificationsUa implements TranslationsSettingsNotificationsEn {
	TranslationsSettingsNotificationsUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Сповіщення';
	@override String get rebuild => 'Оновити розклад';
}

// Path: settings.developer
class TranslationsSettingsDeveloperUa implements TranslationsSettingsDeveloperEn {
	TranslationsSettingsDeveloperUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Розробник';
	@override String get viewLogs => 'Переглянути логи';
}

// Path: settings.danger
class TranslationsSettingsDangerUa implements TranslationsSettingsDangerEn {
	TranslationsSettingsDangerUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Небезпечна зона';
	@override String get clearLocalData => 'Очистити локальні дані';
	@override String get clearLocalDataConfirmContent => 'Це назавжди видалить усі локальні дані. Синхронізовані дані можна відновити, увійшовши знову.';
}

// Path: auth.login
class TranslationsAuthLoginUa implements TranslationsAuthLoginEn {
	TranslationsAuthLoginUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Увійти';
	@override String get email => 'Електронна пошта';
	@override String get password => 'Пароль';
	@override String get submit => 'Увійти';
	@override String get noAccount => 'Немає акаунту? Зареєструватися';
}

// Path: auth.register
class TranslationsAuthRegisterUa implements TranslationsAuthRegisterEn {
	TranslationsAuthRegisterUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Створити акаунт';
	@override String get email => 'Електронна пошта';
	@override String get password => 'Пароль';
	@override String get confirmPassword => 'Підтвердіть пароль';
	@override String get submit => 'Створити акаунт';
	@override String get hasAccount => 'Вже є акаунт? Увійти';
}

// Path: auth.validation
class TranslationsAuthValidationUa implements TranslationsAuthValidationEn {
	TranslationsAuthValidationUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get emailRequired => 'Вкажіть електронну пошту';
	@override String get emailInvalid => 'Вкажіть коректну адресу електронної пошти';
	@override String get emailMaxLength => 'Адреса електронної пошти має містити не більше 255 символів';
	@override String get passwordRequired => 'Вкажіть пароль';
	@override String get passwordMinLength => 'Пароль має містити щонайменше 8 символів.';
	@override String get passwordMaxLength => 'Пароль має містити не більше 128 символів.';
	@override String get passwordUppercase => 'Пароль має містити принаймні одну велику літеру.';
	@override String get passwordLowercase => 'Пароль має містити принаймні одну малу літеру.';
	@override String get passwordDigit => 'Пароль має містити принаймні одну цифру.';
	@override String get confirmPasswordRequired => 'Підтвердіть пароль';
	@override String get confirmPasswordMismatch => 'Паролі не збігаються';
}

// Path: errors.auth
class TranslationsErrorsAuthUa implements TranslationsErrorsAuthEn {
	TranslationsErrorsAuthUa._(this._root);

	final TranslationsUa _root; // ignore: unused_field

	// Translations
	@override String get expired => 'Сесія закінчилась. Будь ласка, увійдіть знову.';
	@override String get unauthorized => 'Доступ заборонено.';
}

/// The flat map containing all translations for locale <ua>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsUa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appName' => 'VitaLog',
			'nav.today' => 'Сьогодні',
			'nav.history' => 'Історія',
			'nav.courses' => 'Курси',
			'nav.settings' => 'Опції',
			'dashboard.title' => 'План на сьогодні',
			'dashboard.empty' => 'На сьогодні курсів не заплановано.',
			'dashboard.quickLog' => 'Відмітити прийом',
			'dashboard.takenAt' => ({required Object time}) => 'Прийнято о ${time}',
			'logs.title' => 'Історія',
			'logs.tabs.intake' => 'Прийоми',
			'logs.tabs.wellbeing' => 'Самопочуття',
			'logs.empty' => 'Записів ще немає.',
			'wellbeing.title' => 'Додати запис',
			'wellbeing.mood' => 'Настрій',
			'wellbeing.energy' => 'Енергія',
			'wellbeing.sleep' => 'Сон (год)',
			'wellbeing.notes' => 'Нотатки',
			'wellbeing.save' => 'Зберегти',
			'wellbeing.success' => 'Ви вже зафіксували самопочуття сьогодні. Дякуємо!',
			'wellbeing.prompt' => 'Як ви почуваєтесь сьогодні? 📝',
			'wellbeing.sleepValue' => ({required Object value}) => '${value} год',
			'courses.title' => 'Курси',
			'courses.create' => 'Новий курс',
			'courses.edit' => 'Редагувати курс',
			'courses.empty' => 'Активних курсів немає.',
			'courses.serving' => 'порція',
			'courses.servings' => 'порцій',
			'courses.deleteConfirmContent' => 'Видалити цей курс? Дію неможливо скасувати.',
			'courses.fields.product' => 'Продукт',
			'courses.fields.servingSize' => 'Розмір порції',
			'courses.fields.timeOfDay' => 'Час прийому',
			'courses.fields.startDate' => 'Дата початку',
			'courses.fields.endDate' => 'Дата закінчення (необов\'язково)',
			'products.title' => 'Продукти',
			'products.createTitle' => 'Новий продукт',
			'products.create' => 'Створити',
			'products.nameLabel' => 'Назва продукту',
			'products.descriptionLabel' => 'Опис (необов\'язково)',
			'products.addIngredient' => 'Додати інгредієнт',
			'products.ingredientSearchHint' => 'Пошук інгредієнтів...',
			'products.addCustomIngredient' => ({required Object query}) => 'Додати ${query} як власний інгредієнт',
			'products.amountLabel' => 'Кількість',
			'products.unitLabel' => 'Одиниця (напр. мг, МО)',
			'products.saveProduct' => 'Зберегти продукт',
			'products.noIngredients' => 'Інгредієнти ще не додані.',
			'products.ingredientsTitle' => 'Інгредієнти',
			'products.noSpecificIngredients' => 'Конкретні інгредієнти не вказані.',
			'products.global' => 'Загальний',
			'products.custom' => 'Власний',
			'settings.title' => 'Налаштування',
			'settings.account.title' => 'Акаунт',
			'settings.account.guest' => 'Гість',
			'settings.account.signInCta' => 'Увійдіть, щоб увімкнути хмарну синхронізацію',
			'settings.account.logout' => 'Вийти',
			'settings.account.logoutDialogContent' => 'Як ви хочете вийти?',
			'settings.account.keepData' => 'Зберегти локальні дані',
			'settings.account.eraseData' => 'Вийти та видалити дані',
			'settings.account.eraseDataConfirmTitle' => 'Ви впевнені?',
			'settings.account.eraseDataConfirmContent' => 'Це видалить усі локальні дані з цього пристрою.',
			'settings.sync.title' => 'Синхронізація',
			'settings.sync.lastSync' => 'Остання синхронізація',
			'settings.sync.syncNow' => 'Синхронізувати зараз',
			'settings.sync.wifiOnly' => 'Тільки Wi-Fi',
			'settings.sync.never' => 'Ніколи',
			'settings.language.title' => 'Мова',
			'settings.language.en' => 'Англійська',
			'settings.language.ua' => 'Українська',
			'settings.notifications.title' => 'Сповіщення',
			'settings.notifications.rebuild' => 'Оновити розклад',
			'settings.developer.title' => 'Розробник',
			'settings.developer.viewLogs' => 'Переглянути логи',
			'settings.danger.title' => 'Небезпечна зона',
			'settings.danger.clearLocalData' => 'Очистити локальні дані',
			'settings.danger.clearLocalDataConfirmContent' => 'Це назавжди видалить усі локальні дані. Синхронізовані дані можна відновити, увійшовши знову.',
			'auth.login.title' => 'Увійти',
			'auth.login.email' => 'Електронна пошта',
			'auth.login.password' => 'Пароль',
			'auth.login.submit' => 'Увійти',
			'auth.login.noAccount' => 'Немає акаунту? Зареєструватися',
			'auth.register.title' => 'Створити акаунт',
			'auth.register.email' => 'Електронна пошта',
			'auth.register.password' => 'Пароль',
			'auth.register.confirmPassword' => 'Підтвердіть пароль',
			'auth.register.submit' => 'Створити акаунт',
			'auth.register.hasAccount' => 'Вже є акаунт? Увійти',
			'auth.validation.emailRequired' => 'Вкажіть електронну пошту',
			'auth.validation.emailInvalid' => 'Вкажіть коректну адресу електронної пошти',
			'auth.validation.emailMaxLength' => 'Адреса електронної пошти має містити не більше 255 символів',
			'auth.validation.passwordRequired' => 'Вкажіть пароль',
			'auth.validation.passwordMinLength' => 'Пароль має містити щонайменше 8 символів.',
			'auth.validation.passwordMaxLength' => 'Пароль має містити не більше 128 символів.',
			'auth.validation.passwordUppercase' => 'Пароль має містити принаймні одну велику літеру.',
			'auth.validation.passwordLowercase' => 'Пароль має містити принаймні одну малу літеру.',
			'auth.validation.passwordDigit' => 'Пароль має містити принаймні одну цифру.',
			'auth.validation.confirmPasswordRequired' => 'Підтвердіть пароль',
			'auth.validation.confirmPasswordMismatch' => 'Паролі не збігаються',
			'validation.productRequired' => 'Оберіть продукт.',
			'validation.servingSizePositive' => 'Значення має бути більше 0.',
			'validation.endDateOnOrAfterStart' => 'Дата закінчення не може бути раніше дати початку.',
			'validation.nameRequired' => 'Вкажіть назву.',
			'errors.network' => 'Помилка мережі. Перевірте підключення.',
			'errors.auth.expired' => 'Сесія закінчилась. Будь ласка, увійдіть знову.',
			'errors.auth.unauthorized' => 'Доступ заборонено.',
			'errors.sync' => 'Синхронізація не вдалась. Ми спробуємо ще раз.',
			'errors.unknown' => 'Щось пішло не так.',
			'errors.deviceTime' => 'Перевірте час на пристрої та спробуйте знову.',
			'notifications.title' => 'VitaLog',
			'notifications.takeReminder' => ({required Object name}) => 'Час прийому: ${name}',
			'common.cancel' => 'Скасувати',
			'common.save' => 'Зберегти',
			'common.delete' => 'Видалити',
			'common.confirm' => 'Підтвердити',
			'common.loading' => 'Завантаження...',
			'common.retry' => 'Повторити',
			_ => null,
		};
	}
}
