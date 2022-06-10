import 'package:flutter/material.dart';
import 'package:task_demo/pages/task_details.dart';
import 'package:task_demo/utils/small_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController myController = TextEditingController();

  String? inputTask;
  Map<int, String?> items = {
    1: 'Work',
    2: 'Personal',
    3: 'Hobby',
  };

  void increment() {
    setState(() {
      items[(items.length) + 1] = inputTask;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void takeinput() {
    inputTask = myController.text;
    increment();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'TODO',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24,
              letterSpacing: 3,
            ),
          ),
        ),
        leading: const Icon(Icons.menu_rounded),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, i) {
                          final index = i;
                          return InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TaskDetails(
                                  id: index + 1,
                                  title: items[index + 1],
                                ),
                              ),
                            ),
                            child: Hero(
                              //transitionOnUserGestures: true,
                              tag: 'hero',
                              child: SmallCard(
                                id: index + 1,
                                title: items[index + 1],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Enter a new Task'),
                content: TextField(
                  controller: myController,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        takeinput();
                      });
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          });
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
