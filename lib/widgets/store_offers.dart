import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import '../widgets/offer_card.dart';

import '../providers/brand_info_provider.dart';
import '../models/offer.dart';

class StoreOffers extends StatelessWidget {
  const StoreOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Offer> offers = Provider.of<BrandInfo>(context).brandOffers;
    final iconLink = Provider.of<BrandInfo>(context).iconLink;
    return Expanded(
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
        decoration: BoxDecoration(
          color:
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.25),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => {},
                  child: Text(
                    'Offers',
                    style: lightTheme.textTheme.button
                        ?.copyWith(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () => {},
                  child: Text(
                    'Expiring Soon',
                    style: lightTheme.textTheme.button
                        ?.copyWith(color: neutralSwatch.shade400),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 125,
                  height: 30,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      value: 'Relevance',
                      icon: const Icon(Icons.keyboard_arrow_down),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      elevation: 0,
                      style: lightTheme.textTheme.button
                          ?.copyWith(color: Colors.black),
                      onChanged: (String? newValue) => {},
                      items: <String>['Relevance', 'Expiration', 'Recieved']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: lightTheme.textTheme.button
                                ?.copyWith(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  ...offers.map((e) {
                    OfferCard element = OfferCard(
                      name: e.name,
                      value: e.value,
                      description: e.description,
                      iconLink: iconLink,
                    );
                    return element;
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
