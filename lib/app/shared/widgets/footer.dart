import 'package:flutter/material.dart';
import 'package:tally_counter/app/shared/utils/global_constants.dart';

class WowlsFooter extends StatelessWidget {
  final Color? backgroundColor;
  final Alignment alignment;
  final EdgeInsetsGeometry padding;
  final Widget? child;

  const WowlsFooter({
    Key? key,
    this.backgroundColor,
    this.alignment = Alignment.center,
    this.padding = const EdgeInsets.all(5.0),
    this.child,
  }) : super(key: key);

  List<Widget> buildChildren() {
    return [
      const Text(
        'Powered by Jictyvoo\nDeveloped with Flutter',
        softWrap: true,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        textAlign: TextAlign.center,
      ),
      Text(
        '${GlobalConstants.legalese}\nAll rights reserved',
        strutStyle: const StrutStyle(fontWeight: FontWeight.w300),
        textAlign: TextAlign.center,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Align(
        alignment: alignment,
        child: Padding(
          padding: padding,
          child: child ??
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceEvenly,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: buildChildren(),
              ),
        ),
      ),
    );
  }
}
