import 'package:flutter/material.dart';
import 'transaction.dart';

class Transactionlist extends StatelessWidget {
  final List<Transaction> transactions;
  const Transactionlist({super.key, required this.transactions});

  ListView _buildListView() {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: (index - 1) % 2 == 0 ? Colors.green : Colors.teal,
          child: ListTile(
            leading: const Icon(Icons.alarm),
            title: Text(
              transactions[index].content,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              "Price: ${transactions[index].amount}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onTap: () {},
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //"Dung scroolable"
    //1.Listview(children: <widget>[]) => load all children
    //2.ListView(itemBuilder:....) ->load only visible items

    return Container(
      height: 500,
      child: _buildListView(),
    );
  }
}
