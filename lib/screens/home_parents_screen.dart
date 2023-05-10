import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'screens.dart';

const _kPages = <String, IconData>{
  'Perfil': Icons.person,
  'mapa': Icons.map,
  'Parientes': Icons.format_list_bulleted,
};

class HomeParentScreen extends StatefulWidget {
  const HomeParentScreen({Key? key}) : super(key: key);

  @override
  _ConvexAppExampleState createState() => _ConvexAppExampleState();
}

class _ConvexAppExampleState extends State<HomeParentScreen> {
  final _pageOption = [
    PerfilBlindScreen(),
    MapaBlindScreen(),
    ListaBlindScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(63, 63, 156, 1),
          title: Text("HOME BLIND"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  for (final icon in _pageOption)
                    Center(
                      child: icon,
                    ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ConvexAppBar.badge(
          const <int, dynamic>{3: '99+'},
          backgroundColor: Color.fromRGBO(63, 63, 156, 1),
          items: <TabItem>[
            for (final entry in _kPages.entries)
              TabItem(icon: entry.value, title: entry.key),
          ],
          onTap: (int i) {
            setState(() {
              _pageOption[i];
            });
          },
        ),
      ),
    );
  }
}
