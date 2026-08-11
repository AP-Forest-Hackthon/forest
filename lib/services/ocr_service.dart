import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class OcrService {
  final TextRecognizer _recognizer = TextRecognizer(
    script: TextRecognitionScript.latin,
  );

  /// Extract text from an image file using Google ML Kit.
  Future<String> extractTextFromImage(File imageFile) async {
    try {
      final inputImage = InputImage.fromFile(imageFile);
      final recognized = await _recognizer.processImage(inputImage);
      return recognized.text;
    } catch (e) {
      throw Exception('Image OCR failed: $e');
    }
  }

  /// Extract text from a PDF file using Syncfusion PDF wrapper (runs in background).
  Future<String> extractTextFromPdfBytes(Uint8List bytes) async {
    try {
      // Process in a separate isolate
      return await compute(_extractPdfBackground, bytes);
    } catch (e) {
      throw Exception('PDF extraction failed: $e');
    }
  }

  /// Close the recognizer when done.
  void dispose() {
    _recognizer.close();
  }
}

// ── Top-level function for Isolate processing ───────────────────────────────
String _extractPdfBackground(Uint8List bytes) {
  final document = PdfDocument(inputBytes: bytes);
  final extractor = PdfTextExtractor(document);

  // Extract all pages without any limit
  final text = extractor.extractText();
  document.dispose();

  if (text.trim().isEmpty) {
    throw Exception("No selectable text found! This looks like an image-only PDF.");
  }

  return text;
}

