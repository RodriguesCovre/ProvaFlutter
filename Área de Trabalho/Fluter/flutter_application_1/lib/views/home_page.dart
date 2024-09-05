import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int placarPC = 0;
  int placarJogador = 0;
  int empates = 0;
  List icones = [
    Icon(Icons.back_hand_outlined),
    Icon(Icons.handyman_rounded),
    Icon(Icons.content_cut_rounded),
  ];

  void _pedraPapelTesoura(String escolhaUser) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var num = Random().nextInt(3);
    var escolhaPc = opcoes[num];
    if (escolhaUser == escolhaPc) {
      setState(() {
        empates++;
      });
    } else if ((escolhaUser == 'pedra' && escolhaPc == 'tesoura') ||
        (escolhaUser == 'tesoura' && escolhaPc == 'papel') ||
        (escolhaUser == 'papel' && escolhaPc == 'pedra')) {
      setState(() {
        placarJogador++;
      });
    } else {
      setState(() {
        placarPC++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: [
            Text('Sua vez de jogar'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 50,
                  child: IconButton(
                    icon: Icon(Icons.content_cut_rounded),
                    onPressed: () => _pedraPapelTesoura('tesoura'),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  child: IconButton(
                    icon: Icon(Icons.handyman_rounded),
                    onPressed: () => _pedraPapelTesoura('pedra'),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  child: IconButton(
                    icon: Icon(Icons.back_hand_outlined),
                    onPressed: () => _pedraPapelTesoura('papel'),
                  ),
                  //child: Icon(Icons.back_hand_outlined),
                )
              ],
            ),
            Text('Jogada do Pc'),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    child: icones[Random().nextInt(3)],
                    radius: 50,
                  ),
                ],
              ),
            ),
            Text('Placar'),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('PC: $placarPC'),
                  Text('Jogador: $placarJogador'),
                  Text('Empates: $empates'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}