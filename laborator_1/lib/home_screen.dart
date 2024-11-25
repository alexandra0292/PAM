import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // formatare a datei

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _exchangeRateController =
      TextEditingController(text: '17.65');
  String _selectedFromCurrency = 'MDL';
  String _selectedToCurrency = 'USD';
  double _exchangeRate = 17.65;
  double _convertedAmount = 0.0;

  void _convertCurrency() {
    setState(() {
      double inputAmount = double.tryParse(_amountController.text) ?? 0;
      _exchangeRate = double.tryParse(_exchangeRateController.text) ?? 17.65;
      _convertedAmount = inputAmount / _exchangeRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                DateFormat.jm().format(DateTime.now()),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.network_cell, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.wifi, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.battery_full, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      //definire body
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Currency Converter',
              style: TextStyle(
                color: Color(0xFF26278D),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Amount',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('../assets/mdl.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          DropdownButton<String>(
                            value: _selectedFromCurrency,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Color(0x0f26278d),
                            ),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 3, 20, 117),
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            underline: Container(),
                            items: ['MDL', 'USD'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedFromCurrency = newValue!;
                                _convertCurrency();
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 153,
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              color: Colors.black),
                          decoration: InputDecoration(
                            hintText: '1000.00',
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Roboto',
                                color: Colors.black),
                            filled: true,
                            fillColor: const Color(0xFFEFEFEF),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) {
                            _convertCurrency();
                          },
                        ),
                      ),
                    ],
                  ),
                  //aliniere linie
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey[300],
                              thickness: 1.5,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF26278D),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Image.asset(
                            '../assets/vectors.png',
                            fit: BoxFit.cover,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //converter_amount_sizedbox
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Converted Amount',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('../assets/usa.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          DropdownButton<String>(
                            value: _selectedToCurrency,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey,
                            ),
                            style: const TextStyle(
                              color: Color(0xFF26278D),
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            underline: Container(),
                            items: ['USD', 'MDL'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedToCurrency = newValue!;
                                _convertCurrency();
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 153,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFEFEF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          child: Text(
                            _convertedAmount.toStringAsFixed(2),
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Indicative Exchange Rate',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  '1 USD = ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto'),
                ),
                SizedBox(
                  width: 70,
                  child: TextField(
                    controller: _exchangeRateController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    onChanged: (value) {
                      _convertCurrency();
                    },
                    decoration: InputDecoration(
                      hintText: _exchangeRate.toString(),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 252, 250, 250),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const Text(
                  ' MDL',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
