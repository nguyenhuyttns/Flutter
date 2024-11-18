class Transaction {
  String content;
  int amount;

  Transaction({required this.content, required this.amount});

  @override
  String toString() {
    // TODO: implement toString
    return "content: $content, amount: $amount";
  }
}
