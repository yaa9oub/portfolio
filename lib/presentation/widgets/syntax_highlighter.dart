import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';

class SyntaxHighlighter extends StatelessWidget {
  final String code;

  const SyntaxHighlighter({required this.code, super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.secondary,
          height: 1.45,
        ),
        children: _parseCode(code),
      ),
    );
  }

  List<TextSpan> _parseCode(String code) {
    List<TextSpan> spans = [];
    List<String> lines = code.split('\n');
    Map<String, int> wordCount = {};

    // First pass: count word occurrences
    for (String line in lines) {
      if (line.trim().startsWith('//') || line.trim().startsWith('/*'))
        continue;
      List<String> tokens = _tokenize(line);
      for (String token in tokens) {
        if (token.isEmpty ||
            _isOperator(token) ||
            _isString(token) ||
            _isNumber(token))
          continue;
        wordCount[token] = (wordCount[token] ?? 0) + 1;
      }
    }

    // Second pass: highlight code
    for (String line in lines) {
      // Handle comments
      if (line.trim().startsWith('//')) {
        spans.add(
          TextSpan(
            text: '$line\n',
            style: TextStyle(color: AppColors.secondary.withOpacity(0.5)),
          ),
        );
        continue;
      }

      // Handle multi-line comments
      if (line.trim().startsWith('/*')) {
        spans.add(
          TextSpan(
            text: '$line\n',
            style: TextStyle(color: AppColors.secondary.withOpacity(0.5)),
          ),
        );
        continue;
      }

      // Split line into tokens
      List<String> tokens = _tokenize(line);

      for (String token in tokens) {
        if (token.isEmpty) continue;

        // Keywords
        if (_isKeyword(token)) {
          spans.add(
            TextSpan(text: token, style: TextStyle(color: AppColors.indigo)),
          );
          continue;
        }

        // Types
        if (_isType(token)) {
          spans.add(
            TextSpan(text: token, style: TextStyle(color: AppColors.teal)),
          );
          continue;
        }

        // Strings
        if (_isString(token)) {
          spans.add(
            TextSpan(text: token, style: TextStyle(color: AppColors.pink)),
          );
          continue;
        }

        // Numbers
        if (_isNumber(token)) {
          spans.add(
            TextSpan(text: token, style: TextStyle(color: AppColors.teal)),
          );
          continue;
        }

        // Operators and symbols
        if (_isOperator(token)) {
          spans.add(
            TextSpan(text: token, style: TextStyle(color: AppColors.stroke2)),
          );
          continue;
        }

        // Repeated words
        if (wordCount[token] != null && wordCount[token]! > 1) {
          spans.add(
            TextSpan(text: token, style: TextStyle(color: AppColors.teal2)),
          );
          continue;
        }

        // Default text
        spans.add(
          TextSpan(text: token, style: TextStyle(color: AppColors.secondary)),
        );
      }

      // Add newline
      spans.add(TextSpan(text: '\n'));
    }

    return spans;
  }

  List<String> _tokenize(String line) {
    List<String> tokens = [];
    String currentToken = '';
    bool inString = false;
    String stringChar = '';

    for (int i = 0; i < line.length; i++) {
      String char = line[i];

      // Handle strings
      if ((char == '"' || char == "'") && (i == 0 || line[i - 1] != '\\')) {
        if (!inString) {
          if (currentToken.isNotEmpty) {
            tokens.add(currentToken);
            currentToken = '';
          }
          inString = true;
          stringChar = char;
        } else if (char == stringChar) {
          inString = false;
          currentToken += char;
          tokens.add(currentToken);
          currentToken = '';
          continue;
        }
      }

      // Handle operators and symbols
      if (!inString && _isOperator(char)) {
        if (currentToken.isNotEmpty) {
          tokens.add(currentToken);
          currentToken = '';
        }
        tokens.add(char);
        continue;
      }

      // Handle whitespace
      if (!inString && char == ' ') {
        if (currentToken.isNotEmpty) {
          tokens.add(currentToken);
          currentToken = '';
        }
        tokens.add(' ');
        continue;
      }

      currentToken += char;
    }

    if (currentToken.isNotEmpty) {
      tokens.add(currentToken);
    }

    return tokens;
  }

  bool _isKeyword(String token) {
    final keywords = {
      'class',
      'const',
      'final',
      'void',
      'var',
      'String',
      'int',
      'double',
      'bool',
      'if',
      'else',
      'for',
      'while',
      'try',
      'catch',
      'async',
      'await',
      'import',
      'export',
      'return',
      'extends',
      'super',
      'this',
      'static',
      'abstract',
      'interface',
      'implements',
      'enum',
      'switch',
      'case',
      'default',
      'break',
      'continue',
      'throw',
      'new',
      'null',
    };
    return keywords.contains(token);
  }

  bool _isType(String token) {
    final types = {
      'Widget',
      'Text',
      'Container',
      'Column',
      'Row',
      'Scaffold',
      'State',
      'BuildContext',
      'SizedBox',
      'Expanded',
      'MaterialPageRoute',
      'Future',
      'StatelessWidget',
      'StatefulWidget',
      'Key',
      'GlobalKey',
      'Navigator',
      'ThemeData',
      'Color',
      'Colors',
      'EdgeInsets',
      'BoxDecoration',
      'BorderRadius',
      'Alignment',
      'MainAxisAlignment',
      'CrossAxisAlignment',
      'List',
      'where',
      'toList',
      'length',
      'print',
    };
    return types.contains(token);
  }

  bool _isString(String token) {
    return (token.startsWith('"') && token.endsWith('"')) ||
        (token.startsWith("'") && token.endsWith("'"));
  }

  bool _isNumber(String token) {
    return RegExp(r'^\d+(\.\d+)?$').hasMatch(token);
  }

  bool _isOperator(String token) {
    return RegExp(
      r'[\(\)\{\}\[\]\,\.\:\;\=\+\-\*\/\%\!\&\|\<\>\^]',
    ).hasMatch(token);
  }
}
