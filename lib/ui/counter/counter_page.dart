import 'package:capgemini/ui/widget/keyboard_closer.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KeyboardCloser(
      child: Scaffold(
        body: SafeArea(
          child: FormSection(),
        ),
      ),
    );
  }
}

class FormSection extends StatefulWidget {
  const FormSection({super.key});

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  var _counter = 3;
  final _controller = TextEditingController();

  bool get _textfieldHasValue => _controller.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 24);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            onEditingComplete: _setCounter,
            decoration: const InputDecoration(
              labelText: 'Initial counter',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: _textfieldHasValue ? _setCounter : null,
          child: const Text('Set counter'),
        ),
        spacer,
        Text('click counter $_counter'),
        spacer,
        ElevatedButton(
          onPressed: _incrementCounterByOne,
          child: const Text('Add 1 to counter'),
        ),
      ],
    );
  }

  void _setCounter() {
    final newValue = int.tryParse(_controller.text);
    _controller.clear();
    _counter = newValue ?? 0;
  }

  void _incrementCounterByOne() {
    setState(() {
      _counter++;
    });
  }
}
