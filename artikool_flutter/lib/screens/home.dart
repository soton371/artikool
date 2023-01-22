import 'package:artikool_client/artikool_client.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  String _resultMessage = 'Atrticels';

  //fetch artical
  List<Articel> articels = [];
  Future<void> fetchArticel() async {
    try {
      var result = await client.artikool.getArticles();
      print('object: ${result.length}');
      setState(() {
        articels = result;
      });
    } on Exception catch (e) {
      debugPrint(e.toString());
      setState(() {
        articels = [];
      });
    }
  }

//add articel
  Future<void> addArticel() async {
    var articel = Articel(
      title: 'title',
      content: 'content',
      publishedOn: DateTime.now(),
      isPrime: true,
    );

    try {
      var result = await client.artikool.addArticel(articel);
      print('object: $result');
      if (result) {
        setState(() {
          _resultMessage = 'Articel inseted';
        });
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      setState(() {
        _resultMessage = 'Articel inseted failed';
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchArticel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_resultMessage),
      ),
      body: articels.isEmpty
          ? const Text('no data')
          : ListView.builder(
              itemCount: articels.length,
              itemBuilder: (context, index) {
                var data = articels[index];
                return FocusedMenuHolder(
                    onPressed: () {},
                    menuItems: [
                      FocusedMenuItem(
                          title: const Text('Edit'),
                          trailingIcon: const Icon(Icons.edit),
                          onPressed: () {}),
                      FocusedMenuItem(
                          backgroundColor: Colors.red,
                          title: const Text(
                            'Delete',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailingIcon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    ],
                    child: Card(
                      child: ListTile(
                        title: Text(data.title),
                        subtitle: Text(data.content),
                      ),
                    ));
                // return Card(
                //   child: ListTile(
                //     title: Text(data.title),
                //     subtitle: Text(data.content),
                //   ),
                // );
              }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Text('Input'),
              ),
            );
          }),
    );
  }
}
