import 'package:flutter/material.dart';
import 'package:test/data_model.dart';
import 'package:test/manager.dart';

class Output extends StatefulWidget {
  const Output({Key? key}) : super(key: key);

  @override
  State<Output> createState() => _OutputState();
}

class _OutputState extends State<Output> {
  late Future<DataModel> datadata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datadata = ApiManager().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<DataModel>(
          future: datadata,
          builder: (context, snapshort) {
            if (snapshort.hasData) {
              return ListView.builder(
                itemCount: snapshort.data!.result.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshort.data!.result[index].day),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
