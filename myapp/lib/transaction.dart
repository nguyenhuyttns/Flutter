class Transaction {
  String content;
  int amount;
  DateTime createdDate;

  Transaction(
      {required this.content, required this.amount, required this.createdDate});

  @override
  String toString() {
    return "content: $content, amount: $amount";
  }
}
