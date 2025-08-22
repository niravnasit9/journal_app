import 'package:flutter/material.dart';
import '../trade_repo.dart';
import '../models/trade.dart';
import 'trade_detail_screen.dart';

class TradeListScreen extends StatefulWidget {
  const TradeListScreen({super.key});

  @override
  State<TradeListScreen> createState() => _TradeListScreenState();
}

class _TradeListScreenState extends State<TradeListScreen> {
  @override
  Widget build(BuildContext context) {
    final repo = TradeRepo();
    final trades = repo.trades.reversed.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Trades"), 
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[850],
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: trades.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final Trade t = trades[index];
          final color = t.pnl >= 0 ? Colors.green : Colors.red;
          
          String assetImage = 'assets/images/default.png';
          if (t.instrument.toLowerCase().contains('btc')) {
            assetImage = 'assets/images/btc.png';
          } else if (t.instrument.toLowerCase().contains('xau')) {
            assetImage = 'assets/images/xauusd.png';
          } else if (t.instrument.toLowerCase().contains('eth')) {
            assetImage = 'assets/images/eth.png';
          }
          
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )
              ]
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[700],
                child: Image.asset(
                  assetImage,
                  width: 30,
                  height: 30,
                  errorBuilder: (context, error, stackTrace) => 
                    Icon(
                      t.direction.toLowerCase() == 'buy' 
                        ? Icons.arrow_upward 
                        : Icons.arrow_downward,
                      color: color,
                    ),
                ),
              ),
              title: Text(
                t.instrument,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: t.direction.toLowerCase() == 'buy' 
                            ? Colors.green.withOpacity(0.2) 
                            : Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          t.direction,
                          style: TextStyle(
                            color: t.direction.toLowerCase() == 'buy' 
                              ? Colors.green 
                              : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "RRR: 1:2.2",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Entry: ${t.entry} | Exit: ${t.exit}",
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${t.pnl >= 0 ? '+' : ''}${t.pnl.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    t.result,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TradeDetailScreen(trade: t),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        label: const Text("Add Trade"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.blue[700],
      ),
    );
  }
}