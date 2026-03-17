import 'package:flutter/material.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key, required this.history});
  final List<String> history;

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: widget.history.isEmpty
          ? Center(
              child: Center(
                child: Text(
                  'Nenhum cálculo realizado',
                  style: TextStyle(fontSize: 20,color: Colors.grey),
                ),
              ),
            )
          : ListView.builder(
              itemCount: widget.history.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: ListTile(
                    leading: CircleAvatar(child: Text("${index + 1}")),
                    title: Text(
                      widget.history[index],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
