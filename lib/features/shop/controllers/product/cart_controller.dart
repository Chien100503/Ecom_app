import 'package:ecom_app/common/widgets/loader/loader.dart';
import 'package:ecom_app/features/checkout/cart/cart.dart';
import 'package:ecom_app/features/shop/controllers/variation_controller.dart';
import 'package:ecom_app/features/shop/models/cart_item_model.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:ecom_app/utils/constants/enums.dart';
import 'package:ecom_app/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  void addToCart(ProductModel product) {
    // quantity check
    if (productQuantityInCart.value < 1) {
      ECustomSnackBar.customToast(message: 'Select quantity');
      return;
    }

    if (product.productType == ProductType.variable.toString() &&
        variationController.selectVariation.value.id.isEmpty) {
      ECustomSnackBar.customToast(message: 'Select variation');
      return;
    }

    // Out of stock
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectVariation.value.stock < 1) {
        ECustomSnackBar.showWarning(
            title: 'Oh snap!', message: 'Selected variation is out of stock.');
        return;
      }
    } else {
      if (product.stock < 1) {
        ECustomSnackBar.showWarning(
            title: 'Oh snap!', message: 'Selected variation is out of stock.');
        return;
      }
    }
    // converts the productModel to a cartItemModel with the given quantity
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    // check if already added in the cart
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    ECustomSnackBar.customToast(
      onTap: () => Get.to(()=> const CartScreen()),
        note: 'Click, go to the Cart screen',
        message: 'Your product has been added to the cart!');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);

    if (index >= 0) {
      if(cartItems[index].quantity >1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1 ? removeFromCartDialog(index) :cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        ECustomSnackBar.customToast(message: 'Product removed from the cart');
        Get.back();
      },
      onCancel: () => () => Get.back()
    );
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      final variationId = variationController.selectVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }


  // This function converts a productModel to a CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }
    final variation = variationController.selectVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;
    return CartItemModel(
      productId: product.id,
      quantity: quantity,
      price: price,
      title: product.title,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculateNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculateNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculateNoOfItems;
  }

  saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    ELocalStorage.instance().writeData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings =
        ELocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
        (item) => item.productId == productId && variationId == variationId,
        orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
