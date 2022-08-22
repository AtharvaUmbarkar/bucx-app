import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './brand_card.dart';

import '../providers/brand_info_provider.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: BrandCard(
        bgColor: Colors.green,
        qrVisible: true,
        showDetails: false,
        brandName: Provider.of<BrandInfo>(context).name,
      ),
    );
  }
}
