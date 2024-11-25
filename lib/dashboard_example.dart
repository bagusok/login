import 'package:flutter/material.dart';

class DashboardExample extends StatefulWidget {
  const DashboardExample({super.key});

  @override
  State<DashboardExample> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardExample> {
  List<Note> _notes = [];

  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  void _addNote(Note note) {
    setState(() {
      // [..._notes, note];
      _notes.add(note);
    });
  }

  void _deleteNote() {
    List<Note> filteredNotes =
        _notes.where((note) => note.isChecked == false).toList();
    setState(() {
      _notes = filteredNotes;
    });
  }

  void _chekedNote(Note note) {
    var findIndex = _notes.indexOf(note);
    setState(() {
      if (_notes[findIndex].isChecked) {
        _notes[findIndex].isChecked = false;
      } else {
        _notes[findIndex].isChecked = true;
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_notes);
    return Scaffold(
      backgroundColor: Colors.indigo.shade50.withOpacity(0.5),
      floatingActionButton: IconButton(
          onPressed: () {
            showDialogAddNote(context);
          },
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          style: IconButton.styleFrom(
              backgroundColor: Colors.blue, padding: EdgeInsets.all(16))),
      body: Column(
        children: [
          _notes.where((note) => note.isChecked == true).isEmpty
              ? const SizedBox()
              : Container(
                  color: Colors.blue.withOpacity(0.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            _deleteNote();
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ],
                  ),
                ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: _notes.isEmpty
                  ? Center(child: Text("No Notes"))
                  : ListNote(notes: _notes, onChecked: _chekedNote),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showDialogAddNote(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Add Note"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(hintText: "Title"),
                  ),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    controller: _bodyController,
                    decoration: InputDecoration(hintText: "Body"),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty) {
                        _addNote(
                          Note(_titleController.text, _bodyController.text),
                        );

                        _titleController.text = "";
                        _bodyController.text = "";

                        Navigator.pop(context);
                      }
                    },
                    child: Text("Save"))
              ],
            ));
  }
}

class ListNote extends StatelessWidget {
  final List<Note> notes;
  final Function(Note note) onChecked;

  ListNote({
    super.key,
    required this.notes,
    required this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            tileColor: Colors.white,
            title: Text(notes[index].title),
            subtitle: Text(
              notes[index].body,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Checkbox(
                value: notes[index].isChecked,
                onChanged: (value) {
                  onChecked(notes[index]);
                }),
          ),
        );
      },
    );
  }
}

class Note {
  String title;
  String body;
  bool isChecked;

  Note(this.title, this.body, {this.isChecked = false});
}
