import 'package:flutter/material.dart';
import '../trade_repo.dart';
import '../widgets/stat_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = TradeRepo();
    final bool isProfit = repo.totalPnl >= 0;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trading Journal"),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[850],
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  title: "Total P&L", 
                  value: repo.totalPnl.toStringAsFixed(2), 
                  icon: Icons.account_balance_wallet,
                  isPositive: isProfit,
                )
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  title: "Win Rate", 
                  value: "${repo.winRate.toStringAsFixed(1)}%", 
                  icon: Icons.emoji_events,
                  isPositive: repo.winRate >= 50,
                )
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  title: "Total Trades", 
                  value: "${repo.trades.length}", 
                  icon: Icons.bar_chart,
                  isPositive: true,
                )
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  title: "Avg RRR", 
                  value: "1:${repo.averageRRR.toStringAsFixed(2)}", 
                  icon: Icons.trending_up,
                  isPositive: repo.averageRRR >= 1,
                )
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Performance Summary", 
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    )
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total P&L:", style: TextStyle(color: Colors.grey[400])),
                      Text(
                        "${repo.totalPnl >= 0 ? '+' : ''}${repo.totalPnl.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: isProfit ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Winning Trades:", style: TextStyle(color: Colors.grey[400])),
                      Text(
                        "${repo.winningTrades}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Losing Trades:", style: TextStyle(color: Colors.grey[400])),
                      Text(
                        "${repo.losingTrades}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Average RRR:", style: TextStyle(color: Colors.grey[400])),
                      Text(
                        "1:${repo.averageRRR.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}