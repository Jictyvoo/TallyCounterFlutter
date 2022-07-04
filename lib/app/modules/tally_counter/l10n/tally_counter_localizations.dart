import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class TallyCounterLocalizations {
  final BuildContext context;

  TallyCounterLocalizations.of(this.context);

  AppLocalizations? _localizations() {
    return AppLocalizations.of(context);
  }

  String get purposeDialogTitle =>
      _localizations()?.purposeDialogTitle ?? 'New Purpose';

  String get purposeDialogNameLabel =>
      _localizations()?.purposeDialogNameLabel ?? 'Name';

  String get purposeDialogDescriptionLabel =>
      _localizations()?.purposeDialogDescriptionLabel ?? 'Description';

  String get cancel => _localizations()?.cancel ?? 'Cancel';

  String get create => _localizations()?.create ?? 'Create';

  String get failure => _localizations()?.failure ?? 'Alert';

  String get success => _localizations()?.success ?? 'Success!';

  String get tallyListTitle =>
      _localizations()?.tallyListTitle ?? 'List of registers';

  String get tallySaveToFolder =>
      _localizations()?.tallySaveToFolder ?? 'Save to folder';

  String get tallySavePickText =>
      _localizations()?.tallySavePickText ?? 'Save file to this folder';

  String get tallyRegistersExported =>
      _localizations()?.tallyRegistersExported ?? "Export successfully to";

  String get tallyRegisterExportTooltip =>
      _localizations()?.tallyRegisterExportTooltip ??
      'Save register list to a csv file';

  String get tallyCardPurposeLabel {
    final text = _localizations()?.tallyCardPurposeLabel ?? "Purpose";
    return '$text: ';
  }

  String get configPurposeTitle =>
      _localizations()?.configPurposeTitle ?? 'Purpose';

  String get tallyCardDurationLabel {
    final text = _localizations()?.tallyCardDurationLabel ?? 'Split Duration';
    return '$text: ';
  }

  String get tallyCardValuesLabel {
    final text = _localizations()?.tallyCardValuesLabel ?? 'Values';
    return '$text: ';
  }

  String get tallyCardEdit => _localizations()?.tallyCardEdit ?? 'Edit';

  String get tallyCardDelete => _localizations()?.tallyCardDelete ?? 'Delete';

  String get tallyListLoadingError =>
      _localizations()?.tallyListLoadingError ?? 'Loading error';

  String get tallyListEmpty =>
      _localizations()?.tallyListEmpty ?? 'There is no registers saved';

  String get tallyListRegisterDeleted =>
      _localizations()?.tallyListRegisterDeleted ?? 'Register deleted!';

  String get tallyListDeleteRegisterHint =>
      _localizations()?.tallyListDeleteRegisterHint ?? "Delete register from";

  String get atTime => _localizations()?.atTime ?? "at";

  String get undo => _localizations()?.undo ?? 'Undo';

  String tallyRegistersExportError(DateTime date) {
    final text = _localizations()?.tallyRegistersExportError ??
        "Failed to export registers from";
    return '$text `${DateFormat.yMMMEd().format(date)}`\n';
  }

  String get tallyShowToday =>
      _localizations()?.tallyShowToday ?? "Show today Tally's";

  String get tallyShowAll =>
      _localizations()?.tallyShowAll ?? "Show All Tally's";

  String get decrementTooltip =>
      _localizations()?.decrementTooltip ?? 'Decrement';

  String get incrementTooltip =>
      _localizations()?.incrementTooltip ?? 'Increment';

  String get counterValueLabel =>
      _localizations()?.counterValueLabel ?? 'Current counter is on value:';

  String get counterPausedFor =>
      _localizations()?.counterPausedFor ?? "Paused for";

  String get purposeAdd => _localizations()?.purposeAdd ?? 'Add Purpose';

  String get purposeAddFail =>
      _localizations()?.purposeAddFail ?? 'Failed to add purpose';

  String get counterChangeDialogTitle =>
      _localizations()?.counterChangeDialogTitle ?? 'Change Counter value';
}
