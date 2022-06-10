import 'package:flutter/material.dart';
import 'package:task_demo/utils/extras.dart';
import 'package:task_demo/pages/task_details.dart';
import 'package:task_demo/utils/small_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController textController = TextEditingController();

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
    textController.dispose();
    super.dispose();
  }

  void takeinput() {
    inputTask = textController.text;
    increment();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: element,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Center(
            child: Text(
              'TODO',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 26,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: CircleAvatar(
                              minRadius: 20,
                              maxRadius: 30,
                              backgroundImage: AssetImage('assets/dash.jpeg'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Hello, Dash!',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue.shade900,
                                  fontSize: 36,
                                  letterSpacing: 2),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'Feels like a good day.\nYou have following tasks for today',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                fontSize: 16,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                          onPageChanged: (value) {
                            setState(() {
                              element = list[random.nextInt(list.length)];
                            });
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
                    controller: textController,
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
      ),
    );
  }
}
