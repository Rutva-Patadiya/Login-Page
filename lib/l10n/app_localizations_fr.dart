// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get hello => 'Bonjour!';

  @override
  String get loginTitle => 'Connectez-vous à E-Mart';

  @override
  String get loginSubTitle => 'Entrez votre e-mail enregistré pour vous connecter.';

  @override
  String get email => 'E-mail';

  @override
  String get password => 'Mot de passe';

  @override
  String get forgotPassword => 'Mot de passe oublié?';

  @override
  String get loginButton => 'Se connecter';

  @override
  String get onBoardText1 => 'Approuvé par des millions de personnes, faites partie d\'un tout';

  @override
  String get onBoardText2 => 'Dépensez de l\'argent à l\'étranger et suivez vos dépenses';

  @override
  String get onBoardText3 => 'Recevez de l\'argent de partout dans le monde';

  @override
  String get next => 'Suivant';

  @override
  String get getStarted => 'Commencer';
}
