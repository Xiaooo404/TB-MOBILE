import 'package:flutter/material.dart';
import 'package:TB_MOBILE/models/stock.dart';
import 'package:TB_MOBILE/providers/stock/stock_details_screen.dart';
import 'package:TB_MOBILE/providers/stock/stock_form_screen.dart';
import 'package:TB_MOBILE/services/stock_service.dart';
import 'package:TB_MOBILE/widgets/custom_navigator.dart';

class StockPages extends StatefulWidget {
  const StockPages({Key? key}) : super(key: key);

  @override
  State<StockPages> createState() => _StockPagesState();
}

class _StockPagesState extends State<StockPages> {
  late Future<List<Stock>> listStock;
  final StockService = StockApi();

  @override
  void initState() {
    super.initState();
    listStock = StockService.fetchStocks();
  }

  void refreshStocks() {
    setState(() {
      listStock = StockService.fetchStocks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stock List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.brown, // Ubah warna AppBar menjadi coklat
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white), // Ubah warna ikon menjadi putih
            onPressed: () => Navigator.of(context).popAndPushNamed('/add-stock'),
          ),
        ],
      ),
      body: Container(
        color: Colors.brown[50], // Ubah warna background menjadi krem
        child: FutureBuilder<List<Stock>>(
          future: listStock,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Stock> isiStock = snapshot.data!;
              return ListView.builder(
                itemCount: isiStock.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            stocks: isiStock[index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.brown[100], // Ubah warna kartu menjadi krem
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isiStock[index].nama,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.brown, // Ubah warna teks menjadi coklat
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Stock: ${isiStock[index].qty}',
                                  style: const TextStyle(
                                    color: Colors.black, // Ubah warna teks menjadi hitam
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StockFormPage(
                                          stock: isiStock[index],
                                        ),
                                      ),
                                    ).then((_) => refreshStocks());
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    bool response =
                                        await StockService.deleteStock(
                                            isiStock[index].id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: response
                                            ? Colors.green
                                            : Colors.red,
                                        content: Text(response
                                            ? "Stock deleted successfully"
                                            : "Failed to delete stock"),
                                      ),
                                    );
                                    refreshStocks();
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error}",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(type: 'stock'),
    );
  }
}
