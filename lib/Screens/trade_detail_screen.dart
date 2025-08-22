import 'package:flutter/material.dart';
import '../models/trade.dart';

class TradeDetailScreen extends StatelessWidget {
  final Trade trade;
  const TradeDetailScreen({super.key, required this.trade});

  @override
  Widget build(BuildContext context) {
    final color = trade.pnl >= 0 ? Colors.green : Colors.red;
    
    // Determine asset image based on instrument name
    String assetImage = 'assets/images/default.png';
    if (trade.instrument.toLowerCase().contains('btc')) {
      assetImage = 'assets/images/btc.png';
    } else if (trade.instrument.toLowerCase().contains('xau')) {
      assetImage = 'assets/images/xauusd.png';
    } else if (trade.instrument.toLowerCase().contains('eth')) {
      assetImage = 'assets/images/eth.png';
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trade Details"), 
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[850],
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
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
                  Row(
                    children: [
                      Image.asset(
                        assetImage,
                        width: 40,
                        height: 40,
                        errorBuilder: (context, error, stackTrace) => 
                          Icon(Icons.currency_exchange, size: 40, color: Colors.grey[500]),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              trade.instrument,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: trade.direction.toLowerCase() == 'buy' 
                                  ? Colors.green.withOpacity(0.2) 
                                  : Colors.red.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                trade.direction,
                                style: TextStyle(
                                  color: trade.direction.toLowerCase() == 'buy' 
                                    ? Colors.green 
                                    : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey[600], height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Entry:", style: TextStyle(color: Colors.grey[400])),
                      Text("${trade.entry}", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Exit:", style: TextStyle(color: Colors.grey[400])),
                      Text("${trade.exit}", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("SL:", style: TextStyle(color: Colors.grey[400])),
                      Text("${trade.stopLoss}", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Target:", style: TextStyle(color: Colors.grey[400])),
                      Text("${trade.target}", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Position:", style: TextStyle(color: Colors.grey[400])),
                      Text("${trade.positionSize}", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Divider(color: Colors.grey[600], height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Planned RRR:", style: TextStyle(color: Colors.grey[400])),
                      Text(
                        "1:2.2",
                        style: TextStyle(
                          color: Colors.blue[300],
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Actual RRR:", style: TextStyle(color: Colors.grey[400])),
                      Text(
                        "1:2.2",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey[600], height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("PnL:", style: TextStyle(color: Colors.grey[400])),
                      Text(
                        "${trade.pnl >= 0 ? '+' : ''}${trade.pnl.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: color, 
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
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
                    "Notes", 
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    )
                  ),
                  const SizedBox(height: 8),
                  Text(
                    trade.notes.isEmpty ? "No notes added" : trade.notes,
                    style: TextStyle(color: Colors.grey[400]),
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