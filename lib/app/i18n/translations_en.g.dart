///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final i18n = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
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

	// Translations
	String get appName => 'Resource';
	late final TranslationsTodoEn todo = TranslationsTodoEn._(_root);
	late final TranslationsFinanceEn finance = TranslationsFinanceEn._(_root);
}

// Path: todo
class TranslationsTodoEn {
	TranslationsTodoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Todo';
	String get tasksTitle => 'Tasks';
	String get goalsTitle => 'Goals';
	String get ideasTitle => 'Ideas';
}

// Path: finance
class TranslationsFinanceEn {
	TranslationsFinanceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Finance';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Resource';
			case 'todo.title': return 'Todo';
			case 'todo.tasksTitle': return 'Tasks';
			case 'todo.goalsTitle': return 'Goals';
			case 'todo.ideasTitle': return 'Ideas';
			case 'finance.title': return 'Finance';
			default: return null;
		}
	}
}

