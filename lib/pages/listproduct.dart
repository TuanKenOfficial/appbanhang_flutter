import 'package:appbanhang/pages/homepages.dart';
import 'package:appbanhang/widgets/singleproduct.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  final String name;
  const ListProduct({super.key, required this.name});

  //UI load sản phẩm
  Widget _buildFeatureProduct(String name, double price, String image) {
    return Card(
      child: Container(
        height: 220,
        width: 150,
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/images/$image")),
              ),
            ),
            Text(
              "\$ $price",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }

  //UI tìm kiếm - nỗi bật - xem tất cả
  Widget _buildHeader() {
    return Container(
      child: Column(
        children: [
          Container(
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Danh sách sản phẩm",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => HomePages(),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          _buildHeader(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 690,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                SingleProduct(name: "Gỏi cuốn", price: 2.0, image: "doan.jpg"),
                SingleProduct(
                    name: "Trứng chiên xà lách",
                    price: 2.0,
                    image: "doan1.jpg"),
                SingleProduct(
                    name: "Hamburger", price: 10.0, image: "hamberger.jpg"),
                SingleProduct(name: "Bánh mì", price: 2.0, image: "banhmi.jpg"),
                SingleProduct(name: "Kem", price: 2.0, image: "kem.jpg"),
                SingleProduct(
                    name: "Sandwich", price: 2.0, image: "sanwick.jpg"),
                SingleProduct(
                    name: "Thịt bò", price: 30.0, image: "thit_bo.jpg"),
                SingleProduct(
                    name: "Thịt heo", price: 35.0, image: "thit_heo.jpg"),
                SingleProduct(
                    name: "Thịt gà", price: 25.0, image: "thit_ga.jpg"),
                SingleProduct(
                    name: "Dép lê", price: 35.0, image: "shoe_dep.jpg"),
                SingleProduct(
                    name: "Giày snecker", price: 40.0, image: "shoe.jpeg"),
                SingleProduct(name: "Cá", price: 25.0, image: "fish.jpg"),
                SingleProduct(
                    name: "Quần áo", price: 25.0, image: "clothes.jpg"),
                SingleProduct(
                    name: "Quần áo", price: 25.0, image: "clothes1.jpg"),
                SingleProduct(name: "Giày", price: 25.0, image: "shoe1.jpg"),
                SingleProduct(name: "Giày", price: 25.0, image: "shoe2.jpg"),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
