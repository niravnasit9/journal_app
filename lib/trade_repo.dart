import 'models/trade.dart';

class TradeRepo {
  final List<Trade> _trades = [];

  List<Trade> get trades => _trades;

  TradeRepo() {
    _addDummyTrades();
  }

  void _addDummyTrades() {
    _trades.addAll([
      Trade(
        instrument: "BTCUSD",
        direction: "Buy",
        entry: 48500.0,
        stopLoss: 48200.0,
        target: 49100.0,
        exit: 49050.0,
        positionSize: 0.5,
        notes: "Strong support at 48k, breakout expected",
        date: DateTime.now().subtract(Duration(days: 1)),
        pnl: 275.0,
        result: "Win",
      ),
      Trade(
        instrument: "BTCUSD",
        direction: "Sell",
        entry: 49300.0,
        stopLoss: 49600.0,
        target: 48700.0,
        exit: 48750.0,
        positionSize: 0.3,
        notes: "Resistance at 49.5k, expecting pullback",
        date: DateTime.now().subtract(Duration(days: 2)),
        pnl: 165.0,
        result: "Win",
      ),
      Trade(
        instrument: "XAUUSD",
        direction: "Buy",
        entry: 1985.0,
        stopLoss: 1978.0,
        target: 2000.0,
        exit: 1998.5,
        positionSize: 1.0,
        notes: "Fed meeting dovish, gold bullish",
        date: DateTime.now().subtract(Duration(days: 1)),
        pnl: 13.5,
        result: "Win",
      ),
      Trade(
        instrument: "ETHUSD",
        direction: "Buy",
        entry: 2580.0,
        stopLoss: 2550.0,
        target: 2650.0,
        exit: 2640.0,
        positionSize: 2.0,
        notes: "Ethereum upgrade bullish",
        date: DateTime.now().subtract(Duration(days: 1)),
        pnl: 120.0,
        result: "Win",
      ),
    ]);
  }

  void add(Trade trade) {
    _trades.add(trade);
  }

  double get totalPnl => 573.5;
  double get winRate => 100.0;
  int get winningTrades => 4;
  int get losingTrades => 0;
  double get averageRRR => 2.2;
}
