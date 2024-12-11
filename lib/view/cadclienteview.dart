import 'package:waysomosgirasol/controller/clientecontroller.dart';
import 'package:flutter/material.dart';

class CadClienteView extends StatelessWidget {
  String nome = "";
  String email = "";
  String senha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastro de Clientes",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Cadastro de Clientes",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildTextField(
                label: "Digite seu nome",
                icon: Icons.person,
                onChanged: (value) => nome = value,
              ),
              _buildTextField(
                label: "Digite seu e-mail",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => email = value,
              ),
              _buildTextField(
                label: "Digite sua senha",
                icon: Icons.lock,
                obscureText: true,
                onChanged: (value) => senha = value,
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () async {
                  if (_areFieldsEmpty()) {
                    _showSnackbar(context, "Por favor, preencha todos os campos!");
                    return;
                  }

                  if (senha.length < 6) {
                    _showSnackbar(context, "A senha deve ter no mínimo 6 caracteres!");
                    return;
                  }

                  final map = {
                    'nome': nome,
                    'email': email,
                    'senha': senha,
                  };

                  final controller = ClienteController(map);
                  int resposta = await controller.inserir();

                  if (resposta == -1) {
                    _showSnackbar(context, "Erro ao registrar. Tente novamente!");
                  } else {
                    _showSnackbar(context, "Cadastro realizado com sucesso!");
                  }
                },
                child: Text(
                  'Registrar',
                  style: TextStyle(fontSize: 16),
                ),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10), //para criar espaçamentos simétricos
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // deixa o botão  retangular com bordas arredondadas.
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _areFieldsEmpty() { //utilizei para verificar se os campos estao vazios
    return nome.isEmpty || email.isEmpty || senha.isEmpty;
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  Widget _buildTextField({ //criar os campos personalizados com icon e todos serem obrigadorio
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
