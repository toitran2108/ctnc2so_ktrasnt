import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(appcuatoi());
}

class appcuatoi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: trangchuapp());
  }
}

class trangchuapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return trangchuState();
  }
}

class trangchuState extends State<trangchuapp> {
  final TextEditingController dkhien_a = TextEditingController();
  final TextEditingController dkhien_b = TextEditingController();
  final TextEditingController dkhien_snt = TextEditingController();
  String kq = '';

  void kiemtraSNT() {
    final int? n = int.tryParse(dkhien_snt.text);
    if (n == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng nhập một số hợp lệ!')),
      );
      return;
    }
    if (n < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$n không phải là số nguyên tố')),
      );
      return;
    }
    for (int i = 2; i <= sqrt(n); i++) {
      if (n % i == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$n không phải là số nguyên tố')),
        );
        return;
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$n là số nguyên tố')),
    );
  }

  void tinhCTNC(String phepToan) {
    final double? a = double.tryParse(dkhien_a.text);
    final double? b = double.tryParse(dkhien_b.text);

    if (a == null || b == null) {
      setState(() {
        kq = 'Vui lòng nhập số hợp lệ!';
      });
      return;
    }

    double kqTinh;
    switch (phepToan) {
      case 'cong':
        kqTinh = a + b;
        break;
      case 'tru':
        kqTinh = a - b;
        break;
      case 'nhan':
        kqTinh = a * b;
        break;
      case 'chia':
        if (b == 0) {
          setState(() {
            kq = 'Không thể chia cho 0';
          });
          return;
        }
        kqTinh = a / b;
        break;
      default:
        return;
    }

    setState(() {
      kq = 'Kết quả: $kqTinh';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CTNC 2 Số Và Kiểm Tra SNT'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                controller: dkhien_a,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập số a',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: TextField(
                controller: dkhien_b,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập số b',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 20),
            Text(kq, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  child: Text('+'),
                  onPressed: () => tinhCTNC('cong'),
                ),
                FloatingActionButton(
                  child: Text('-'),
                  onPressed: () => tinhCTNC('tru'),
                ),
                FloatingActionButton(
                  child: Text('*'),
                  onPressed: () => tinhCTNC('nhan'),
                ),
                FloatingActionButton(
                  child: Text('/'),
                  onPressed: () => tinhCTNC('chia'),
                ),
              ],
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 250,
              child: TextField(
                controller: dkhien_snt,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập vào một số để kiểm tra',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: kiemtraSNT,
              child: Text('Kiểm tra Số Nguyên Tố'),
            ),
          ],
        ),
      ),
    );
  }
}
