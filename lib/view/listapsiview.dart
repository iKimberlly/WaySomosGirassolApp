import 'package:waysomosgirasol/controller/psicontroller.dart';
import 'package:waysomosgirasol/model/psimodel.dart';
import 'package:waysomosgirasol/view/escolhaview.dart.';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaPsiView extends StatefulWidget {
  final String nomeUsuario;

  ListaPsiView({required this.nomeUsuario});

  @override
  _ListaPsiView createState() => _ListaPsiView();
}

class _ListaPsiView extends State<ListaPsiView> {
  PsiController psiController = PsiController({});
  PsiModel? psicologoEscolhido;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolha seu Psicólogo"),
        backgroundColor: Color(0xFFFFAB00),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder<List<PsiModel>>(
                future: psiController.getPsi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Erro ao carregar psicólogos!"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("Nenhum psicólogo encontrado."));
                  } else {
                    final psicologos = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: psicologos.length,
                      itemBuilder: (context, index) {
                        final psi = psicologos[index];
                        return Card(
                          elevation: 5,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        psi.nome,
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      Text("CRP: ${psi.crp}", style: TextStyle(fontSize: 14, color: Colors.grey)),
                                      Text("Especialidades: ${psi.especialidades}", style: TextStyle(fontSize: 14)),
                                      Text("Dias: ${psi.dias}", style: TextStyle(fontSize: 14)),
                                      Text("Horário: ${psi.horario}", style: TextStyle(fontSize: 14)),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(CupertinoIcons.arrow_right, color: Colors.orange),
                                  onPressed: () {
                                    _escolherPsicologo(context, psi);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              // Botão para redirecionar para PsicologoEscolhidoWidget
              ElevatedButton(
                onPressed: psicologoEscolhido != null
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text("Psicólogo Escolhido"),
                          backgroundColor: Colors.orange,
                        ),
                        body: PsicologoEscolhidoWidget(psicologo: psicologoEscolhido),
                      ),
                    ),
                  );
                }
                    : null, // Desativa o botão se nenhum psicólogo foi escolhido
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  disabledBackgroundColor: Colors.grey,
                ),
                child: Text("Ver Psicólogo Escolhido"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _escolherPsicologo(BuildContext context, PsiModel psi) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirmar Escolha"),
          content: Text("Deseja marcar consulta com ${psi.nome}?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  psicologoEscolhido = psi;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Psicólogo ${psi.nome} escolhido!")),
                );
              },
              child: Text("Confirmar"),
            ),
          ],
        );
      },
    );
  }
}
