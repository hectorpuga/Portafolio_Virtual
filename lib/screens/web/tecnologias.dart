import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portafolio_virtual/provider/info.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive.dart';

class Tecnologias extends StatelessWidget {
  const Tecnologias({super.key});

  @override
  Widget build(BuildContext context) {
    final tecnologia = Provider.of<Information>(context).tecnologias;
    return Expanded(
      child: GridView.builder(
        itemCount: tecnologia.length,
        padding: const EdgeInsets.symmetric(vertical: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.25,
            crossAxisCount: 3,
            crossAxisSpacing: Responsive.of(context).wp(5),
            mainAxisSpacing: Responsive.of(context).hm(5)!),
        itemBuilder: (context, i) => Container(
          height: 400,
          width: 400,
          child: Column(
            children: [
              Container(
                height: Responsive.of(context).dp(12),
                width: Responsive.of(context).dp(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: SvgPicture.asset(
                  tecnologia[i]["img"],
                  fit: BoxFit.fill,
                  placeholderBuilder: (BuildContext context) => Image.asset(
                    "assets/loading.gif",
                    fit: BoxFit.fill,
                    height: Responsive.of(context).hm(20),
                    width: Responsive.of(context).wp(30),
                  ),
                  width: Responsive.of(context).wp(40),
                ),
              ),
              Text(
                "JavaScript",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
