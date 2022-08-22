import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import '../widgets/title_appbar.dart';

import '../providers/brand_info_provider.dart';

class StoreTitle extends StatelessWidget {
  const StoreTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: TitleAppBar(
        title: Provider.of<BrandInfo>(context).name,
        hasBackButton: true,
        colors: [Colors.black, neutralSwatch.shade400],
      ),
    );
  }
}
