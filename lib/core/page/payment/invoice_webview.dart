import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:webcontent_converter/webcontent_converter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InvoiceWebView extends StatefulWidget {
  final int invoiceId;
  const InvoiceWebView({Key? key, required this.invoiceId}) : super(key: key);

  @override
  State<InvoiceWebView> createState() => _InvoiceWebViewState();
}

class _InvoiceWebViewState extends State<InvoiceWebView> {
  WebViewController? ctrl;

  @override
  void initState() {
    super.initState();
    SunmiPrinter.bindingPrinter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl:
            'https://test.6o9.live/api/Incoice/SellInvoice/${widget.invoiceId}',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (c) {
          ctrl = c;
        },
        onPageFinished: (c) async {
          Uint8List? webConv;
          String html = await ctrl!.runJavascriptReturningResult(
              "encodeURIComponent(document.documentElement.outerHTML)");
          html = Uri.decodeComponent(html);
          html = html.substring(1, html.length - 1);
          webConv = await WebcontentConverter.contentToImage(
            content: html,
          );
          await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
          await SunmiPrinter.startTransactionPrint(true);
          await SunmiPrinter.printImage(webConv);
          await SunmiPrinter.lineWrap(1);
          await SunmiPrinter.exitTransactionPrint(true);
          await SunmiPrinter.cut();
        },
      ),
    );
  }
}
