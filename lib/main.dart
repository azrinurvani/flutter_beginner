import 'package:flutter/material.dart';
import 'package:flutter_beginner/home_page.dart';
import 'package:flutter_beginner/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
// Secara sederhana Stateless Widget dapat diartikan sebagai Widget yang tidak dapat dirubah atau tidak akan pernah berubah.
// Contoh rill dalam penggunaan Stateless Widget biasanya yaitu untuk halaman “Tentang Aplikasi” yang berisi informasi nama atau logo aplikasi,
//versi dan lainya yang bersifat statis atau tidak perlu ada perubahan
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //menghilangkan label debug app bar
      theme: ThemeData(primarySwatch: Colors.green),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [HomePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
      ),
      body: pages[currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint(
              'Floation Action Button'); //print in terminal when click FAB
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            //setState untuk refresh view (wajib pada statefull widget)
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
