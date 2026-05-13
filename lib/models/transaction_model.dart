class TransactionModel {
  final String id;
  final String fromUserId;
  final String toUserId;
  final double amount;
  final String type;
  final DateTime timestamp;

  TransactionModel({
    required this.id,
    required this.fromUserId,
    required this.toUserId,
    required this.amount,
    required this.type,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'amount': amount,
      'type': type,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}