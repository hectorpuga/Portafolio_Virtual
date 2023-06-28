import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/responsive.dart';
import 'contacto.dart';

class HomeWeb extends StatelessWidget {
  const HomeWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
        effects: const [FadeEffect(), ScaleEffect()],
        child: Expanded(
            child: Padding(
          padding: EdgeInsets.only(
            left: Responsive.of(context).wp(5),
          ),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello! I\´ m\nHéctor Puga',
                        style: TextStyle(
                            fontSize: Responsive.of(context).wp(7),
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: Responsive.of(context).hp(3),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _mostrarAlert(context);
                      },
                      child: const Text("Contactame"),
                    )
                  ],
                ),
                SizedBox(width: Responsive.of(context).wp(8)),
                SvgPicture.asset(
                  "assets/home.svg",
                  width: Responsive.of(context).wp(23),
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
        )
                .animate(delay: const Duration(milliseconds: 50))
                .fade(duration: 1.seconds)));
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                content: const Contacto(),
              ),
            ),
          );
        });
  }
}
