part of './../moon_kit.dart';

class MoonDialog extends StatelessWidget {
  const MoonDialog(
      {Key? key,
      required this.title,
      this.content,
      this.action,
      this.width,
      this.height,
      this.fullWidth = false})
      : super(key: key);

  final String title;
  final Widget? content;
  final List<Widget>? action;
  final bool? fullWidth;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Dialog(
      insetPadding:
          Responsive.isDesktop(context) ? null : const EdgeInsets.all(0),
      child: Container(
        height: Responsive.isDesktop(context)
            ? fullWidth!
                ? _size.height
                : height ?? _size.height * 0.50
            : _size.height,
        width: Responsive.isDesktop(context)
            ? fullWidth!
                ? _size.width
                : height ?? _size.width * 0.25
            : _size.width,
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87),
                  ),
                  Ink(
                    decoration: const ShapeDecoration(
                      color: Color.fromARGB(255, 244, 240, 240),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      splashRadius: 23,
                      icon: const Icon(Icons.close_outlined),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
              const Divider(),
              content!,
              if (action != null) ...[
                Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: action!,
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
