import 'package:artikool_client/artikool_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

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
        title: const Text('Home'),
      ),
      body:articels.isEmpty?
      const Text('no data')
      :
       ListView.builder(
          itemCount: articels.length,
          itemBuilder: (context, index) {
            var data = articels[index];
            return Card(
              child: ListTile(
                title: Text(data.title),
                subtitle: Text(data.content),
              ),
            );
          }),
    );
  }
}
