part of layouts;

class PullToRefresh extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const PullToRefresh({
    @required this.child,
    @required this.fadeOnBuild,
    @required this.onRefresh,
    @required this.indicatorColor,
    this.fadingMilliseconds = 700,
    this.displacement = 50,
    this.strokeWidth = 4,
    this.edgeOffset = 50,
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final Function onRefresh;
  final bool fadeOnBuild;
  final Widget child;
  final Color indicatorColor;
  final int fadingMilliseconds;
  final double displacement;
  final double strokeWidth;
  final double edgeOffset;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
        onRefresh: onRefresh,
        color: const Color.fromARGB(230, 0, 0, 0),
        backgroundColor: indicatorColor,
        displacement: displacement,
        strokeWidth: strokeWidth,
        edgeOffset: edgeOffset,
        // notificationPredicate: (ScrollNotification scrollNotification){
        // blog('scrollNotification.metrics.pixels : ${scrollNotification.metrics.pixels}');
        // blog('scrollNotification.depth : ${scrollNotification.depth}');
        //   return true;
        // },
        // triggerMode: RefreshIndicatorTriggerMode.onEdge,
        child:

        fadeOnBuild == true ?
        WidgetFader(
          fadeType: FadeType.fadeIn,
          duration: Duration(milliseconds: fadingMilliseconds),
          child: child,
        )
            :
        child

    );

  }
/// --------------------------------------------------------------------------
}
