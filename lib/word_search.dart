import 'package:flutter/material.dart';

class WordSearch extends StatefulWidget {
  const WordSearch({super.key});

  @override
  State<WordSearch> createState() => _WordSearchState();
}

class _WordSearchState extends State<WordSearch> with TickerProviderStateMixin {
  String word = "Jesus";
  final List<TextEditingController> controllers = [];
  final List<FocusNode> focusNodes = [];
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addListener(() {
            setState(() {});
          });
    animationController.forward();

    // Initialize a controller for each letter
    for (var i = 0; i < word.length; i++) {
      controllers.add(TextEditingController());
      focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    // Dispose all controllers to free memory
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Word Search"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  word,
                  style: const TextStyle(fontSize: 96),
                ),
                const SizedBox(
                  height: 100,
                ),
                Wrap(
                  spacing: 20,
                  children: List.generate(word.length, (index) {
                    return SizedBox(
                      width: 70,
                      child: TextField(
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 72),
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(), counterText: ""),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < word.length - 1) {
                            // Move focus to the next field
                            FocusScope.of(context)
                                .requestFocus(focusNodes[index + 1]);
                          } else if (value.isNotEmpty &&
                              index == word.length - 1) {
                            // Optionally dismiss the keyboard on the last field
                            FocusScope.of(context).unfocus();
                          }
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: SizedBox(
                height: 700,
                width: 20,
                child: RotatedBox(
                  quarterTurns: -1,
                  child: LinearProgressIndicator(
                    minHeight: 10,
                    value: animationController.value,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
