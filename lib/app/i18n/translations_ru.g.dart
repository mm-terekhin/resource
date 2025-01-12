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
	@override late final _TranslationsTodoRu todo = _TranslationsTodoRu._(_root);
	@override late final _TranslationsFinanceRu finance = _TranslationsFinanceRu._(_root);
}

// Path: todo
class _TranslationsTodoRu implements TranslationsTodoEn {
	_TranslationsTodoRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Todo';
	@override String get tasksTitle => 'Задачи';
	@override String get goalsTitle => 'Цели';
	@override String get ideasTitle => 'Идеи';
}

// Path: finance
class _TranslationsFinanceRu implements TranslationsFinanceEn {
	_TranslationsFinanceRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Финансы';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Resource';
			case 'todo.title': return 'Todo';
			case 'todo.tasksTitle': return 'Задачи';
			case 'todo.goalsTitle': return 'Цели';
			case 'todo.ideasTitle': return 'Идеи';
			case 'finance.title': return 'Финансы';
			default: return null;
		}
	}
}

