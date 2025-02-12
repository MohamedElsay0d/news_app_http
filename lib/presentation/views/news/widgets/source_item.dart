import 'package:flutter/material.dart';

import '../../../../data/model/soureces_response/source.dart';

class SourceItem extends StatelessWidget {
  SourceItem({super.key, required this.isSelected, required this.source});
  Source source;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
        source.name ?? "Unknown",
        maxLines: 1,
        style: isSelected ? textTheme.titleSmall : textTheme.bodyLarge);
  }
}
