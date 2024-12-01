import 'package:flutter/material.dart';

import '../models/clothes_model.dart';

const List<Clothes> clothes = [
  Clothes(
    id: 1,
    name: 'T-Shirt 1',
    imageUrl: 'https://static.massimodutti.net/assets/public/3488/beec/9dd1435c9c5c/a82082fed545/01418212485-o7/01418212485-o7.jpg?ts=1732620936786&w=1920',
    description: 'A comfortable cotton T-Shirt.',
    price: '\$20',
  ),
  Clothes(
    id: 2,
    name: 'T-Shirt 2',
    imageUrl: 'https://static.massimodutti.net/assets/public/2750/9506/22564506a5a0/e46fd382f3c2/01414207505-o7/01414207505-o7.jpg?ts=1732620986893&w=1920',
    description: 'A comfortable cotton T-Shirt.',
    price: '\$50',
  ),
  Clothes(
    id: 3,
    name: 'T-Shirt 3',
    imageUrl: 'https://static.massimodutti.net/assets/public/6203/9ab5/280141b5977c/fef3dc5b93d5/01407209712-o7/01407209712-o7.jpg?ts=1724338195129&w=1920',
    description: 'A comfortable cotton T-Shirt.',
    price: '\$100',
  ),
  Clothes(
    id: 4,
    name: 'Jeans',
    imageUrl: 'https://static.massimodutti.net/assets/public/e346/81f6/8f2246578aeb/e77091e22260/00043053405-o14/00043053405-o14.jpg?ts=1731324662494&w=1920',
    description: 'Stylish jeans.',
    price: '\$200',
  ),
  Clothes(
    id: 5,
    name: 'Jacket',
    imageUrl: 'https://static.massimodutti.net/assets/public/cb0e/b933/4352492e98a7/8597b6f66731/03465202800-o7/03465202800-o7.jpg?ts=1731934013430&w=1920',
    description: 'Cozy jacket.',
    price: '\$300',
  ),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(title: "211027", clothes: clothes),
        "/details": (context) => const DetailScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {

  const MyHomePage({super.key, required this.title, required this.clothes});
  final String title;
  final List<Clothes> clothes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          final item = clothes[index];
          return Card(
            child: ListTile(
              leading: Image.network(item.imageUrl, fit: BoxFit.contain, alignment: Alignment.center),
              title: Text(item.name),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/details",
                  arguments: item
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {

  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Clothes;
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item.imageUrl, fit: BoxFit.contain, alignment: Alignment.center),
            const SizedBox(height: 16),
            Text(item.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(item.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text('Price: ${item.price}', style: const TextStyle(fontSize: 18, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
