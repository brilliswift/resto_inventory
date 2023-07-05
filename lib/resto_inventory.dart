import 'package:flutter/material.dart';

class RestoInventory extends StatefulWidget {
  const RestoInventory({super.key});

  @override
  State<RestoInventory> createState() => _RestoInventoryState();
}

class _RestoInventoryState extends State<RestoInventory> {
  String? valueschoose;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final amount = TextEditingController();
    final tot = TextEditingController();
    double cal;
    double result;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Resto Inventory',
                style: TextStyle(fontSize: 20, color: Colors.red)),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: amount,
              decoration: InputDecoration(
                  labelText: 'Weight',
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            const SizedBox(
              height: 15,
            ),
            DropdownButton<String>(
              value: valueschoose,
              items: <String>['Kilogram', 'Gram'].map((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (value) => setState(
                () => valueschoose = value,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: tot,
              decoration: InputDecoration(
                  labelText: 'Total Price in IDR',
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            GestureDetector(
              onTap: () {
                if (valueschoose == 'Kilogram') {
                  cal = double.parse(amount.text) * 140;
                  result = cal;
                  tot.text = result.toString();
                } else if (valueschoose == 'Gram') {
                  cal = double.parse(amount.text) / 1000 * 140;
                  result = cal;
                  tot.text = result.toString();
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: size.height / 14,
                width: size.width,
                child: const Text('Calculate',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
