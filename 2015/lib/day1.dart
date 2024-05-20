// --- Day 1: Not Quite Lisp ---

import 'dart:convert';
import 'dart:io';

Future<void> answer() async {
  print("Day 1: Not Quite Lisp");
  final file = File.fromUri(Uri.file("resources/day1.txt"));
  final input = await file.readAsString(encoding: utf8);
  final ans = whatFlor(input);
  final ans2 = positon(input);
  print("answer to pt 1 is $ans");
  print("answer to pt 2 is $ans2");
}

// Santa was hoping for a white Christmas, but his weather machine's "snow" function is powered by stars, and he's fresh out! To save Christmas, he needs you to collect fifty stars by December 25th.

// Collect stars by helping Santa solve puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

// Here's an easy puzzle to warm you up.

// Santa is trying to deliver presents in a large apartment building, but he can't find the right floor - the directions he got are a little confusing. He starts on the ground floor (floor 0) and then follows the instructions one character at a time.

// An opening parenthesis, (, means he should go up one floor, and a closing parenthesis, ), means he should go down one floor.

// The apartment building is very tall, and the basement is very deep; he will never find the top or bottom floors.

// For example:

// (()) and ()() both result in floor 0.
// ((( and (()(()( both result in floor 3.
// ))((((( also results in floor 3.
// ()) and ))( both result in floor -1 (the first basement level).
// ))) and )())()) both result in floor -3.
// To what floor do the instructions take Santa?

int whatFlor(String s) {
  final left = "(".allMatches(s).length;
  final right = ")".allMatches(s).length;
  return left - right;
}

// --- Part Two ---
// Now, given the same instructions, find the position of the first character that causes him to enter the basement (floor -1). The first character in the instructions has position 1, the second character has position 2, and so on.

// For example:

// ) causes him to enter the basement at character position 1.
// ()()) causes him to enter the basement at character position 5.
// What is the position of the character that causes Santa to first enter the basement?

int positon(String s) {
  int sum = 0;
  for (final (i, c) in s.trim().split("").indexed) {
    switch (c) {
      case '(':
        sum++;
      case ')':
        sum--;
    }
    if (sum == -1) return i + 1;
  }
  return 0;
}
