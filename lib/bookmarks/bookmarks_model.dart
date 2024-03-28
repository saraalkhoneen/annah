import '/flutter_flow/flutter_flow_util.dart';
import 'bookmarks_widget.dart' show BookmarksWidget;
import 'package:flutter/material.dart';

class BookmarksModel extends FlutterFlowModel<BookmarksWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
