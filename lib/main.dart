import 'package:flutter/material.dart';
class Product {
  final String title;
  final String description;
  Product(this.title, this.description);
}
//void main() {
//  runApp(MaterialApp(
//    title: '导航',
//    home: FirstScreen(),
//  ));
//}
//void main() {
//  runApp(MaterialApp(
//    title: '导航的数据传递与接收',
//    home: ProductList(
//      // 给ProductList组件传递一个变量products；List.generates生成20个数据；原型是Product
//      products: List.generate(20, (i)=> Product('商品 $i', '商品详情编号 $i'))
//    ),
//  ));
//}
//void main () {
//  runApp(MaterialApp(
//    title: '页面的跳转并且返回数据',
//    home: FirstPage(),
//  ));
//}
void main () {
  runApp(MaterialApp(
    title: '引入静态资源图片',
    home: MyStaticPic(),
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'learn navigation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('learn navigation')
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Text('哈哈哈哈哈1', style: TextStyle(
                  fontWeight: FontWeight.w800
                ),),
                Text('哈哈哈哈哈2', style: TextStyle(
                    fontWeight: FontWeight.w800
                ),),
                Text('哈哈哈哈哈3', style: TextStyle(
                    fontWeight: FontWeight.w800
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// 父子跳转到子组件
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('导航父子组件跳转'),
      ),
      body: Center(
          child: RaisedButton(
              child: Text('进入详情了'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SecondScreen()
                ));
              }
          )
      ),
    );
  }
}
// 子组件回到父组件
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('我是第二个页面'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('返回第一个页面'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
// 导航传递接收参数
class ProductList extends StatelessWidget {
  final List<Product> products;
  ProductList({Key key, @required this.products}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
      ),
      body:ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].title),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ProductDetail(
                  product: products[index]
                )
              ));
            },
          );
        },
      )
    );
  }
}
// 导航传递接收参数
class ProductDetail extends StatelessWidget {
  final Product product;
  ProductDetail({Key key, @required this.product}):super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${product.title}'),
      ),
      body: Center(
        child: Text('${product.description}'),
      ),
    );
  }
}
// 页面的跳转并且返回数据，以及返回SnackBar
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('哈哈哈哈'),
      ),
      body: Center(
        child: RouterButton(),
      ),
    );
  }
}
class RouterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: () {_navigateToSecondPage(context);},
      child: Text('gogogo'),
    );
  }
  // _代表内部方法
  _navigateToSecondPage(BuildContext context) async{
    final result = await Navigator.push(context, MaterialPageRoute(
      builder: (context) => SecondPage()
    ));
//    Scaffold.of(context).showSnackBar(SnackBar(content: Text(result)));
  Scaffold.of(context).showSnackBar(SnackBar(content: Text('${result}')));
  }
}
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('我是子组件'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('第一个'),
              onPressed: (){
                Navigator.pop(context, '第一个: 123');
              },
            ),
            RaisedButton(
              child: Text('第二个'),
              onPressed: (){
                Navigator.pop(context, '第二个: 456');
              },
            )
          ],
        ),
      ),
    );
  }
}
class MyStaticPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Image.asset('images/pic.png'),
    );
  }
}


