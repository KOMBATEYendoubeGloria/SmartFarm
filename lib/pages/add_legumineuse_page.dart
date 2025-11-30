import 'package:flutter/material.dart';
import '../data/db/crud/legumineuse_dao.dart';
import '../../models/legumineuse.dart';

class AddLegumineusePage extends StatefulWidget {
  final Legumineuse? existing;

  const AddLegumineusePage({super.key, this.existing});

  @override
  State<AddLegumineusePage> createState() => _AddLegumineusePageState();
}

class _AddLegumineusePageState extends State<AddLegumineusePage> {
  final nomCtrl = TextEditingController();
  final dao = LegumineuseDao();

  @override
  void initState() {
    super.initState();
    if (widget.existing != null) {
      nomCtrl.text = widget.existing!.nomLegumineuse ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.existing != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Modifier la légumineuse" : "Ajouter une légumineuse"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomCtrl,
              decoration: const InputDecoration(labelText: "Nom de la légumineuse"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final leg = Legumineuse(
                  idLegumineuse: widget.existing?.idLegumineuse,
                  nomLegumineuse: nomCtrl.text,
                );

                if (isEditing) {
                  await dao.updateLegumineuse(leg);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Légumineuse modifiée !")),
                  );
                } else {
                  await dao.insertLegumineuse(leg);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Légumineuse ajoutée !")),
                  );
                }

                Navigator.pop(context);
              },
              child: Text(isEditing ? "Enregistrer les modifications" : "Ajouter"),
            ),
          ],
        ),
      ),
    );
  }
}
