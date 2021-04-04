import 'package:flutter/material.dart';

typedef Widget ThemedWidgetBuilder(BuildContext context, ThemeData data);

typedef ThemeData ThemeDataWithBrightnessBuilder(Brightness brightness);

class DynamicTheme extends StatefulWidget {
  final ThemedWidgetBuilder themedWidgetBuilder;

  final ThemeDataWithBrightnessBuilder data;

  final Brightness defaultBrightness;

  const DynamicTheme(
      {Key key, this.data, this.themedWidgetBuilder, this.defaultBrightness})
      : super(key: key);

  @override
  DynamicThemeState createState() => new DynamicThemeState();

  static DynamicThemeState of(BuildContext context) {
    return context.findAncestorRenderObjectOfType();
  }
}

class DynamicThemeState extends State<DynamicTheme> {
  ThemeData _data;

  Brightness _brightness = Brightness.light;

  bool loaded = false;

  get data => _data;

  get brightness => Brightness.light;

  @override
  void initState() {
    super.initState();
    _brightness = Brightness.light;
    _data = widget.data(_brightness);
    setState(() {
      _brightness = Brightness.light;
      _data = widget.data(_brightness);
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.themedWidgetBuilder(context, _data);
  }

  void setThemeData(ThemeData data) {
    setState(() {
      this._data = data;
    });
  }
}
