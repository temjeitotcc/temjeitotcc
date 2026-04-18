import 'package:flutter/material.dart';

class TelaConfig extends StatelessWidget {
  const TelaConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1B1B),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFC107),
        title: const Text(
          "Configurações",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildItem(Icons.person, "Conta", context),
          _buildItem(Icons.notifications, "Notificações", context),
          _buildItem(Icons.lock, "Privacidade", context),
          _buildItem(Icons.palette, "Tema", context),
          _buildItem(Icons.help, "Ajuda", context),
          _buildItem(Icons.info, "Sobre", context),
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, String text, BuildContext context) {
    return Card(
      color: const Color(0xFF2A2727),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFFFC107)),
        title: Text(text, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
        onTap: () {
          if (text == "Sobre") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaSobre()),
            );
          }
        },
      ),
    );
  }
}

//----------------------------------------------------------------TELA SOBRE----------------------------------------------------------
class TelaSobre extends StatelessWidget {
  const TelaSobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1B1B),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFC107),
        title: const Text("Sobre", style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Este aplicativo foi desenvolvido para ajudar no aprendizado.\n\n"
          "Versão: 1.0\n"
          "Desenvolvedor: Guilherme\n"
          "Projeto: TCC",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
