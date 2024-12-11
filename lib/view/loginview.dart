import 'package:flutter/material.dart';
import 'package:waysomosgirasol/view/cadclienteview.dart';
import 'package:waysomosgirasol/view/listapsiview.dart';
import 'package:waysomosgirasol/controller/clientecontroller.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>(); //utilizei para  identificar o estado de um formulário
  String email = ""; // ou le possibilita operações como validação dos campos ou reset do formulário.
  String senha = "";// que no fim nao funcional muito bem

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  'assets/img/file.png',
                  height: 180,
                ),
              ),
              SizedBox(height: 5),

              // Campo de Email
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                onChanged: (value) => email = value,
                validator: (value) {
                  if (value == null || value.isEmpty) { //verifica se o valor for null (não existe) ou estiver vazio (""), ira aparecer a mensagem
                    return "Por favor, insira seu email.";
                  }
                  String emailPattern =
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'; // regras que serão verificadas para determinar se o email é válido.
                  if (!RegExp(emailPattern).hasMatch(value)) { // primeira parte define os text ou numeros, segunda deve vim o @ junto com texto
                    return "Insira um email válido."; // terceiro terminar com um ponto segindo por um dominio
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Campo de Senha
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                onChanged: (value) => senha = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, insira sua senha.";
                  }
                  if (value.length < 6) {
                    return "A senha deve ter no mínimo 6 caracteres.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Botão de Login
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Validação bem-sucedida
                    _login();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: Text("Entrar"),
              ),
              SizedBox(height: 20),

              // Botão para Cadastrar
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadClienteView(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.orange),
                ),
                child: Text(
                  "Ainda não é cadastrado?",
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    // Valida se o formulário é válido antes de tentar fazer o login
    if (_formKey.currentState!.validate()) {
      // Chama o método de autenticação do ClienteController
      ClienteController clienteController = ClienteController({});
      bool autenticado = await clienteController.autenticar(email, senha);

      if (autenticado) {
        // Login bem-sucedido
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login realizado com sucesso!"),
            backgroundColor: Colors.green,
          ),
        );

        // Redireciona para ListaPsiView
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ListaPsiView(nomeUsuario: email), //quando o login for bem sucedido sera redirecionado tela de lista de psicologo
          ),
        );
      } else {
        // Login falhou
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Email ou senha incorretos."),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
