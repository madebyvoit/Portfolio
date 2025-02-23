import 'package:flutter/material.dart';

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.sizeOf(context).width,
      child: Container(
        color: Colors.blueGrey.shade700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width / 5,
                  alignment: Alignment.topLeft,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Text(
                      '- Just have fun creating things you like the most '),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Get in touch'),
                      Text('pascal-dohle@gmx.de'),
                      Text(
                          'iamvoit on discord'), // make both clickable actions later
                      Text('add phone number here maybe'),
                    ],
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Connect'),
                      Text('pascal-dohle@gmx.de'),
                      Text(
                          'iamvoit on discord'), // make both clickable actions later
                    ],
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Other interesting stuff'),
                      Text('paste github here'),
                      Text('medium here'), // make both clickable actions later
                      Text(
                          'and maybe a future professinell youtube channel here'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('© 2025 by Voit'),
                Text('i dont know what to put here'),
                SizedBox(width: MediaQuery.sizeOf(context).width / 2),
              ],
            )
          ],
        ),
      ),
    );
  }
}
