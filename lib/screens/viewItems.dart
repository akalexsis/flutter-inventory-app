import 'package:flutter/material.dart';

class ViewItem extends StatefulWidget {
    const ViewItem({super.key});

    @override
    State<ViewItem> createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Text('View Item');
        );
    }
}