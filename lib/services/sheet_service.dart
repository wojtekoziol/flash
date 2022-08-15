import 'package:flash/config/constants.dart';
import 'package:flash/flashcards/models/deck.dart';
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
      'A2:B1000',
    );
    final rows = result.values;

    final flashcards = <Flashcard>[];

    if (rows == null) return flashcards;

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

  Future<String> getTitle() async {
    await _init;
    final sheet = await _sheetsApi.spreadsheets.get(_spreadsheetId);
    return sheet.properties?.title ?? '';
  }

  Future<String> getCategory() async {
    await _init;

    final result = await _sheetsApi.spreadsheets.values.get(
      _spreadsheetId,
      'A1:A1',
    );
    final rows = result.values;

    if (rows == null || rows[0].length != 1) return '';

    return rows[0][0].toString();
  }

  Future<String> getUser() async {
    await _init;

    final result = await _sheetsApi.spreadsheets.values.get(
      _spreadsheetId,
      'B1:B1',
    );
    final rows = result.values;

    if (rows == null || rows[0].length != 1) return '';

    return rows[0][0].toString();
  }

  Future<Deck> getDeck() async {
    final title = await getTitle();
    final category = await getCategory();
    final user = await getUser();
    final flashcards = await getFlashcards();

    final deck = Deck(
      category: category,
      title: title,
      user: user,
      flashcards: flashcards,
    );
    return deck;
  }
}
