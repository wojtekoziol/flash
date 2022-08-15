import 'package:flash/config/constants.dart';
import 'package:flash/flashcards/models/flashcard.dart';
import 'package:flash/flashcards/repository/interfaces/cloud_storage_repo.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';

class GSheetsStorageRepo extends CloudStorageRepo {
  GSheetsStorageRepo(this._sheetID) {
    _init = _initRepo();
  }

  final String _sheetID;
  late SheetsApi _sheetsApi;
  late Future<void> _init;

  Future<void> _initRepo() async {
    final accountCredentials = ServiceAccountCredentials.fromJson(credentials);
    final scopes = [
      SheetsApi.spreadsheetsReadonlyScope,
      // SheetsApi.driveReadonlyScope,
    ];
    final client = await clientViaServiceAccount(accountCredentials, scopes);
    _sheetsApi = SheetsApi(client);
  }

  @override
  Future<String> getCategory() async {
    await _init;

    final result = await _sheetsApi.spreadsheets.values.get(
      _sheetID,
      'A1:A1',
    );
    final rows = result.values;

    if (rows == null || rows.isEmpty || rows[0].length != 1) return '';

    return rows[0][0].toString().trim();
  }

  @override
  Future<List<Flashcard>> getFlashcards() async {
    await _init;

    final result =
        await _sheetsApi.spreadsheets.values.get(_sheetID, 'A2:B1000');
    final rows = result.values;

    if (rows == null) return List.empty();

    final flashcards = <Flashcard>[];
    for (final row in rows) {
      if (row.isEmpty || row.length != 2) continue;

      flashcards.add(
        Flashcard(
          question: row[0].toString().trim(),
          answer: row[1].toString().trim(),
        ),
      );
    }

    return flashcards;
  }

  @override
  Future<String> getTitle() async {
    await _init;
    final sheet = await _sheetsApi.spreadsheets.get(_sheetID);
    final title = sheet.properties?.title ?? '';
    return title.trim();
  }

  @override
  Future<String> getUser() async {
    await _init;

    final result = await _sheetsApi.spreadsheets.values.get(
      _sheetID,
      'B1:B1',
    );
    final rows = result.values;

    if (rows == null || rows.isEmpty || rows[0].length != 1) return '';

    return rows[0][0].toString().trim();
  }
}
