import 'package:flutter/material.dart';
import 'package:rool/criarpost.dart';
import 'package:rool/curtcomen.dart';
import 'package:rool/perfil.dart';
import 'package:rool/pesquisar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _pages = List.generate(
    5,
    (index) => _buildPage(index),
  );
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static Widget _buildPage(int index) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildUserInfo(),
              const SizedBox(height: 20),
              _buildMessageCard(index),
              SizedBox(height: 20),
              _buildInteractionBar(),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9Etrj7SYknitFM3_TL7O2S1YoU7yswbXBLQ&s'),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gabriel',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '@Gabriel2432',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Expanded(child: SizedBox(width: 10)),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'Seguir',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildMessageCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'É importante agradecer pelo hoje sem nunca desistir do amanhã! ${index + 10}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildInteractionBar() {
    return BuildLikeAndCommentButtons();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey.shade900,
        body: Stack(
          children: [
            PageView(
              scrollDirection: Axis.vertical,
              children: _pages,
            ),
            _buildAppBar(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: kToolbarHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              child: Image.asset('images/logo.png'),
            ),
            SizedBox(width: 10),
            Text(
              "Rool",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            const Spacer(),
            IconButton(
              icon: CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                  'https://www.hubspot.com/hubfs/media/fotodeperfil.jpeg#keepProtocol',
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Container(
        height: kBottomNavigationBarHeight,
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, selectedIndex == 0, () {
              onItemTapped(0);
            }),
            _buildNavItem(Icons.search, selectedIndex == 1, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pesquisar(),
                  ));
            }),
            _buildNavItem(Icons.add, selectedIndex == 2, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TwitterCloneApp(),
                  ));

              onItemTapped(2);
            }),
            _buildNavItem(Icons.notifications, selectedIndex == 3, () {
              onItemTapped(3);
            }),
            _buildNavItem(Icons.person, selectedIndex == 4, () {
              onItemTapped(4);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(kBottomNavigationBarHeight / 2),
      child: Ink(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              isSelected ? Colors.white.withOpacity(0.2) : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
          size: 24.0,
        ),
      ),
    );
  }
}
