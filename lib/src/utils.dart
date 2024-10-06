import 'dart:io';

void printGreeting(String text) {
  print('\x1B[34m$text\x1B[0m');
}

void printError(String text) {
  print('\x1B[33m$text\x1B[0m');
}

void clearScreen() {
  // might not work on all platforms
  print(Process.runSync("clear", [], runInShell: true).stdout);
}

void printMenu() {}
