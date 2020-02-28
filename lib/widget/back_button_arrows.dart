import 'package:flutter/material.dart' hide Action;

class BackButtonIcon extends StatelessWidget {
  /// Creates an icon that shows the appropriate "back" image for
  /// the current platform (as obtained from the [Theme]).
  const BackButtonIcon({Key key}) : super(key: key);

  /// Returns the appropriate "back" icon for the given `platform`.
  static IconData _getIconData(TargetPlatform platform) {
    return Icons.arrow_back;
  }

  @override
  Widget build(BuildContext context) =>
      new Icon(_getIconData(Theme.of(context).platform));
}

class BackButtonArrows extends StatelessWidget {
  /// Creates an [IconButton] with the appropriate "back" icon for the current
  /// target platform.
  const BackButtonArrows({Key key, this.color}) : super(key: key);

  /// The color to use for the icon.
  ///
  /// Defaults to the [IconThemeData.color] specified in the ambient [IconTheme],
  /// which usually matches the ambient [Theme]'s [ThemeData.iconTheme].
  final Color color;

  @override
  Widget build(BuildContext context) {
    return new IconButton(
        icon: const BackButtonIcon(),
        color: color,
        tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        onPressed: () {
          Navigator.maybePop(context);
        });
  }
}
