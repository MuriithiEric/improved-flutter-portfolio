import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/CustomTheme.dart';
import 'package:portfolio/models/contactItem.dart';
import 'package:portfolio/widgets/ContactCard/DesktopContactCard.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopContact extends StatelessWidget {
  final PageController controller;
  const DesktopContact({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ContactItem> contactItems = [
      ContactItem(
          title: 'Phone',
          value: '+254700366137',
          iconData: Icons.phone,
          onClickContact: () {
            launch('tel:+254700366137');
          }),
      ContactItem(
          title: 'Mail',
          value: 'emuriithi42@gmail.com',
          iconData: Icons.mail,
          onClickContact: () {
            launch("mailto:emuriithi42@gmail.com?body=Hey,");
          }),
      ContactItem(
          title: 'LinkedIn',
          value: 'eric-muriithi-48346117b/',
          iconData: MdiIcons.linkedin,
          onClickContact: () {
            Clipboard.setData(ClipboardData(
                text: "https://www.linkedin.com/in/eric-muriithi-48346117b/"));
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('LinkedIn Id copied to clipboard')));
          }),
    ];
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            color: customTheme.contactBackgroundColor,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Contact Me',
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                      color: customTheme.alternateHeadingText),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: contactItems.map((item) {
                    return DesktopContactCard(contactItem: item);
                  }).toList(),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Created in flutter with ❤",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              TextButton.icon(
                  onPressed: () {
                    controller.animateToPage(0,
                        duration: Duration(milliseconds: 1300),
                        curve: Curves.easeIn);
                  },
                  style: TextButton.styleFrom(
                      primary: customTheme.outlinedButtonColor),
                  icon: Icon(Icons.arrow_upward),
                  label: Text('Back to Top'))
            ],
          ),
        )
      ],
    );
  }
}
