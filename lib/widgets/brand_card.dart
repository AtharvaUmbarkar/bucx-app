import 'package:bucx_app/screens/store_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

import 'package:provider/provider.dart';
import '../providers/brand_info_provider.dart';
import '../providers/brand_list_provider.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    Key? key,
    this.isBlack = false,
    this.qrVisible = false,
    this.multiplier = 1,
    this.textMultiplier = 1,
    this.width = double.maxFinite,
    this.height = 192,
    this.showDetails = true,
    this.brandName = "dummy",
    this.brandId = "dummy-id",
    required this.bgColor,
  }) : super(key: key);

  final bool isBlack;
  final bool qrVisible;
  final Color bgColor;
  final double multiplier;
  final double textMultiplier;
  final double width;
  final double height;
  final bool showDetails;
  final String brandName;
  final String brandId;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipper: ShadowClipper(),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0, 10),
              blurRadius: 30,
            ),
          ],
        ),
        padding: EdgeInsets.fromLTRB(
            27 * multiplier, 27 * multiplier, 27 * multiplier, 13 * multiplier),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  brandName.toUpperCase(),
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w900,
                    fontSize: 28 * textMultiplier,
                    letterSpacing: 2 * textMultiplier,
                    color: isBlack ? Colors.black : Colors.white,
                  ),
                ),
                if (qrVisible)
                  Container(
                    height: 38 * textMultiplier,
                    width: 38 * textMultiplier,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isBlack
                          ? Colors.white.withOpacity(0.1)
                          : Colors.black.withOpacity(0.02),
                    ),
                    child: Center(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/qr_code.png',
                          fit: BoxFit.cover,
                          color: isBlack ? Colors.black : null,
                          colorBlendMode: isBlack ? BlendMode.difference : null,
                        ),
                      ),
                    ),
                  )
                else
                  SizedBox(
                    height: 38 * textMultiplier,
                    width: 38 * textMultiplier,
                  )
              ],
            ),
            Container(
              height: 28 * textMultiplier,
              margin: EdgeInsets.symmetric(vertical: 3 * multiplier),
              child: showDetails
                  ? ElevatedButton(
                      onPressed: () {
                        Provider.of<BrandInfo>(
                          context,
                          listen: false,
                        ).setActiveBrand(brandName, brandId);
                        Provider.of<BrandList>(
                          context,
                          listen: false,
                        ).switchActiveItem(brandName, brandId);
                        Provider.of<BrandInfo>(
                          context,
                          listen: false,
                        ).fetchActiveBrand();
                        Navigator.of(context)
                            .pushNamed(StoreProfileScreen.routeName);
                      },
                      style: TextButton.styleFrom(
                        elevation: 0,
                        backgroundColor: isBlack ? Colors.white : Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15 * multiplier),
                      ),
                      child: Text(
                        'Details',
                        style: lightTheme.textTheme.overline?.copyWith(
                          color: isBlack ? Colors.black : Colors.white,
                          fontSize: 11 * textMultiplier,
                          height: 16 * textMultiplier / 11,
                        ),
                      ),
                    )
                  : Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Reward Points',
                  style: lightTheme.textTheme.bodyText2?.copyWith(
                    color: isBlack ? Colors.black : Colors.white,
                    fontSize: 12 * textMultiplier,
                    height: 18 * textMultiplier / 12,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 13 * multiplier),
                  child: Text(
                    'Green Level',
                    style: lightTheme.textTheme.bodyText2?.copyWith(
                      color: isBlack ? Colors.black : Colors.white,
                      fontSize: 12 * textMultiplier,
                      height: 18 * textMultiplier / 12,
                    ),
                  ),
                ),
                Text(
                  '35/100',
                  style: lightTheme.textTheme.headline1?.copyWith(
                    color: isBlack ? Colors.black : Colors.white,
                    fontSize: 40 * textMultiplier,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ShadowClipper extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    return RRect.fromLTRBAndCorners(
      0,
      -30,
      size.width,
      size.height,
      bottomLeft: const Radius.circular(13),
      bottomRight: const Radius.circular(13),
    );
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) {
    return false;
  }
}
