import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  final Function(int) BotaoPressionado;
  const Botoes({super.key, required this.BotaoPressionado});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () => BotaoPressionado(1),
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFFc5212d),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            "Paletts",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () => BotaoPressionado(2),
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFFc5212d),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            "Ruas",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white),
          ),
        ),
      ],
    );
  }
}
