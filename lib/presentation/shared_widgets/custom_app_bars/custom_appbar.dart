import 'package:auto_route/auto_route.dart';
import 'package:collaction_app/presentation/shared_widgets/return_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../themes/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext _context;
  final String title;
  final bool closable;
  const CustomAppBar(
    this._context, {
    Key? key,
    this.title = "",
    this.closable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kSecondaryColor,
      elevation: 0.0,
      centerTitle: true,
      leading: !closable
          ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => context.router.pop(),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const CircleBorder()),
                backgroundColor: MaterialStateProperty.all(kSecondaryColor),
                elevation: MaterialStateProperty.all<double>(4.0),
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(8.0)),
              ),
              child: const Icon(
                CollactionIcons.left,
                color: kPrimaryColor300,
              ),
            ),
          )
          : null,
      actions: [
        if (closable)
          GestureDetector(
            onTap: () => context.router.pop(),
            child: Image.asset('assets/images/icons/close_icon.png'),
          ),
      ],
      title: Text(title, style: const TextStyle(color: kPrimaryColor)),
    );
  }

  @override
  Size get preferredSize => Size(MediaQuery.of(_context).size.width, 55.0);
}
