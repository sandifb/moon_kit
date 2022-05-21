part of './../moon_kit.dart';

class MoonButton extends StatelessWidget {
  final String? text;
  final String? variant;
  final String? size;
  final String? color;
  final Color? customColor;
  final Color? textColor;
  final IconData? startIcon;
  final IconData? endIcon;
  final bool? fullWidth;
  final bool? disabled;
  final bool? hideTextMobile;
  final bool? isLoading;
  final Function()? onPressed;

  const MoonButton(
      {Key? key,
      this.onPressed,
      this.text,
      this.size = 'md',
      this.startIcon,
      this.fullWidth = false,
      this.hideTextMobile = false,
      this.disabled = false,
      this.isLoading = false,
      this.endIcon,
      this.variant,
      this.color,
      this.customColor,
      this.textColor = Colors.amber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borerRadius = 9.0;
    const primary = Colors.orange;

    Widget buildText(String text, Color color) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Text(text,
            style: TextStyle(fontWeight: FontWeight.w400, color: color)),
      );
    }

    getIconSize(String? size) {
      switch (size) {
        case 'sm':
          return 17.0;
        case 'md':
          return 23.0;
        case 'lg':
          return 27.0;
        default:
          return 23.0;
      }
    }

    Widget buildStartIcon(
        IconData? startIcon, Color color, String size, bool hideTextMobile) {
      return Container(
        margin: EdgeInsets.only(right: hideTextMobile ? 0 : 3),
        child: Icon(
          startIcon,
          color: color,
          size: getIconSize(size),
        ),
      );
    }

    Widget buildEndIcon(IconData? startIcon, Color color) {
      return Container(
        margin: const EdgeInsets.only(left: 3),
        child: Icon(
          startIcon,
          color: color,
          size: getIconSize(size),
        ),
      );
    }

    buildColor(String? color, bool isMoon) {
      switch (color) {
        case 'success':
          return isMoon == true ? lighten(Colors.green, .4) : Colors.green;
        case 'info':
          return isMoon == true ? lighten(Colors.blue, .5) : Colors.blue;
        case 'error':
          return isMoon == true ? lighten(Colors.red, .5) : Colors.red;
        case 'warning':
          return isMoon == true ? lighten(Colors.orange, .5) : Colors.orange;
        default:
          return isMoon == true ? lighten(Colors.blue, .5) : Colors.blue;
      }
    }

    getHeight(String? size) {
      switch (size) {
        case 'sm':
          return 30.0;
        case 'md':
          return 47.0;
        case 'lg':
          return 57.0;
        default:
          return 47.0;
      }
    }

    getWidth(bool? isFull) {
      if (isFull!) {
        return double.infinity;
      } else {
        return 0.0;
      }
    }

    switch (variant) {
      case 'text':
        return Container(
            margin: const EdgeInsets.only(right: 3),
            child: MaterialButton(
              minWidth: getWidth(fullWidth),
              height: getHeight(size),
              onPressed: disabled! ? null : onPressed,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borerRadius)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (startIcon != null) ...[
                    buildStartIcon(startIcon!, primary, size!, hideTextMobile!)
                  ],
                  if (text != null &&
                      (Responsive.isDesktop(context) ||
                          Responsive.isTablet(context))) ...[
                    buildText(text!, primary),
                  ] else if (text != null &&
                      Responsive.isMobile(context) &&
                      hideTextMobile == false) ...[
                    buildText(text!, primary),
                  ],
                  if (endIcon != null) ...[buildEndIcon(endIcon!, primary)],
                ],
              ),
            ));
      case 'line':
        return Container(
            margin: const EdgeInsets.only(left: 3),
            child: MaterialButton(
              minWidth: getWidth(fullWidth),
              height: getHeight(size),
              onPressed: isLoading! || disabled! ? null : onPressed,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: primary, width: 0.5, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(borerRadius)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (isLoading!) ...[
                    Container(
                      height: 15,
                      width: 15,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: primary,
                      ),
                    )
                  ],
                  if (startIcon != null) ...[
                    buildStartIcon(startIcon!, primary, size!, hideTextMobile!)
                  ],
                  if (text != null &&
                      (Responsive.isDesktop(context) ||
                          Responsive.isTablet(context))) ...[
                    buildText(text!, primary),
                  ] else if (text != null &&
                      Responsive.isMobile(context) &&
                      hideTextMobile == false) ...[
                    buildText(text!, primary),
                  ],
                  if (endIcon != null) ...[buildEndIcon(endIcon!, primary)],
                ],
              ),
            ));
      case 'moon':
        return Container(
            margin: const EdgeInsets.only(left: 3),
            child: MaterialButton(
              minWidth: getWidth(fullWidth),
              height: getHeight(size),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(borerRadius)),
              ),
              disabledColor: color != null
                  ? buildColor(color!, true)
                  : lighten(primary, .42),
              color: color != null
                  ? buildColor(color!, true)
                  : lighten(primary, .42),
              onPressed: isLoading! || isLoading! ? null : onPressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (isLoading!) ...[
                    Container(
                      height: 15,
                      width: 15,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: primary,
                      ),
                    )
                  ],
                  if (startIcon != null) ...[
                    buildStartIcon(startIcon!, primary, size!, hideTextMobile!)
                  ],
                  if (text != null &&
                      (Responsive.isDesktop(context) ||
                          Responsive.isTablet(context))) ...[
                    buildText(text!,
                        color != null ? buildColor(color!, false) : primary),
                  ] else if (text != null &&
                      Responsive.isMobile(context) &&
                      hideTextMobile == false) ...[
                    buildText(text!, primary),
                  ],
                  if (endIcon != null) ...[buildEndIcon(endIcon!, primary)],
                ],
              ),
            ));
      default:
        return Container(
            margin: const EdgeInsets.only(left: 3),
            child: MaterialButton(
              minWidth: getWidth(fullWidth),
              height: getHeight(size),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(borerRadius)),
              ),
              color: color != null ? buildColor(color!, false) : primary,
              disabledColor:
                  color != null ? buildColor(color!, false) : primary,
              onPressed: isLoading! || disabled! ? null : onPressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (isLoading!) ...[
                    Container(
                      height: 15,
                      width: 15,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  ],
                  if (startIcon != null) ...[
                    buildStartIcon(
                        startIcon!, Colors.white, size!, hideTextMobile!)
                  ],
                  if (text != null &&
                      (Responsive.isDesktop(context) ||
                          Responsive.isTablet(context))) ...[
                    buildText(text!, Colors.white),
                  ] else if (text != null &&
                      Responsive.isMobile(context) &&
                      hideTextMobile == false) ...[
                    buildText(text!, Colors.white),
                  ],
                  if (endIcon != null) ...[
                    buildEndIcon(endIcon!, Colors.white)
                  ],
                ],
              ),
            ));
    }
  }
}
