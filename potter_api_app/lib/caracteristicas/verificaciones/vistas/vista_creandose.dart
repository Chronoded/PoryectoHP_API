import 'package:flutter/material.dart';

class VistaEnCreacion extends StatelessWidget {
  const VistaEnCreacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 60,
        height: 60,
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}