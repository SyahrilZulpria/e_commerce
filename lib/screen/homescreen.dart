import 'package:e_commerce/screen/priview_product.dart';
import 'package:e_commerce/screen/profile.dart';
import 'package:e_commerce/widget/product.dart';
import 'package:e_commerce/widget/widged_category.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> allProducts = [
    {
      "title": "Modern Light Clothes",
      "subtitle": "T-Shirt",
      "price": 175.99,
      "rating": 5.0,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzmfDx2z_8j4AIXa58qS5gDJ6wLhu94CNrbw&s",
    },
    {
      "title": "Light Dress Bless",
      "subtitle": "Dress",
      "price": 162.99,
      "rating": 5.0,
      "image": "https://m.media-amazon.com/images/I/9160OTE17pL._UY1100_.jpg",
    },
    {
      "title": "Modern Light Clothes",
      "subtitle": "T-Shirt",
      "price": 212.99,
      "rating": 5.0,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9f4_EpJ3G6okBCmW_i8rYVJeEncJOfFLqzQ&s",
    },
    {
      "title": "JAKET PARKA SEAMLESS DOWN",
      "subtitle": "Jacket",
      "price": 390.00,
      "rating": 4.9,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHBXGq6ErbRR9fiUEC8W0Y3VMcl-WMxCyBbQ&s",
    },
    {
      "title": "Modern Light Clothes",
      "subtitle": "T-Shirt",
      "price": 122.99,
      "rating": 5.0,
      "image": "https://m.media-amazon.com/images/I/71Fox5qcesL._UY1000_.jpg",
    },
    {
      "title": "Yellow Modern Dress",
      "subtitle": "Dress",
      "price": 210.50,
      "rating": 4.8,
      "image":
          "https://www.sabhyataclothing.com/cdn/shop/files/248DN2407_Yellow_1_18270b5b-9532-420d-8e3d-320a84d86349.jpg?v=1744018675",
    },
    {
      "title": "Modern Light Clothes",
      "subtitle": "T-Shirt",
      "price": 112.99,
      "rating": 5.0,
      "image":
          "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?w=800",
    },
    {
      "title": "JAKET SWEAT DRY STRETCH HOODIE",
      "subtitle": "Jacket",
      "price": 320.00,
      "rating": 4.9,
      "image":
          "https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/462060/sub/goods_462060_sub14_3x4.jpg?width=494",
    },
  ];

  String selectedCategory = "All Items";
  final List<String> categories = ["All Items", "Dress", "T-Shirt", "Jacket"];
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get filteredProducts {
    return allProducts.where((p) {
      final matchesCategory =
          selectedCategory == "All Items"
              ? true
              : p["subtitle"].toString().toLowerCase().contains(
                selectedCategory.toLowerCase(),
              );
      final matchesSearch =
          searchController.text.isEmpty
              ? true
              : p["title"].toString().toLowerCase().contains(
                searchController.text.toLowerCase(),
              );
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hello, Welcome 👋",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Albert Stevano",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Search bar
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.grey),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              onChanged: (_) {
                                setState(() {}); // refresh setiap ketikan
                              },
                              decoration: const InputDecoration(
                                hintText: "Search clothes...",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.tune, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Category buttons
              WidgetCategory(
                categories: categories,
                selectedCategory: selectedCategory,
                onCategorySelected: (cat) {
                  setState(() {
                    selectedCategory = cat;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Product Grid
              Expanded(
                child: GridView.builder(
                  itemCount: filteredProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => ProductPreviewScreen(product: product),
                          ),
                        );
                      },
                      child: Hero(
                        tag:
                            product["title"], // gunakan tag unik agar Hero bekerja
                        child: ProductCard(product: product),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
