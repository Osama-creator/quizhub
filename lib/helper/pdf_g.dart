// ignore_for_file: avoid_classes_with_only_static_members, type_annotate_public_apis, always_declare_return_types
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:quizhub/app/models/questions.dart';

class PdfGenerator {
  static late Font arFont;

  static init() async {
    arFont = Font.ttf(
      await rootBundle.load("assets/fonts/NotoNaskhArabic-Bold.ttf"),
    );
  }

  static createPdf(List<McqQuestion> questions, String questionsType) async {
    final doc = pw.Document();
    final int questionsPerPage = (questionsType == "choose") ? 4 : 14;

    for (int i = 0; i < questions.length; i += questionsPerPage) {
      final startIndex = i;
      final endIndex = (i + questionsPerPage < questions.length)
          ? i + questionsPerPage
          : questions.length;

      doc.addPage(
        _createPage(
          questions.sublist(startIndex, endIndex),
          questionsType,
          i ~/ questionsPerPage + 1,
        ),
      );
    }

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => doc.save(),
    );
  }

  static Page _createPage(
    List<McqQuestion> questions,
    String questionsType,
    int pageNumber,
  ) {
    return Page(
      textDirection: TextDirection.rtl,
      theme: ThemeData.withFont(
        base: arFont,
      ),
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        if (questionsType == "choose") {
          return _buildChoosingQuistionPage(questions, pageNumber);
        } else if (questionsType == "fill_gabs") {
          return _buildFillGabsQuistionPage(questions, pageNumber);
        } else {
          return _buildTrueFalseQuistionPage(questions, pageNumber);
        }
      },
    );
  }
}

Column _buildChoosingQuistionPage(List<McqQuestion> questions, int pageNumber) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(" الصفحه  رقم  $pageNumber", style: const TextStyle(fontSize: 17)),
      Text(
        "إختر  الأجابه  الصحيحه",
        style: const TextStyle(fontSize: 20),
      ),
      Divider(),
      Divider(),
      Column(
        children: questions.asMap().entries.map((entry) {
          final int index = entry.key;
          final McqQuestion e = entry.value;
          List<String> choices = [
            e.wrongAns3!,
            e.wrongAns2!,
            e.wrongAns1!,
            e.rightAnswer
          ];
          choices.shuffle();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Divider(indent: 20, endIndent: 20),
              Text(
                "${index + 1}: ${e.question}",
                style: const TextStyle(fontSize: 17),
              ),
              Divider(indent: 20, endIndent: 20),
              Column(
                children: choices.asMap().entries.map((entry) {
                  final int answerIndex = entry.key;
                  final String choice = entry.value;

                  return Text(
                    "${answerIndex + 1}: $choice",
                    style: TextStyle(
                      fontSize: 13,
                      color: PdfColors.grey800,
                      fontWeight: FontWeight.normal,
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        }).toList(),
      )
    ],
  );
}

Column _buildFillGabsQuistionPage(List<McqQuestion> questions, int pageNumber) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(" الصفحه  رقم  $pageNumber", style: const TextStyle(fontSize: 20)),
      Text(
        "أكمل",
        style: const TextStyle(fontSize: 20),
      ),
      Divider(),
      Column(
        children: questions.asMap().entries.map((entry) {
          final int index = entry.key;
          final McqQuestion e = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${index + 1}: ${e.question}",
                style: const TextStyle(fontSize: 17),
              ),
              Divider(),
            ],
          );
        }).toList(),
      )
    ],
  );
}

Column _buildTrueFalseQuistionPage(
  List<McqQuestion> questions,
  int pageNumber,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(" الصفحه  رقم  $pageNumber", style: const TextStyle(fontSize: 20)),
      Text(
        "صح ام خطأ",
        style: const TextStyle(fontSize: 20),
      ),
      Divider(),
      Divider(),
      Column(
        children: questions.asMap().entries.map((entry) {
          final int index = entry.key;
          final McqQuestion e = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    "(   )",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Text(
                    "${index + 1}: ${e.question}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          );
        }).toList(),
      )
    ],
  );
}
