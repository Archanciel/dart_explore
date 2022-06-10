void main() {
  List<Map<String, dynamic>> myProducts = [
    {"name": "Shoes", "price": 100},
    {"name": "Pants", "price": 50},
    {"name": "Book", "price": 10},
    {"name": "Lamp", "price": 40},
    {"name": "Fan", "price": 200}
  ];

  // Selling price from low to high
  myProducts.sort((a, b) => a["price"].compareTo(b["price"]));
  print('Low to hight in price: $myProducts');

  // Selling price from high to low
  myProducts.sort((a, b) => b["price"].compareTo(a["price"]));
  print('High to low in price: $myProducts');
}