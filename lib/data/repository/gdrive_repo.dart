import 'package:flash/config/constants.dart';
import 'package:flash/data/models/deck.dart';
import 'package:flash/data/models/flashcard.dart';
import 'package:googleapis/drive/v2.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';

class GDriveRepo {
  GDriveRepo() {
    _init = _initGDriveRepo();
  }

  late Future<void> _init;
  late DriveApi _driveApi;
  late SheetsApi _sheetsApi;

  Future<void> _initGDriveRepo() async {
    final accountCredentials = ServiceAccountCredentials.fromJson(kCredentials);
    final scopes = [
      SheetsApi.spreadsheetsReadonlyScope,
      SheetsApi.driveReadonlyScope,
    ];
    final client = await clientViaServiceAccount(accountCredentials, scopes);
    _driveApi = DriveApi(client);
    _sheetsApi = SheetsApi(client);
  }

  Future<List<Deck>> getDecks() async {
    await _init;

    final filesAndFolders = await _getFilesAndFolders();
    if (filesAndFolders == null) {
      throw UnsupportedError('No files nor folders.');
    }

    final sheets = filesAndFolders
        .where((e) => e.mimeType?.contains('spreadsheet') ?? false)
        .toList();

    final decks = Future.wait(
      sheets.where((sheet) => sheet.id != null).map((sheet) {
        final deck = _getDeck(sheet.id!);
        return deck;
      }),
    );
    return decks;
  }

  Future<List<File>?> _getFilesAndFolders() async {
    await _init;
    final result = await _driveApi.files.list();
    final files = result.items;
    if (files == null) return null;
    return files;
  }

  Future<Deck> _getDeck(String sheetID) async {
    await _init;

    final sheet = await _sheetsApi.spreadsheets.get(sheetID);
    final title = (sheet.properties?.title ?? '').trim();

    final data = await _sheetsApi.spreadsheets.values.get(sheetID, 'A1:B1000');
    final rows = data.values;

    if (rows == null || rows.length < 2 || rows[0].length != 2) {
      throw UnsupportedError('Wrong data format');
    }

    final category = rows[0][0].toString().trim();
    final user = rows[0][1].toString().trim();

    rows.removeAt(0);
    final flashcards = rows
        .where((row) => row.length == 2)
        .map(
          (row) => Flashcard(
            question: row[0].toString().trim(),
            answer: row[1].toString().trim(),
          ),
        )
        .toList();

    final deck = Deck(
      category: category,
      title: title,
      user: user,
      flashcards: flashcards,
      defaultFlashcardsLength: flashcards.length,
    );
    return deck;
  }
}
