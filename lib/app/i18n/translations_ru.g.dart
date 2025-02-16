///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	// Translations
	@override String get appName => 'Resource';
	@override late final _TranslationsGoalsRu goals = _TranslationsGoalsRu._(_root);
	@override late final _TranslationsFinanceRu finance = _TranslationsFinanceRu._(_root);
	@override late final _TranslationsSharedRu shared = _TranslationsSharedRu._(_root);
	@override late final _TranslationsTextFieldLabelRu textFieldLabel = _TranslationsTextFieldLabelRu._(_root);
	@override late final _TranslationsButtonTitleRu buttonTitle = _TranslationsButtonTitleRu._(_root);
}

// Path: goals
class _TranslationsGoalsRu implements TranslationsGoalsEn {
	_TranslationsGoalsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Цели';
}

// Path: finance
class _TranslationsFinanceRu implements TranslationsFinanceEn {
	_TranslationsFinanceRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Финансы';
}

// Path: shared
class _TranslationsSharedRu implements TranslationsSharedEn {
	_TranslationsSharedRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get priority => 'Приоритет:';
	@override String get termUp => 'Срок до:';
}

// Path: textFieldLabel
class _TranslationsTextFieldLabelRu implements TranslationsTextFieldLabelEn {
	_TranslationsTextFieldLabelRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Название...';
	@override String get comment => 'Комментарий...';
	@override String get smallTaskAdd => 'Добавить подзадачу';
}

// Path: buttonTitle
class _TranslationsButtonTitleRu implements TranslationsButtonTitleEn {
	_TranslationsButtonTitleRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get save => 'Сохранить';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Resource';
			case 'goals.title': return 'Цели';
			case 'finance.title': return 'Финансы';
			case 'shared.priority': return 'Приоритет:';
			case 'shared.termUp': return 'Срок до:';
			case 'textFieldLabel.title': return 'Название...';
			case 'textFieldLabel.comment': return 'Комментарий...';
			case 'textFieldLabel.smallTaskAdd': return 'Добавить подзадачу';
			case 'buttonTitle.save': return 'Сохранить';
			default: return null;
		}
	}
}

