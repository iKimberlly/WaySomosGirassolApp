import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WaySomoGirasol!"),
        titleTextStyle: TextStyle(color: Color(0xFFFFFFFF)),
        backgroundColor: Color(0xFFFFAB00),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFFFFFFF),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Caixa de texto explicando a plataforma
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFFFFAB00)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bem-vindo ao WaySomoGirasol!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Nossa plataforma conecta você a psicólogos especializados, oferecendo suporte emocional de maneira prática e acessível. Escolha um psicólogo que atenda às suas necessidades e marque sua sessão agora mesmo!",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "• Descubra como a terapia pode melhorar sua vida.\n"
                          "• Encontre profissionais com diferentes especialidades.\n"
                          "• Acompanhe seu progresso de onde estiver.",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Botão com menu suspenso
              ElevatedButton(
                onPressed: () {
                  _showMenu(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFAB00),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Menu de Opções",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para exibir o menu suspenso
  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildMenuOption(
                context,
                "Sobre a Plataforma",
                Icons.info,
                '/sobre', // Rota ajustada
              ),
              _buildMenuOption(
                context,
                "Login de Usuário",
                Icons.login,
                '/login', // Rota ajustada
              ),
              _buildMenuOption(
                context,
                "Cadastro de Psicólogo",
                Icons.person_add,
                '/cadastro_psicologo', // Rota ajustada
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget auxiliar para criar opções no menu suspenso
  Widget _buildMenuOption(
      BuildContext context,
      String title,
      IconData icon,
      String routeName,
      ) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFFFFAB00)),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Fecha o menu
        Navigator.pushNamed(context, routeName); // Navega para a rota
      },
    );
  }
}
