import 'package:flutter/cupertino.dart';

class LocaleProvider extends InheritedWidget {
  final Locale selectedLocale;
  final void Function(Locale) onLocaleChange;

  const LocaleProvider({
    super.key,
    required this.selectedLocale,
    required this.onLocaleChange,
    required super.child,
  });

  static LocaleProvider of(BuildContext context) {
    final LocaleProvider? result =
        context.dependOnInheritedWidgetOfExactType<LocaleProvider>();
    assert(result != null, 'No LocaleProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(LocaleProvider old) {
    return selectedLocale != old.selectedLocale;
  }
}
