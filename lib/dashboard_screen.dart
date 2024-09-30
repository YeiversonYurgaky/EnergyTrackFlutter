import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DashboardScreen extends StatefulWidget {
  final String classroomName;
  final String powerBiUrl; // Nueva propiedad para la URL

  DashboardScreen({required this.classroomName, required this.powerBiUrl});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // Inicializa el controlador del WebView con la URL correspondiente
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString('''
 <html>
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
              body, html {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;
              }
              iframe {
                width: 100%;
                height: 100%;
                border: none;
              }
            </style>
          </head>
          <body>
            <iframe title="${widget.classroomName}" src="${widget.powerBiUrl}" frameborder="0" allowFullScreen="true"></iframe>      
          </body>
''');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard ${widget.classroomName}'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
