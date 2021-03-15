import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:prov_test/models/product.dart';
import 'package:prov_test/providers/cartProvider.dart';
import 'package:prov_test/providers/themeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => CartProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: Provider.of<ThemeProvider>(context).getTheme
          ? ThemeMode.dark
          : ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> products = <Product>[
    Product("pro1", 1, 1500),
    Product("pro2", 1, 1800),
    Product("pro3", 1, 900),
    Product("pro4", 1, 850)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My title"),
          centerTitle: true,
          actions: [
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Badge(
                  badgeContent: Text(
                    Provider.of<CartProvider>(context).getLength.toString(),
                    style: TextStyle(fontSize: 10),
                  ),
                  child: Icon(Icons.add_shopping_cart),
                  badgeColor: Colors.yellowAccent,
                  //animationType: BadgeAnimationType.scale,
                ))
          ],
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wb_sunny),
                  Switch(
                      value: Provider.of<ThemeProvider>(
                        context,
                      ).getTheme,
                      onChanged: (val) {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .changeTheme();
                        print(val);
                      }),
                  Icon(Icons.brightness_3)
                ],
              )
            ],
          ),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (_, i) {
                return Container(
                  padding: EdgeInsets.all(16),
                  child: Card(
                    child: Row(
                      children: [
                        Text(products[i].name),
                        MaterialButton(
                          color: Colors.blue,
                          shape: CircleBorder(),
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .addToCart(products[i]);
                            //   print(Provider.of<CartProvider>(context,listen: false).getLength);
                            print(products[i].name);
                          },
                          child: Icon(Icons.add),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
