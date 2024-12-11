import 'package:flutter/material.dart';

class SobreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre o Way Somos Girassol"),
        titleTextStyle: TextStyle(color: Color(0xFFFFFFFF)),
        backgroundColor: Color(0xFFFFAB00),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/img/file.png',
                  height: 200,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Sobre a Plataforma",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "O Way Somo Girasol é uma plataforma inovadora que conecta pessoas a "
                    "psicólogos qualificados de forma rápida e eficiente. Nossa missão é "
                    "facilitar o acesso a suporte psicológico de qualidade, permitindo que "
                    "os usuários encontrem profissionais confiáveis online, sem sair de casa.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF555555),
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Por que usar o WaySomoGirasol?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "✔ Acesso a uma rede de psicólogos especializados.\n"
                    "✔ Sessões online seguras e confidenciais.\n"
                    "✔ Horários flexíveis para atender às suas necessidades.\n"
                    "✔ Interface simples e fácil de usar.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF555555),
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Nosso Propósito",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Acreditamos que cuidar da saúde mental deve ser acessível a todos. "
                    "Nosso objetivo é criar uma comunidade onde o apoio psicológico esteja ao alcance de todos, "
                    "contribuindo para um mundo mais saudável e equilibrado.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF555555),
                  height: 1.5,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFAB00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    child: Text(
                      "Voltar ao Início",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
