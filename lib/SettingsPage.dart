import 'package:bgfg_frontend/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
              Container(
                height: sizeConfig.blockSizeVertical * 50,
                width: sizeConfig.blockSizeHorizontal * 50,
                color: Colors.red,
              )
            ]),
      ),
    );
  }
}
