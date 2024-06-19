import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edge_widget.dart';

class EPrimaryHeaderContainer extends StatelessWidget {
  const EPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ECurvedEdgeWidget(
      child: SizedBox(
        child: Container(
          color: EColors.thirdColor,
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: [
               child
            ],
          ),
        ),
      ),
    );
  }
}
