import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portafolio_virtual/utils/responsive.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/info.dart';

class SobreMi extends StatelessWidget {
  const SobreMi({super.key});

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<Information>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 60),
          height: Responsive.of(context).wm(24),
          width: Responsive.of(context).wm(100),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(Responsive.of(context).wm(20)!)),
                width: Responsive.of(context).wm(21),
                height: Responsive.of(context).wm(21),
              ),
              Positioned(
                top: Responsive.of(context).wm(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      tooltip: "LinkedIn",
                      hoverColor: Colors
                          .transparent, // Establecer el color hover a transparente
                      splashColor: Colors
                          .transparent, // Establecer el color de la sombra al presionar a transparente
                      highlightColor: Colors.transparent,
                      onPressed: () async {
                        if (!await launchUrl(
                            Uri.parse('https://github.com/hectorpuga'))) {
                          throw Exception('Could not launch ');
                        }
                      },
                      icon:
                          Image.asset('assets/linkelynd.png', fit: BoxFit.fill),
                      iconSize: Responsive.of(context).wm(5.5),
                    ),
                    IconButton(
                      tooltip: "Facebook",
                      hoverColor: Colors
                          .transparent, // Establecer el color hover a transparente
                      splashColor: Colors
                          .transparent, // Establecer el color de la sombra al presionar a transparente
                      highlightColor: Colors.transparent,
                      onPressed: () async {
                        if (!await launchUrl(
                            Uri.parse('https://www.facebook.com/Ale.PG.505'))) {
                          throw Exception('Could not launch ');
                        }
                      },
                      icon: Image.asset(
                        'assets/facebook.png',
                        fit: BoxFit.fill,
                      ),
                      iconSize: Responsive.of(context).wm(5.5),
                    ),
                    IconButton(
                      tooltip: "GitHub",
                      hoverColor: Colors
                          .transparent, // Establecer el color hover a transparente
                      splashColor: Colors
                          .transparent, // Establecer el color de la sombra al presionar a transparente
                      highlightColor: Colors.transparent,
                      onPressed: () async {
                        if (!await launchUrl(
                            Uri.parse('https://github.com/hectorpuga'))) {
                          throw Exception('Could not launch ');
                        }
                      },
                      icon: Image.asset('assets/github.png', fit: BoxFit.fill),
                      iconSize: Responsive.of(context).wm(5.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text(
          "Acerca de mi",
          style: TextStyle(
              color: Colors.white, fontSize: Responsive.of(context).wm(4)),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: Responsive.of(context).wm(60),
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TypewriterAnimatedText(
                textAlign: TextAlign.center,
                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                info.acercademi,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
