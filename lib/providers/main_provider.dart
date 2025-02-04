import 'package:flutter/material.dart';
import 'package:bible/models/book.dart';
import 'package:bible/models/verse.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// MainProvider class extends ChangeNotifier for state management
class MainProvider extends ChangeNotifier{
    // Controllers and listeners for managing scroll positions and items 
    ItemScrollController itemScrollController = ItemScrollController();
    ScrollOffsetController scrollOffsetController = ScrollOffsetController();
    ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
    ScrollOffsetListener scrollOffsetListener = ScrollOffsetListener.create();

    // List to state Verse objects
    List<Verse> verses = [];

    // Method to add a Verse to the list and notify listeners
    void addVerse({required Verse verse}) {
        verses.add(verse);
        notifyListeners();
    }

}