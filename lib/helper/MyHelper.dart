import 'package:flutter/material.dart';

Color? colorFromHex(String hexColor) {
  Color x;
  hexColor.contains('#')
      ? x = Color(int.parse("0xff" + hexColor.replaceAll("#", "")))
      : x = Color(int.parse("0xff" + hexColor));
  return x;
}

String? validator({
  required String? text,
  bool isPassword = false,
  bool isEmail = false,
  bool isCountry = false,
  bool isPhone = false,
  bool isFullName = false,
  bool isConfirmPassword = false,
  String? confirmPasswordText,
}) {
  if (text == null) {
    return "please Enter letters it's Empty !! ";
  } else {
    if (isEmail) {
      if (!text.contains(
          RegExp(r'[A-Za-z0-9.%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$'))) {
        return " Must be a valid email address . ";
      }
    } else if (isPassword) {
      if (!RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}').hasMatch(text))
        return "Your password must be at least 6 characters as we \n as contain at last one Uppercase, one lowercase, \n and one number.";
    } else if (isConfirmPassword) {
      if (confirmPasswordText == null) {
        return "please enter your password ";
      }
      if (text.toString() != confirmPasswordText.toString()) {
        return "The Password doesn't match";
      }
    } else if (isFullName) {
      if (!RegExp(
              r'([A-Za-z]{3,16})([*]{0,1})([A-Za-z]{3,16})?([*]{0,1})?([A-Za-z]{3,16})?([*]{0,1})?([A-Za-z]{3,16})')
          .hasMatch(text)) return " Must be a valid name . ";
    } else if (isPhone) {
      if (!RegExp(r'^\+(?:[0-9]●?){6,14}[0-9]$').hasMatch(text))
        return " Must be a valid phone number . ";
    }
  }
}

void navAndFinish({
  required BuildContext context,
  required String routeName,
  Object? data,
}) =>
    Navigator.of(context).pushReplacementNamed(routeName, arguments: data);

void nav({
  required context,
  required String routeName,
  Object? data,
}) =>
    Navigator.of(context).pushNamed(routeName, arguments: data);

SizedBox sb({double? h, double? w}) => SizedBox(width: w, height: h);

Object? dataFromScreen(BuildContext context) =>
    ModalRoute.of(context)!.settings.arguments;

TextStyle defaultTextStyle(BuildContext context) =>
    Theme.of(context).textTheme.bodyText1!;

wordOfLine whereWordInLine({
  required String word,
  required String lineOfWords,
}) {
  if (word.trim() == "") return wordOfLine.none;
  lineOfWords = lineOfWords.trim();
  word = word.trim();
  // ignore: unused_local_variable
  var isFirst = ((lineOfWords.substring(0, word.length)) == word);
  var isLast = ((lineOfWords.substring(
          lineOfWords.lastIndexOf(word), lineOfWords.length)) ==
      word);

  if (lineOfWords.contains(word)) {
    if (isFirst) {
      return wordOfLine.start;
    } else if (isLast) {
      return wordOfLine.end;
    } else if (!isFirst && !isLast) {
      return wordOfLine.middle;
    }
  }
  return wordOfLine.none;
}

enum wordOfLine { start, end, middle, none }

ResultOfSplitLineToPartsByWord? splitLineToPartsByWord({
  required wordOfLine wordPositionInLine,
  required String word,
  required String lineOfWords,
}) {
  if (wordPositionInLine != wordOfLine.none) {
    if (wordPositionInLine == wordOfLine.middle) {
      return ResultOfSplitLineToPartsByWord(
        firstPart: lineOfWords.substring(0, lineOfWords.indexOf(word)),
        secondPart: lineOfWords.substring(
            lineOfWords.indexOf(word) + word.length, lineOfWords.length),
        word: word,
      );
    } else if (wordPositionInLine == wordOfLine.start) {
      return ResultOfSplitLineToPartsByWord(
        secondPart: lineOfWords.substring(
            lineOfWords.indexOf(word) + word.length, lineOfWords.length),
      );
    } else if (wordPositionInLine == wordOfLine.end) {
      return ResultOfSplitLineToPartsByWord(
        firstPart: lineOfWords.substring(0, lineOfWords.indexOf(word)),
      );
    }
  }
  return null;
}

class ResultOfSplitLineToPartsByWord {
  String? firstPart;
  String? secondPart;
  String? word;
  ResultOfSplitLineToPartsByWord({
    this.firstPart,
    this.secondPart,
    this.word,
  });
}
