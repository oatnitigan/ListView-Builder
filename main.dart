import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuPage(),
    );
  }
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // สร้าง List<String> สำหรับเก็บเมนู
  List<String> menus = [];

  // ฟังก์ชันเพิ่มเมนู
  void addMenu() {
    setState(() {
      menus.add('เมนูที่ ${menus.length + 1}');
    });
  }

  // ฟังก์ชันลบเมนูสุดท้าย
  void removeMenu() {
    if (menus.isNotEmpty) {
      setState(() {
        menus.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu List'),
      ),
      body: Center(
        child: menus.isEmpty
            ? Text('ไม่มีเมนู', style: TextStyle(fontSize: 18))
            : ListView.builder(
                itemCount: menus.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(menus[index]),
                  );
                },
              ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // ปุ่มลบเมนูสุดท้าย
          FloatingActionButton(
            onPressed: removeMenu,
            tooltip: 'ลบเมนู',
            heroTag: null,
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          // ปุ่มเพิ่มเมนูใหม่
          FloatingActionButton(
            onPressed: addMenu,
            tooltip: 'เพิ่มเมนู',
            heroTag: null,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
