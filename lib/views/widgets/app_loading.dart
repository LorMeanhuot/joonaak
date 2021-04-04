import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class AppLoading extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const AppLoading({this.child, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: LoadingOverlay(
        isLoading: isLoading,
        color: Colors.black87,
        opacity: 0.6,
        progressIndicator: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          backgroundColor: Colors.white70,
        ),
        child: child,
      ),
    );
  }

}