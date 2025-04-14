import 'package:flutter/material.dart';



class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantity = 1;
  int _currentImage = 0;

  final List<String> imageList = [
    'assets/images/Banderillas.jpg',
    'assets/images/Banderillas2.jpg',
    'assets/images/Banderillas3.jpg',
  ];

  void addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Banderillas se agregó al carrito')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Detalles del Producto', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 220,
                child: PageView.builder(
                  itemCount: imageList.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentImage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      imageList[index],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imageList.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImage == index ? Colors.black : Colors.black26,
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            const Text(
              'Banderillas',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/vendedor_avatar.png'),
                  radius: 16,
                ),
                SizedBox(width: 8),
                Text(
                  'James Hernández',
                  style: TextStyle(color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Carrera: Ingeniería en Sistemas Computacionales\nSemestre: Séptimo\nTurno: Matutino',
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text(
              'Precio: \$25.00 MXN',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                    ),
                    Text(
                      '$quantity',
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle, color: Colors.black),
                      onPressed: () {
                        setState(() {

                          if (quantity < 10) { // Set an appropriate maximum
                                   quantity++;
                               }
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: addToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Agregar al carrito', style: TextStyle(color: Colors.white)),
                )
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Descripción',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              'Deliciosas banderillas de salchicha empanizadas, crujientes y doradas. Perfectas para un snack o antojo callejero.',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
