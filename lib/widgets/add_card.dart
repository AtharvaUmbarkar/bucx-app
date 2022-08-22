import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../theme.dart';

class AddCardWidget extends StatelessWidget {
  const AddCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Align(
        alignment: Alignment.topCenter,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          dashPattern: const [10, 5, 10, 5, 10, 5],
          strokeWidth: 1,
          color: neutralVariantSwatch.shade500,
          child: Container(
            width: constraints.maxWidth - 6,
            height: 192,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              // border: Border.all(),
              borderRadius: BorderRadius.circular(10),
              color: neutralSwatch.shade50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  maxRadius: 19,
                  backgroundColor: lightTheme.colorScheme.primary,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 22,
                    onPressed: () => {},
                    icon: const Icon(Icons.add),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  child: Text(
                    'Add card',
                    style: lightTheme.textTheme.subtitle1,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
