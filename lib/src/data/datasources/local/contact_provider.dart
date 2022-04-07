abstract class Contact {
  late final String contactTable;
  late final String idColumn;
  late final String nameColumn;
  late final String emailColumn;
  late final String phoneColumn;

  Contact({
    required this.contactTable,
    required this.idColumn,
    required this.emailColumn,
    required this.nameColumn,
    required this.phoneColumn,
  });
}

class ConectionDb extends Contact {
  ConectionDb(
      {required String contactTable,
      required String idColumn,
      required String emailColumn,
      required String nameColumn,
      required String phoneColumn})
      : super(
            contactTable: contactTable,
            idColumn: idColumn,
            emailColumn: emailColumn,
            nameColumn: nameColumn,
            phoneColumn: phoneColumn);

  String setContactTable() {
    return contactTable = "contactTable";
  }

  String setIdColumn() {
    return idColumn = "idColumn";
  }

  String setEmailColumn() {
    return emailColumn = "emailColumn";
  }

  String setNameColumn() {
    return nameColumn = "nameColumn";
  }

  String setPhoneColumn() {
    return phoneColumn = "phoneColumn";
  }
}
