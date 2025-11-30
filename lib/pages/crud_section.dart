import 'package:flutter/material.dart';
import '../../../models/section.dart';
import '../data/db/crud/section_dao.dart';
import 'crud_choice_section.dart';

class CrudSection extends StatefulWidget {
  final CrudMode mode;

  const CrudSection({super.key, required this.mode});

  @override
  State<CrudSection> createState() => _CrudSectionState();
}

class _CrudSectionState extends State<CrudSection> {
  final SectionDao _dao = SectionDao();
  final TextEditingController superficieCtrl = TextEditingController();

  List<Section> sections = [];
  Section? selected;

  @override
  void initState() {
    super.initState();
    _loadSections();
  }

  Future<void> _loadSections() async {
    sections = await _dao.getAllSections();
    setState(() {});
  }

  Future<void> _save() async {
    if (widget.mode == CrudMode.create) {
      await _dao.insertSection(
        Section(
          superficieSection: double.tryParse(superficieCtrl.text) ?? 0.0,
        ),
      );
    } else if (widget.mode == CrudMode.update && selected != null) {
      await _dao.updateSection(
        Section(
          idSection: selected!.idSection,
          superficieSection: double.parse(superficieCtrl.text),
        ),
      );
    } else if (widget.mode == CrudMode.delete && selected != null) {
      await _dao.deleteSection(selected!.idSection!);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final bool isUpdate = widget.mode == CrudMode.update;
    final bool isDelete = widget.mode == CrudMode.delete;
    final bool isCreate = widget.mode == CrudMode.create;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        title: Text(
          isCreate
              ? "Créer une Section"
              : isUpdate
                  ? "Modifier une Section"
                  : "Supprimer une Section",
        ),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isCreate) ...[
              const Text(
                "Sélectionner une Section",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),

              DropdownButtonFormField<Section>(
                value: selected,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                items: sections
                    .map(
                      (s) => DropdownMenuItem(
                        value: s,
                        child: Text("Section #${s.idSection}"),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selected = value;

                    if (isUpdate) {
                      superficieCtrl.text =
                          selected!.superficieSection.toString();
                    }
                  });
                },
              ),
              const SizedBox(height: 30),
            ],

            if (!isDelete) ...[
              const Text(
                "Superficie (ha)",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),

              TextField(
                controller: superficieCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Ex : 12.4",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isDelete ? Colors.red : Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isCreate
                      ? "Créer"
                      : isUpdate
                          ? "Mettre à jour"
                          : "Supprimer",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
