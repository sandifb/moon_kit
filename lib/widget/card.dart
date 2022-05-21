part of './../moon_kit.dart';

class MoonCard extends StatelessWidget {
  const MoonCard(
      {Key? key,
      this.content,
      this.title,
      this.subTitle,
      this.action,
      this.headerLine = true,
      this.contentPadding = true})
      : super(key: key);

  final Widget? content;
  final String? title;
  final String? subTitle;
  final bool? contentPadding;
  final bool? headerLine;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Card(
        borderOnForeground: false,
        // elevation: 5,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Color.fromARGB(255, 223, 220, 220), width: 0.4),
            borderRadius: BorderRadius.circular(4.0)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (title != null || subTitle != null || action != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          title!,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                    if (subTitle != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          subTitle!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ],
                ),
                if (action != null) ...[
                  Padding(
                      padding: const EdgeInsets.only(right: 15, top: 12),
                      child: action!),
                ],
              ],
            ),
            if (headerLine!) ...[
              Container(
                margin: const EdgeInsets.only(top: 10),
                foregroundDecoration: const BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 223, 220, 220)),
                  ),
                ),
              )
            ]
          ],
          if (content != null) ...[
            Padding(
              padding: EdgeInsets.only(
                  top: title != null || subTitle != null || action != null
                      ? contentPadding == false
                          ? 0
                          : 10
                      : 15,
                  bottom: 15,
                  left: contentPadding! ? 15 : 1,
                  right: contentPadding! ? 15 : 1),
              child: content!,
            ),
          ],
        ]));
  }
}
