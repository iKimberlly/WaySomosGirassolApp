import 'package:waysomosgirasol/view/loginview.dart';
import 'package:waysomosgirasol/view/homeview.dart';
import 'package:waysomosgirasol/view/cadclienteview.dart';
import 'package:waysomosgirasol/view/sobreview.dart';
import 'package:waysomosgirasol/view/listapsiview.dart';
import 'package:waysomosgirasol/view/cadpsiview.dart';
import 'package:waysomosgirasol/view/escolhaview.dart';
import 'package:waysomosgirasol/model/psimodel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Way());
}

class Way extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Way Somos Girassol',
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeView(),
        '/login': (context) => LoginView(),
        '/cadastro_cliente': (context) => CadClienteView(),
        '/cadastro_psicologo': (context) => CadPsiView(),
        '/sobre': (context) => SobreView(),
      },
      // Rotas com argumentos
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/lista_psicologos':
            final args = settings.arguments as String; // Nome do usuário como argumento
            return MaterialPageRoute(
              builder: (context) => ListaPsiView(nomeUsuario: args),
            );
          case '/psi_escolhido':
            final args = settings.arguments as PsiModel; // Modelo do psicólogo escolhido como argumento
            return MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(title: Text("Psicólogo Escolhido")),
                body: PsicologoEscolhidoWidget(psicologo: args),
              ),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(title: Text("Erro")),
                body: Center(
                  child: Text(
                    "Rota não encontrada: ${settings.name}",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ),
              ),
            );
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
