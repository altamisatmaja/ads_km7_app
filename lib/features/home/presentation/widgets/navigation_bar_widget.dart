part of '../../home_injection.dart';

class ADSNavigationBar extends StatelessWidget {
  const ADSNavigationBar({
    super.key,
    this.selectedIndex = 0,
    required this.destinations,
    this.labelBehavior,
    this.height,
    this.elevation,
    this.indicatorColor,
    this.overlayColor,
    this.indicatorShape,
    this.onDestinationSelected,
  });

  final int selectedIndex;
  final List<Widget> destinations;
  final NavigationDestinationLabelBehavior? labelBehavior;
  final double? height;
  final double? elevation;
  final Color? indicatorColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final ShapeBorder? indicatorShape;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    NavigationBarTheme.of(context);

    return Material(
      color: ADSColor.primary,
      elevation: 0,
      child: SafeArea(
        child: SizedBox(
          height: 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(destinations.length, (index) {
              return Expanded(
                child: Center(
                  child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: destinations[index],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

// ignore: unused_element
class _ADSNavigationDestinationInfo extends InheritedWidget {
  const _ADSNavigationDestinationInfo({
    required this.index,
    required this.selectedIndex,
    required this.totalNumberOfDestinations,
    required this.labelBehavior,
    required this.indicatorColor,
    required this.indicatorShape,
    required this.onTap,
    required this.overlayColor,
    required super.child,
  });

  final int index;
  final int selectedIndex;
  final int totalNumberOfDestinations;
  final NavigationDestinationLabelBehavior labelBehavior;
  final Color? indicatorColor;
  final ShapeBorder? indicatorShape;
  final WidgetStateProperty<Color?>? overlayColor;
  final VoidCallback onTap;

  @override
  bool updateShouldNotify(_ADSNavigationDestinationInfo oldWidget) =>
      index != oldWidget.index ||
      totalNumberOfDestinations != oldWidget.totalNumberOfDestinations;
}

// ignore: unused_element
class _ADSNavigationBarDestinationTooltip extends StatelessWidget {
  const _ADSNavigationBarDestinationTooltip({
    required this.message,
    required this.child,
  });

  final String message;
  final Widget child;

  @override
  Widget build(BuildContext context) => Tooltip(
        message: message,
        excludeFromSemantics: true,
        preferBelow: true,
        child: child,
      );
}

// ignore: unused_element
class _ADSIndicatorInkWell extends InkResponse {
  const _ADSIndicatorInkWell({
    required this.iconKey,
    required this.labelBehavior,
  }) : super(
          containedInkWell: false,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        );

  final GlobalKey iconKey;
  final NavigationDestinationLabelBehavior labelBehavior;

  @override
  RectCallback? getRectCallback(RenderBox referenceBox) => () {
        final RenderBox iconBox =
            iconKey.currentContext!.findRenderObject()! as RenderBox;
        final Rect iconRect = iconBox.localToGlobal(Offset.zero) & iconBox.size;
        return referenceBox.globalToLocal(iconRect.topLeft) & iconBox.size;
      };
}
