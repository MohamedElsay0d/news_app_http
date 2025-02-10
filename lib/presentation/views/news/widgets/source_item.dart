import 'package:flutter/material.dart';

import '../../../../data/model/source_model.dart';

class SourceItem extends StatelessWidget {
  SourceItem({super.key, required this.isSelected, required this.source});
  SourceModel source;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(source.name,
        maxLines: 1,
        style: isSelected ? textTheme.titleSmall : textTheme.bodyLarge);
  }
}
