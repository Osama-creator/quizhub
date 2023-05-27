import 'package:equatable/equatable.dart';

class CityModel extends Equatable {
  final String? id;
  final String arName;
  final String enName;

  const CityModel({
    this.id,
    required this.arName,
    required this.enName,
  });

  CityModel copyWith({
    String? id,
    String? arName,
    String? enName,
  }) {
    return CityModel(
      id: id ?? this.id,
      arName: arName ?? this.arName,
      enName: enName ?? this.enName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'governorate_name_ar': arName,
      'governorate_name_en': enName,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['_id'] as String,
      arName: map['governorate_name_ar'] as String,
      enName: map['governorate_name_en'] as String,
    );
  }

  @override
  List<Object> get props {
    return [
      arName,
      enName,
    ];
  }
}
