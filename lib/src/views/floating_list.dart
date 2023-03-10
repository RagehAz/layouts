part of layouts;

class FloatingList extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const FloatingList({
    @required this.columnChildren,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.scrollDirection = Axis.vertical,
    this.padding = EdgeInsets.zero,
    this.width,
    this.height,
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final List<Widget> columnChildren;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Axis scrollDirection;
  final EdgeInsets padding;
  final double width;
  final double height;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: scrollDirection,
      child: Container(
        width: width ?? Scale.screenWidth(context),
        constraints: BoxConstraints(
          minHeight: height ?? Scale.screenHeight(context),
        ),
        alignment: Alignment.center,
        padding: padding,
        child:
        scrollDirection == Axis.vertical ?
        Column(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: <Widget>[
            ...?columnChildren,
          ],
        )

            :

        Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: <Widget>[
            ...?columnChildren,
          ],
        )
      ),
    );
    // --------------------
  }
/// --------------------------------------------------------------------------
}
