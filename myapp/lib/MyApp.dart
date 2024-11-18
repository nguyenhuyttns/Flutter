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

  Transaction _transaction = Transaction(content: "", amount: 0);
  final List<Transaction> _transactions = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("SnackBar Demo"),
        ),
        body: SafeArea(
          // Vùng an toàn để không đụng vào layout
          minimum: const EdgeInsets.only(
              left: 20, right: 20), // Khoảng cách an toàn tối thiểu
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                const SizedBox(height: 20),
                Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Tạo một bản sao mới của _transaction và thêm vào danh sách
                        _transactions.add(Transaction(
                          content: _transaction.content,
                          amount: _transaction.amount,
                        ));

                        // Đặt lại _transaction và các TextField
                        _transaction = Transaction(content: "", amount: 0);
                        _contentController.text = "";
                        _amountController.text = "";
                      });

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
      ),
    );
  }
}
