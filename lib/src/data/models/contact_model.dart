import 'package:appagenda/src/core/constants/constants.dart';
import 'package:appagenda/src/data/repositories/contatc_abstract.dart';

class ContactModel implements ContactAbstract {
  @override
  late String email;

  @override
  late int id;

  @override
  late String name;

  @override
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
