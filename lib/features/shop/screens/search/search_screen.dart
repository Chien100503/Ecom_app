import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/common/widgets/loader/animation_loader.dart';
import 'package:ecom_app/features/shop/screens/product_details/product_detail.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.query = '', this.product});

  final String query;
  final ProductModel? product;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  late String _searchQuery;

  @override
  void initState() {
    super.initState();
    _searchQuery =
        widget.query.isNotEmpty ? widget.query : widget.product?.title ?? '';
    _searchController.text = _searchQuery;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: EColors.accent,
        title: TextField(
          controller: _searchController,
          onChanged: _onSearchChanged,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              filled: true,
              fillColor: EColors.thirdColor,
              hintText: 'Search...',
              suffixIcon: const Icon(Icons.search)),
        ),
      ),
      body: _searchQuery.isEmpty
          ? const EAnimationLoader(
              text: 'Please enter a search query to find products',
              animation: EImages.loaderAnimationOne)
          : StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Products')
                  .where('Title', isGreaterThanOrEqualTo: _searchQuery)
                  .where('Title', isLessThanOrEqualTo: '$_searchQuery\uf8ff')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong.'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No products found.'));
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                    var product = ProductModel.fromJson(data);
                    return ListTile(
                      title: Text(product.title),
                      subtitle: Text('Price: \$${product.price.toString()}'),
                      leading: SizedBox(
                        width: 50, // Specify the width
                        height: 50, // Specify the height
                        child: product.thumbnail.isNotEmpty
                            ? Image.network(product.thumbnail, fit: BoxFit.cover)
                            : const Icon(Icons.image, size: 50),
                      ),
                      onTap: () => Get.to(() => ProductDetail(product: product)),
                    );
                  },
                );
              },
            ),
    );
  }
}
