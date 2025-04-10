import 'package:flutter/material.dart';
import 'package:portfolio/shared/data/constants.dart';

class DesktopNavbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget webBody;
  const DesktopNavbar({super.key, required this.webBody});

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(
            width: 3.0,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );

    return NestedScrollView(
      headerSliverBuilder: (context, bool innerBoxScrolled) => [
        SliverAppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          floating: true,
          pinned: false,
          snap: true,
          elevation: 0,
          title: Text(
            'Voit',
            style: CustomStyle.mavenpro(
              fontSize: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/signature/signature_white.png',
              filterQuality: FilterQuality.high,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              style: buttonStyle,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'About Me',
                  style: CustomStyle.mavenpro(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            TextButton(
              onPressed: () {},
              style: buttonStyle,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Experience',
                  style: CustomStyle.mavenpro(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            TextButton(
              onPressed: () {},
              style: buttonStyle,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Projects',
                  style: CustomStyle.mavenpro(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            TextButton(
              onPressed: () {},
              style: buttonStyle,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Contact',
                  style: CustomStyle.mavenpro(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Blog',
                  style: CustomStyle.mavenpro(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            SizedBox(width: 50)
          ],
        )
      ],
      body: webBody,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
