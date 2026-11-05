import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ArabicLocalizations {
  const ArabicLocalizations();

  static const LocalizationsDelegate<ArabicLocalizations> delegate =
      _ArabicLocalizationsDelegate();

  static ArabicLocalizations of(BuildContext context) {
    final localization =
        Localizations.of<ArabicLocalizations>(context, ArabicLocalizations);
    assert(localization != null, 'تعذر تحميل الترجمة العربية.');
    return localization!;
  }

  String get appTitle => 'المصحح الإلكتروني';
  String get dashboardTitle => 'لوحة التحكم';
  String get examsCount => 'عدد الاختبارات';
  String get studentsCount => 'عدد الطلاب';
  String get correctedExamsCount => 'الاختبارات المصححة';
  String get averageScore => 'متوسط الدرجات';
  String get phaseOneMessage => 'تم إعداد أساس التطبيق. ستضاف وظائف إدارة الاختبارات في المراحل التالية.';
}

class _ArabicLocalizationsDelegate
    extends LocalizationsDelegate<ArabicLocalizations> {
  const _ArabicLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ar';

  @override
  Future<ArabicLocalizations> load(Locale locale) =>
      SynchronousFuture(const ArabicLocalizations());

  @override
  bool shouldReload(_ArabicLocalizationsDelegate old) => false;
}
