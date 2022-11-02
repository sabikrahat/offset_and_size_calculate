import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
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
        title: const Text('Offset & Size'),
      ),
      body: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: [
          ...List.generate(100, (index) => CustomTile(index: index)),
        ],
      ),
    );
  }
}

class CustomTile extends StatefulWidget {
  const CustomTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<CustomTile> createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  final globalKey = GlobalKey();
  Size? size;
  Offset? offset;

  @override
  void initState() {
    super.initState();
    calculatePosition();
  }

  void calculatePosition() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox =
          globalKey.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      setState(() {
        size = renderBox.size;
        offset = position;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      height: 200,
      width: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.primaries[widget.index % Colors.primaries.length]
            .withOpacity(0.3),
        border: Border.all(
          color: Colors.primaries[widget.index % Colors.primaries.length],
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.index.toString()),
          Text('Size: $size'),
          Text('Offset: $offset'),
        ],
      ),
    );
  }
}
