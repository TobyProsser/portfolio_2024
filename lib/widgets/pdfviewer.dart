import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class PDFViewer extends StatefulWidget {
  final String? url;
  final bool isFullScreen;
  final VoidCallback onToggleFullScreen;

  const PDFViewer({
    Key? key,
    this.url,
    this.isFullScreen = false,
    required this.onToggleFullScreen,
  }) : super(key: key);

  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  @override
  void initState() {
    super.initState();

    if (widget.url != null) {
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        'pdf-viewer',
        (int viewId) => html.IFrameElement()
          ..src = widget.url
          ..style.border = 'none',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isFullScreen
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.close),
                onPressed: widget.onToggleFullScreen,
              ),
            )
          : null,
      body: Stack(
        children: [
          widget.url != null
              ? HtmlElementView(viewType: 'pdf-viewer')
              : Center(child: Text('No PDF URL provided')),
          if (!widget.isFullScreen)
            Positioned(
              bottom: 10,
              right: 10,
              child: PointerInterceptor(
                child: FloatingActionButton(
                  child: Icon(Icons.fullscreen),
                  onPressed: widget.onToggleFullScreen,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  elevation: 3,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
