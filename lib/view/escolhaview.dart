import 'package:flutter/material.dart';
import 'package:waysomosgirasol/model/psimodel.dart';

class PsicologoEscolhidoWidget extends StatelessWidget {
  final PsiModel? psicologo;

  const PsicologoEscolhidoWidget({Key? key, required this.psicologo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (psicologo == null) {
      return Center(
        child: Text(
          "Nenhum psicólogo escolhido.",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return Card(
      elevation: 5,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Psicólogo Escolhido",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            SizedBox(height: 10),
            Text(
              "Nome: ${psicologo!.nome}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("CRP: ${psicologo!.crp}", style: TextStyle(fontSize: 14)),
            SizedBox(height: 5),
            Text("Especialidades: ${psicologo!.especialidades}", style: TextStyle(fontSize: 14)),
            SizedBox(height: 5),
            Text("Dias: ${psicologo!.dias}", style: TextStyle(fontSize: 14)),
            SizedBox(height: 5),
            Text("Horário: ${psicologo!.horario}", style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
