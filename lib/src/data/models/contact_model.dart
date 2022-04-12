import 'package:appagenda/src/core/constants/constants.dart';

class ContactModel {
  late String email;
  late int id;
  late String name;
  late String phone;

  ContactModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  //* Construtor que converte os dados de mapa (JSON) para objeto do contato

  factory ContactModel.fromMap(Map<String, dynamic> json) => ContactModel(
        id: json[kIdColumn],
        name: json[kNameColumn],
        email: json[kEmailColumn],
        phone: json[kPhoneColumn],
      );

  //* Método que transforma o objeto do contato em Map (JSON) para armazenar no banco de dados

  Map<String, dynamic> toMap() => {
        kIdColumn: id,
        kNameColumn: name,
        kEmailColumn: email,
        kPhoneColumn: phone,
      };
}
