import 'package:flutter/material.dart';
import 'package:myapp/TransactionList.dart';
import 'package:myapp/transaction.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  final _contentController =
      TextEditingController(); // Lấy dữ liệu từ TextField
  final _amountController = TextEditingController();

  Transaction _transaction =
      Transaction(content: "", amount: 0, createdDate: DateTime.now());
  final List<Transaction> _transactions = List.empty(growable: true);

  void _insetTransaction() {
    if (_transaction.content.isEmpty ||
        _transaction.amount == 0 ||
        _transaction.amount.isNaN) {
      return;
    }

    _transaction.createdDate = DateTime.now();
    _transactions.add(Transaction(
      content: _transaction.content,
      amount: _transaction.amount,
      createdDate: _transaction.createdDate,
    ));

    // Đặt lại _transaction và các TextField
    _transaction =
        Transaction(content: "", amount: 0, createdDate: DateTime.now());
    _contentController.text = "";
    _amountController.text = "";
  }

  void _onButtonShowModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Content',
              ),
              controller: _contentController,
              onChanged: (text) {
                setState(() {
                  _transaction.content = text;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              controller: _amountController,
              onChanged: (text) {
                _transaction.amount = int.tryParse(text) ?? 0;
              },
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          print("save");
                          setState(() {
                            _insetTransaction();
                          });
                        },
                        child: Text("Save"),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            print("cancel");
                          },
                          child: Text("Cancel")),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction manager"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _insetTransaction();
              });
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: "Add transaction",
          child: Icon(Icons.add),
          onPressed: () {
            _onButtonShowModalSheet();
          }),
      body: SafeArea(
        // Vùng an toàn để không đụng vào layout
        minimum: const EdgeInsets.only(
            left: 20, right: 20), // Khoảng cách an toàn tối thiểu
        child: SingleChildScrollView(
          child: Column(
            //in this lesson we will replace the input with "Model Bottom Sheet"
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    _onButtonShowModalSheet();
                    //display the list below
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Transaction list: $_transactions',
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('Insert!'),
                ),
              ),
              Transactionlist(transactions: _transactions),
            ],
          ),
        ),
      ),
    );
  }
}
