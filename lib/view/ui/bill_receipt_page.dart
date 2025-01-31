import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
class BillReceiptPage extends StatelessWidget {
  const BillReceiptPage({super.key});

  void _generateAndPrintReceipt() async {
    final pdf = pw.Document();

    // Add a page to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Store Name', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 10),
                pw.Text('Address: 123 Main Street, City, Country'),
                pw.Text('Phone: +123 456 789'),
                pw.Divider(),
                pw.Text('Receipt No: #12345', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 20),
                pw.Text('Date: ${DateTime.now().toString()}'),
                pw.SizedBox(height: 20),
                pw.Text('Items Purchased:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Item 1', style: const pw.TextStyle(fontSize: 16)),
                    pw.Text('\$10.00', style: const pw.TextStyle(fontSize: 16)),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Item 2', style: const pw.TextStyle(fontSize: 16)),
                    pw.Text('\$20.00', style: const pw.TextStyle(fontSize: 16)),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Divider(),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Total:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                    pw.Text('\$30.00', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Text('Thank you for your purchase!', style: pw.TextStyle(fontSize: 16, fontStyle: pw.FontStyle.italic)),
                pw.SizedBox(height: 20),
                pw.Text('For any queries, contact support@store.com', style: const pw.TextStyle(fontSize: 14)),
              ],
            ),
          );
        },
      ),
    );

    // Printing the PDF
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Receipt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Bill Receipt Sample', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Store Name: Example Store', style: TextStyle(fontSize: 16)),
            const Text('Date: 2024-12-17', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Text('Items Purchased:', style: TextStyle(fontSize: 16)),
            const Text('Item 1: \$10.00', style: TextStyle(fontSize: 16)),
            const Text('Item 2: \$20.00', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Text('Total: \$30.00', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Spacer(),
            ElevatedButton(
              onPressed: _generateAndPrintReceipt,
              child: const Text('Print Receipt'),
            ),
          ],
        ),
      ),
    );
  }
}