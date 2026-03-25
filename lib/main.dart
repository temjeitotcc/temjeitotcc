import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final PageController _controller = PageController();

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });

    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: const [
          Center(child: Text("Guigs")),
          Center(child: Text("Luiza")), // corrigido espaço
          StudyScreen(),
          Center(child: Text("David")),
          Center(child: Text("Atualiza")),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Estudos"),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: "Ranking",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Config"),
        ],
      ),
    );
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------

class StudyScreen extends StatelessWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1B1B),
      body: Column(
        children: [
          // 🔶 TOPO AMARELO
          Container(
            color: const Color(0xFFFFC107),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.person, color: Colors.black, size: 28),
                Text(
                  "Tela de estudo",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // 🔥 BOTÕES
          Expanded(
            child: Stack(
              children: [
                // BOTÕES POSICIONADOS
                _buildButton("1", Alignment(0, -0.2)),
                _buildButton("2", Alignment(0.6, -0.1)),
                _buildButton("3", Alignment(0.6, 0.2)),
                _buildButton("4", Alignment(0, 0.3)),
                _buildButton("5", Alignment(-0.6, 0.2)),
                _buildButton("6", Alignment(-0.6, -0.1)),

                // ▶ BOTÃO CENTRAL
                Align(
                  alignment: const Alignment(0, 1.2),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE0B000),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Icons.play_arrow,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFC107),
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(28),
          elevation: 8,
        ),
        onPressed: () {
          print("Botão $text clicado");
        },
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
