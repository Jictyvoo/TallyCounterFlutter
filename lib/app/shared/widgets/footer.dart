import 'package:flutter/material.dart';

class WowlsFooter extends StatelessWidget {
  final Color? backgroundColor;
  final Alignment alignment;
  final EdgeInsetsGeometry padding;
  final Widget? child;
  final int _enterpriseBirthDate;

  const WowlsFooter({
    Key? key,
    this.backgroundColor,
    this.alignment = Alignment.center,
    this.padding = const EdgeInsets.all(5.0),
    this.child,
  })  : _enterpriseBirthDate = 2020,
        super(key: key);

  List<Widget> buildChildren() {
    return [
      const Text(
        'Powered by Jictyvoo\nDeveloped with Flutter',
        softWrap: true,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      Text(
        '© Wrapped Owls $_enterpriseBirthDate-${DateTime.now().year}'
        '\nAll rights reserved',
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
