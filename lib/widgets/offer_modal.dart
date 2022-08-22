import 'package:flutter/material.dart';
import '../theme.dart';

class OfferModal extends StatelessWidget {
  const OfferModal({
    Key? key,
    this.isOnline = false,
    this.name,
    this.description,
    this.value,
    this.iconLink,
  }) : super(key: key);

  final bool isOnline;
  final String? name;
  final String? description;
  final String? value;
  final String? iconLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite / 2,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150),
            child: Divider(
              thickness: 4,
              color: primarySwatch.shade100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: neutralSwatch.shade200,
                        ),
                      ),
                      child: Image.network(
                        (iconLink != null)
                            ? iconLink as String
                            : 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Uber_logo_2018.png/320px-Uber_logo_2018.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (value != null)
                                  ? (value as String).toUpperCase()
                                  : "50% off".toUpperCase(),
                              style: lightTheme.textTheme.headline6?.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              (name != null)
                                  ? (name as String)
                                  : "on Uber Rides",
                              style: lightTheme.textTheme.caption?.copyWith(
                                color: neutralSwatch.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isOnline)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: Colors.black.withOpacity(0.08),
                        ),
                        padding: const EdgeInsets.fromLTRB(11, 6, 11, 6),
                        margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                        child: Text(
                          'Online',
                          style: lightTheme.textTheme.overline?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      )
                    else
                      Container(
                        height: 38,
                        width: 38,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/qr_code.png',
                              fit: BoxFit.cover,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
                const Padding(padding: EdgeInsets.all(20)),
                Text(
                  (description != null)
                      ? (description as String)
                      : "50% Off on Uber Rides...",
                  style: lightTheme.textTheme.headline6?.copyWith(
                    color: Colors.black,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8)),
                Text(
                  (description != null)
                      ? (description as String)
                      : 'Get 50% off on Uber rides for two months and more...',
                  style: lightTheme.textTheme.caption?.copyWith(
                    color: neutralSwatch.shade400,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Expires in N days",
                        style: lightTheme.textTheme.button,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Copy Coupon Code",
                      style: lightTheme.textTheme.button
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Close",
                      style: lightTheme.textTheme.button
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
        ],
      ),
    );
  }
}
