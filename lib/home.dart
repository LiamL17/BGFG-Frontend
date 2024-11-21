import 'package:bgfg_frontend/shuffle.dart';
import 'package:bgfg_frontend/size_config.dart';
import 'package:bgfg_frontend/word_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 118, 102, 207),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: sizeConfig.blockSizeVertical * 33,
              width: 450,
              child: const Card(
                child: Column(
                  children: [
                    Text(
                      "Verse of the day",
                      style: TextStyle(fontSize: 32),
                    ),
                    Text(
                      "Romans 1:2",
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      "because through Christ Jesus the law of the Spirit who gives life has set you free from the law of sin and death.",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              )),
          const Padding(padding: EdgeInsets.all(16)),
          SizedBox(
            height: sizeConfig.blockSizeVertical * 45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 200,
                        height: sizeConfig.blockSizeVertical * 20,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const WordSearch()));
                          },
                          child: const Card(
                            child: Center(
                              child: Text(
                                "Word Search",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 200,
                      height: sizeConfig.blockSizeVertical * 20,
                      child: const Card(
                        child: Center(
                          child: Text(
                            "Crossword",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: sizeConfig.blockSizeVertical * 20,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Shuffle()));
                        },
                        child: const Card(
                          child: Center(
                            child: Text(
                              "Shuffle",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: sizeConfig.blockSizeVertical * 20,
                      child: const Card(
                        child: Center(
                          child: Text(
                            "Quiz",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
