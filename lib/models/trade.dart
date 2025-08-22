class Trade {
  final String instrument;
  final String direction;
  final double entry;
  final double stopLoss;
  final double target;
  final double exit;
  final double positionSize;
  final String notes;
  final DateTime date;
  final double pnl;
  final String result;

  Trade({
    required this.instrument,
    required this.direction,
    required this.entry,
    required this.stopLoss,
    required this.target,
    required this.exit,
    required this.positionSize,
    required this.notes,
    required this.date,
    required this.pnl,
    required this.result,
  });
}
