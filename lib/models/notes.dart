import 'package:himanchuapp/models/note_model.dart';

class Notes {
  List<Note> todayNotes = List();
  List<Note> tomorrowNotes = List();
  List<Note> futureNotes = List();

  void addTomorrowNote(Note note) {
    tomorrowNotes.add(note);
  }

  void addTodayNote(String information, DateTime date) {
    todayNotes.add(Note(information, date));
  }

  void addFutureNote(Note note) {
    futureNotes.add(note);
    futureNotes.sort((Note first, Note second) =>
        first.notesDate.compareTo(second.notesDate));
  }

  void sortNotes(){
    todayNotes.forEach((note) {
      if(note.notesDate!=DateTime.now()){
        todayNotes.remove(note);
      }
    });
    tomorrowNotes.forEach((note) {
      if(note.notesDate==DateTime.now()){
        todayNotes.add(note);
        tomorrowNotes.remove(note);
      }
    });
    futureNotes.forEach((note) {
      if (note.notesDate.compareTo(new DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day + 1
      )) == 0) {
        tomorrowNotes.add(note);
        futureNotes.remove(note);
      }
    });
  }

  void addNote(Note note) {
    if (note.notesDate.compareTo(DateTime.now()) == 0) {
      todayNotes.add(note);
      return;
    }
    if (note.notesDate.compareTo(new DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 1
    )) == 0) {
      tomorrowNotes.add(note);
      return;
    }
    if(
        note.notesDate.year>DateTime.now().year||
        note.notesDate.month>DateTime.now().month||
            (note.notesDate.day>DateTime.now().day&&
             note.notesDate.month==DateTime.now().month)
    ){
      futureNotes.add(note);
      futureNotes.sort((Note first, Note second) =>
          first.notesDate.compareTo(second.notesDate));
    }
  }
}
