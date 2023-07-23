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
    arFont = Font.ttf(await rootBundle.load("assets/fonts/Cairo-Bold.ttf"));
  }

  static createPdf(List<McqQuestion> questions, String questionsType) async {
    final doc = pw.Document();
    doc.addPage(
      _createPage(questions, questionsType),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => doc.save(),
    );
  }

  static Page _createPage(List<McqQuestion> questions, String questionsType) {
    return Page(
      textDirection: TextDirection.rtl,
      theme: ThemeData.withFont(
        base: arFont,
      ),
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        if (questionsType == "choose") {
          return _buildChoosingQuistionPage(questions);
        } else if (questionsType == "fill_gabs") {
          return _buildFillGabsQuistionPage(questions);
        } else {
          return _buildTrueFalseQuistionPage(questions);
        }
      },
    );
  }
}

Column _buildChoosingQuistionPage(
  List<McqQuestion> questions,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(" الصفحه  رقم  1", style: const TextStyle(fontSize: 25)),
      Text(
        "إختر  الأجابه  الصحيحه",
        style: const TextStyle(fontSize: 25),
      ),
      Divider(),
      Divider(),
      Column(
        children: questions.map((e) {
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
              Text(
                "س:${e.question}",
                style: const TextStyle(fontSize: 20),
              ),
              Divider(),
              Column(
                children: choices
                    .map(
                      (choice) => Text(
                        "ج:$choice",
                        style: TextStyle(
                          fontSize: 18,
                          color: PdfColors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          );
        }).toList(),
      )
    ],
  );
}

Column _buildFillGabsQuistionPage(List<McqQuestion> questions) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(" الصفحه  رقم  1", style: const TextStyle(fontSize: 25)),
      Text(
        "أكمل",
        style: const TextStyle(fontSize: 25),
      ),
      Divider(),
      Divider(),
      Column(
        children: questions.map((e) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "س:${e.question}",
                style: const TextStyle(fontSize: 20),
              ),
              Divider(),
            ],
          );
        }).toList(),
      )
    ],
  );
}

Column _buildTrueFalseQuistionPage(List<McqQuestion> questions) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(" الصفحه  رقم  1", style: const TextStyle(fontSize: 25)),
      Text(
        "صح ام خطأ",
        style: const TextStyle(fontSize: 25),
      ),
      Divider(),
      Divider(),
      Column(
        children: questions.map((e) {
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
                    "س:${e.question}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              )
            ],
          );
        }).toList(),
      )
    ],
  );
}
