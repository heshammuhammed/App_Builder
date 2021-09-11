import 'package:app_builder/provider/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoConnection extends StatelessWidget {
  AppConfigProvider? appConfigProvider;
  Function reload;

  NoConnection({required this.reload});

  @override
  Widget build(BuildContext context) {
    appConfigProvider = Provider.of<AppConfigProvider>(context, listen: false);

    return Container(
      margin: EdgeInsets.all(24),
      child: GestureDetector(
        onTap: () => reload(),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/no_network.jpg", width: 250, height: 250),
                SizedBox(height: 24),
                Text(
                  "Connection error, Please check your connection and tap to try again",
                  style: TextStyle(color: appConfigProvider!.getTextColor(), fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
