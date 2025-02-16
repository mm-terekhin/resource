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
	late final TranslationsGoalsEn goals = TranslationsGoalsEn._(_root);
	late final TranslationsFinanceEn finance = TranslationsFinanceEn._(_root);
	late final TranslationsSharedEn shared = TranslationsSharedEn._(_root);
	late final TranslationsTextFieldLabelEn textFieldLabel = TranslationsTextFieldLabelEn._(_root);
	late final TranslationsButtonTitleEn buttonTitle = TranslationsButtonTitleEn._(_root);
}

// Path: goals
class TranslationsGoalsEn {
	TranslationsGoalsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Goals';
}

// Path: finance
class TranslationsFinanceEn {
	TranslationsFinanceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Finance';
}

// Path: shared
class TranslationsSharedEn {
	TranslationsSharedEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get priority => 'Priority:';
	String get termUp => 'Term up to:';
}

// Path: textFieldLabel
class TranslationsTextFieldLabelEn {
	TranslationsTextFieldLabelEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Title...';
	String get comment => 'Comment...';
	String get smallTaskAdd => 'Add a sub-issue';
}

// Path: buttonTitle
class TranslationsButtonTitleEn {
	TranslationsButtonTitleEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get save => 'Save';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Resource';
			case 'goals.title': return 'Goals';
			case 'finance.title': return 'Finance';
			case 'shared.priority': return 'Priority:';
			case 'shared.termUp': return 'Term up to:';
			case 'textFieldLabel.title': return 'Title...';
			case 'textFieldLabel.comment': return 'Comment...';
			case 'textFieldLabel.smallTaskAdd': return 'Add a sub-issue';
			case 'buttonTitle.save': return 'Save';
			default: return null;
		}
	}
}

