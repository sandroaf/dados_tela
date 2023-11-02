import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, //tira a tag de debug "vermelha"
    title: 'Retornando Dados',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voltando dados para principal'),
      ),
      body: const Center(
        child: SelectionButton(),
      ),
    );
  }
}

class SelectionButton extends StatefulWidget {
  const SelectionButton({super.key});

  @override
  State<SelectionButton> createState() => _SelecionButtonState();
}

class _SelecionButtonState extends State<SelectionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _navigationAndDisplaySelection(context);
        },
        child: const Text("Selecione uma opção"));
  }
}

Future<void> _navigationAndDisplaySelection(BuildContext context) async {
  final result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => const SelectionScreen()));

  //if (!mounted) return;

  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text('$result')));
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione uma opção'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Sim!');
                },
                child: const Text('Sim!')),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Não!');
                },
                child: const Text('Não!')),
          )
        ],
      )),
    );
  }
}
