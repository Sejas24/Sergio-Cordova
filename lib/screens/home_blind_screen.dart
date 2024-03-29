import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'screens.dart';

const _kPages = <String, IconData>{
  'Perfil': Icons.person,
  'mapa': Icons.map,
  'Parientes': Icons.format_list_bulleted,
};

const _pageName = ['Perfil', 'Mapa', 'Lista'];

final _pageOption = [
  PerfilBlindScreen(),
  MapaBlindScreen(),
  ListaBlindScreen()
];

class HomeBlindScreen extends StatefulWidget {
  const HomeBlindScreen({Key? key}) : super(key: key);

  @override
  _ConvexAppExampleState createState() => _ConvexAppExampleState();
}

class _ConvexAppExampleState extends State<HomeBlindScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pageOption.length,
      initialIndex: 1,
      child: Scaffold(
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
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Color.fromRGBO(63, 63, 156, 1),
          items: <TabItem>[
            for (final entry in _kPages.entries)
              TabItem(icon: entry.value, title: entry.key),
          ],
          onTap: (int index) {
            setState(() {
              _pageOption[index];
            });
          },
        ),
      ),
    );
  }
}
