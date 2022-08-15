import 'package:flash/config/constants.dart';
import 'package:flash/flashcards/models/flashcard.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';

class SheetService {
  SheetService(this._spreadsheetId) {
    _init = _initSheetService();
  }

  final String _spreadsheetId;
  late Future<void> _init;
  late SheetsApi _sheetsApi;

  Future<void> _initSheetService() async {
    final accountCredentials = ServiceAccountCredentials.fromJson(credentials);
    final scopes = [
      SheetsApi.spreadsheetsReadonlyScope,
      // SheetsApi.driveReadonlyScope
    ];
    final client = await clientViaServiceAccount(accountCredentials, scopes);
    _sheetsApi = SheetsApi(client);
  }

  Future<List<Flashcard>> getFlashcards() async {
    await _init;

    final result = await _sheetsApi.spreadsheets.values.get(
      _spreadsheetId,
      'A1:B1000',
    );
    final rows = result.values;

    final flashcards = <Flashcard>[];

    if (rows == null) {
      return flashcards;
    }

    for (final e in rows) {
      if (e.isEmpty || e.length != 2) continue;

      flashcards.add(
        Flashcard(
          question: e[0].toString().trim(),
          answer: e[1].toString().trim(),
        ),
      );
    }

    return flashcards;
  }
}
