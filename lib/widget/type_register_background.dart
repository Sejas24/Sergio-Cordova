import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class TypeRegisterBackground extends StatelessWidget {
  final Widget child;

  const TypeRegisterBackground({Key? key, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(),
          this.child,
        ],
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: _buildBoxDecoration(),
      child: Stack(
        children: [
          Positioned(
            child: _Bubble(),
            top: 90,
            left: 30,
          ),
          Positioned(
            child: _Bubble(),
            top: -40,
            left: -30,
          ),
          Positioned(
            child: _Bubble(),
            top: -20,
            right: -30,
          ),
          Positioned(
            child: _Bubble(),
            bottom: -50,
            left: 10,
          ),
          Positioned(
            child: _Bubble(),
            bottom: 120,
            right: 20,
          ),
          Positioned(
            child: _Bubble(),
            bottom: 120,
            right: 350,
          ),
          Positioned(
            child: _Bubble(),
            bottom: 180,
            right: 150,
          ),
          Positioned(
            child: _Bubble(),
            bottom: 500,
            right: 150,
          ),
          Positioned(
            child: _Bubble(),
            bottom: 500,
            right: 400,
          ),
          Positioned(
            child: _Bubble(),
            bottom: 700,
            right: 250,
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1),
          ],
        ),
      );
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
