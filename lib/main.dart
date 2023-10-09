import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_04/models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: 'dog04', breed: 'breed04'),
      child: MaterialApp(
        title: 'Provider 04',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider 04'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // Column위젯의 사이즈의 Children들의 사이즈만큼만 차지하도록 MainAxisSize.min으로 설정하였습니다.
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '- name: ${Provider.of<Dog>(context, listen: false).name}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            BreedAndAge(),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {

  const BreedAndAge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- breed: ${Provider.of<Dog>(context, listen: false).breed}',
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(
          height: 10.0,
        ),
        Age(),
      ],
    );
  }
}

class Age extends StatelessWidget {

  const Age({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age: ${Provider.of<Dog>(context).age}',
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () => Provider.of<Dog>(context, listen: false).grow(),
          child: Text(
            'Grow',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
