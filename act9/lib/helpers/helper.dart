import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  static const foldersTable = 'folders';
  static const columnFolderId = 'id';
  static const columnFolderName = 'folder_name';
  static const columnFolderTimestamp = 'timestamp';

  static const cardsTable = 'card';
  static const columnCardId = 'id';
  static const columnCardName = 'name';
  static const columnCardSuit = 'suit';
  static const columnCardImageUrl = 'url';
  static const columnCardFolderId = 'folder_id';

  late Database _db;
// this opens the database (and creates it if it doesn't exist)
  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

// SQL code to create the database tables
  Future _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE $foldersTable (
$columnFolderId INTEGER PRIMARY KEY,
$columnFolderName TEXT NOT NULL,
$columnFolderTimestamp INTEGER NOT NULL
)
''');

    await db.execute('''
CREATE TABLE $cardsTable (
$columnCardId INTEGER PRIMARY KEY,
$columnCardName TEXT,
$columnCardSuit TEXT,
$columnCardImageUrl TEXT,
$columnCardFolderId INTEGER,
)
''');
    await prepopulateCardsTable(db); // inserts data to table
  }

  Future<void> prepopulateCardsTable(Database db) async {
    List cards = [];
    const suits = ['Hearts', 'Spades', 'Diamonds', 'Clubs'];
    const cardNames = [
      'Ace',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      'Jack',
      'Queen',
      'King'
    ];
    for (var suit in suits) {
      for (var i = 0; i < 13; i++) {
        // 1-13 for each suit or less
        final cardName = cardNames[i]; // cardname assigned to cards 1-13

        int folderId = 0;
        if (suit == 'Hearts') {
          folderId = 1;
        } else if (suit == 'Spades') {
          folderId = 2;
        } else if (suit == 'Diamonds') {
          folderId = 3;
        } else if (suit == 'Clubs') {
          folderId = 4;
        }

        cards.add({
          columnCardName: cardName,
          columnCardSuit: suit,
          columnCardFolderId: folderId,
        });
      }

      for (var card in cards) {
        await db.insert(cardsTable, card);
      }
    }
  }
}
