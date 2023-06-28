import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class Tecnologias extends StatelessWidget {
  const Tecnologias({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 8,
        padding: const EdgeInsets.symmetric(vertical: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.25,
            crossAxisCount: 3,
            crossAxisSpacing: Responsive.of(context).wp(5),
            mainAxisSpacing: Responsive.of(context).hm(5)!),
        itemBuilder: (context, index) => Container(
          color: Colors.white,
          height: 400,
          width: 400,
          child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red),
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
