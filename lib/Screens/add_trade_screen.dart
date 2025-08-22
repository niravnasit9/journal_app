import 'package:flutter/material.dart';
import '../models/trade.dart';
import '../trade_repo.dart';

class AddTradeScreen extends StatefulWidget {
  const AddTradeScreen({super.key});

  @override
  State<AddTradeScreen> createState() => _AddTradeScreenState();
}

class _AddTradeScreenState extends State<AddTradeScreen> {
  final _instrument = TextEditingController();
  String _direction = "Buy";
  final _entry = TextEditingController();
  final _sl = TextEditingController();
  final _target = TextEditingController();
  final _exit = TextEditingController();
  final _position = TextEditingController(text: "1");
  final _notes = TextEditingController();

  void _save() {
    final trade = Trade(
      instrument: _instrument.text.trim(),
      direction: _direction,
      entry: double.tryParse(_entry.text) ?? 0.0,
      stopLoss: double.tryParse(_sl.text) ?? 0.0,
      target: double.tryParse(_target.text) ?? 0.0,
      exit: double.tryParse(_exit.text) ?? 0.0,
      positionSize: double.tryParse(_position.text) ?? 1.0,
      notes: _notes.text.trim(),
      date: DateTime.now(),
      pnl: 100.0, 
      result: "Win", 
    );
    TradeRepo().add(trade);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Trade saved"),
        backgroundColor: Colors.green[700],
      ),
    );
    Navigator.pop(context);
  }

  InputDecoration _dec(String label, [IconData? icon]) => InputDecoration(
    labelText: label,
    labelStyle: TextStyle(color: Colors.grey[400]),
    prefixIcon: icon != null ? Icon(icon, color: Colors.grey[500]) : null,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: Colors.grey[600]!),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: Colors.grey[600]!),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: Colors.blue[700]!),
    ),
    filled: true,
    fillColor: Colors.grey[800],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Trade"),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[850],
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 16),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _instrument,
                      style: const TextStyle(color: Colors.white),
                      decoration: _dec("Instrument", Icons.toll),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey[600]!),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButtonFormField<String>(
                        value: _direction,
                        dropdownColor: Colors.grey[800],
                        style: const TextStyle(color: Colors.white),
                        items: const [
                          DropdownMenuItem(value: "Buy", child: Text("Buy")),
                          DropdownMenuItem(value: "Sell", child: Text("Sell")),
                        ],
                        onChanged:
                            (v) => setState(() => _direction = v ?? "Buy"),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Direction",
                          labelStyle: TextStyle(color: Colors.grey[400]),
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _entry,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: _dec("Entry", Icons.login),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _sl,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: _dec("Stop Loss", Icons.shield),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _target,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: _dec("Target", Icons.flag),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _exit,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: _dec("Exit", Icons.logout),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _position,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: _dec("Position Size", Icons.scale),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _notes,
                style: const TextStyle(color: Colors.white),
                minLines: 2,
                maxLines: 4,
                decoration: _dec("Notes", Icons.note_alt),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _save,
                  icon: const Icon(Icons.save),
                  label: const Text("Save Trade"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
