import 'package:collection/collection.dart';
import 'package:flash/config/constants.dart';
import 'package:flash/data/models/deck.dart';
import 'package:flash/data/models/flashcard.dart';
import 'package:googleapis/drive/v2.dart';
import 'package:gsheets/gsheets.dart';

class GDriveRepo {
  GDriveRepo() {
    _init = _initGDriveRepo();
  }

  late Future<void> _init;
  late DriveApi _driveApi;
  late GSheets _gSheets;

  Future<void> _initGDriveRepo() async {
    _gSheets = GSheets(kCredentials);
    _driveApi = DriveApi(await _gSheets.client);
  }

  Future<List<Deck>> getDecks() async {
    await _init;

    final filesAndFolders = await _getFilesAndFolders();
    if (filesAndFolders == null) return List.empty();

    final sheets = filesAndFolders
        .where((e) => e.mimeType?.contains('spreadsheet') ?? false)
        .toList();

    final decks = <Deck>[];
    for (final sheet in sheets.where((sheet) => sheet.id != null)) {
      final deck = await _getDeck(sheet.id!);
      if (deck == null) continue;
      decks.add(deck);
    }

    return decks;
  }

  Future<List<File>?> _getFilesAndFolders() async {
    await _init;

    final result = await _driveApi.files.list();
    final files = result.items;
    if (files == null) return null;
    return files;
  }

  Future<Deck?> _getDeck(String sheetID) async {
    await _init;

    final ss = await _gSheets.spreadsheet(sheetID);
    if (ss.sheets.isEmpty) return null;

    final sheet = ss.sheets.first;
    final rows = await sheet.values.allRows();

    if (rows.length < 2 || rows[0].length != 2) return null;

    final title = (ss.data.properties.title ?? '').trim();
    final category = rows[0][0].trim();
    final nickname = rows[0][1].trim();
    rows.removeAt(0);

    final flashcards = rows
        .where((row) => row.length == 2)
        .mapIndexed((index, row) => Flashcard(
              index: index,
              question: row[0].trim(),
              answer: row[1].trim(),
            ))
        .toList();

    final deck = Deck(
      category: category,
      title: title,
      nickname: nickname,
      flashcards: flashcards,
      defaultFlashcardsLength: flashcards.length,
    );
    return deck;
  }

  Future<void> saveDeck(Deck deck) async {
    await _init;

    final ss = await _gSheets.createSpreadsheet(deck.title.trim());
    final sheet = await ss.addWorksheet('deck');

    await sheet.values.insertRow(1, [
      deck.category.trim(),
      deck.nickname.trim(),
    ]);

    deck.flashcards.forEachIndexed((index, flashcard) async {
      await sheet.values.insertRow(index + 2, [
        flashcard.question.trim(),
        flashcard.answer.trim(),
      ]);
    });
  }
}
