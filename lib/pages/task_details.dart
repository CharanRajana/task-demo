import 'package:flutter/material.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({Key? key, required this.id, required this.title})
      : super(key: key);
  final int id;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Hero(
        //transitionOnUserGestures: true,
        tag: 'hero',
        child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) => Navigator.pop(context),
                    child: Text(
                      '$title'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
