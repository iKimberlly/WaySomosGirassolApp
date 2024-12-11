import 'package:flutter/material.dart';
import 'package:waysomosgirasol/controller/psicontroller.dart';

class CadPsiView extends StatefulWidget {
  @override
  _CadPsiViewState createState() => _CadPsiViewState();
}

class _CadPsiViewState extends State<CadPsiView> {
  String crp = "";
  String nome = "";
  String email = "";
  String especialidades = "";
  String dias = "";
  String horario = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Psicólogos"),
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
                "Cadastro de Psicólogos",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              _buildTextField(
                label: "Digite seu nome",
                icon: Icons.person,
                onChanged: (value) => nome = value,
              ),

              _buildTextField(
                label: "Digite seu CRP",
                icon: Icons.badge,
                onChanged: (value) => crp = value,
              ),

              _buildTextField(
                label: "Digite seu email",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => email = value,
              ),

              _buildTextField(
                label: "Digite suas especialidades",
                icon: Icons.psychology,
                onChanged: (value) => especialidades = value,
              ),

              _buildTextField(
                label: "Digite seus dias",
                icon: Icons.calendar_today,
                onChanged: (value) => dias = value,
              ),

              _buildTextField(
                label: "Digite seus horários",
                icon: Icons.access_time,
                onChanged: (value) => horario = value,
              ),

              SizedBox(height: 20),

              OutlinedButton(
                onPressed: () async {
                  if (_areFieldsEmpty()) {
                    _showSnackbar(context, "Por favor, preencha todos os campos!");
                    return;
                  }

                  if (crp.length != 6 || !RegExp(r'^[0-9]+$').hasMatch(crp)) {
                    _showSnackbar(context, "O CRP deve conter exatamente 6 números!");
                    return;
                  }

                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
                    _showSnackbar(context, "Por favor, insira um e-mail válido!");
                    return;
                  }

                  Map<String, dynamic> map = {
                    'crp': crp,
                    'nome': nome,
                    'email': email,
                    'especialidades': especialidades,
                    'dias': dias,
                    'horario': horario,
                  };

                  final controller = PsiController(map);
                  int resposta = await controller.inserir();
                  if (resposta == 1) {
                    _showSnackbar(context, "Cadastro realizado com sucesso!");
                    setState(() {
                      crp = '';
                      nome = '';
                      email = '';
                      especialidades = '';
                      dias = '';
                      horario = '';
                    });
                  } else {
                    _showSnackbar(context, "Houve um erro no cadastro.");
                  }
                },
                child: Text('Registrar', style: TextStyle(fontSize: 16)),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _areFieldsEmpty() {
    return crp.isEmpty ||
        nome.isEmpty ||
        email.isEmpty ||
        especialidades.isEmpty ||
        dias.isEmpty ||
        horario.isEmpty;
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 3)),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        onChanged: onChanged,
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
