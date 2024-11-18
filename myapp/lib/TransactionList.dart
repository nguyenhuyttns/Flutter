import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: const EdgeInsets.all(10)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: const EdgeInsets.all(10)),
                  Text(
                    transactions[index].content,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Date: ${DateFormat.yMd().format(transactions[index].createdDate)}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Price: ${transactions[index].amount}\$',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _buildListView(),
    );
  }
}
