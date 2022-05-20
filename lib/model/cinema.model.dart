import 'package:freezed_annotation/freezed_annotation.dart';

part 'cinema.model.freezed.dart';
part 'cinema.model.g.dart';

@Freezed()
class Cinema with _$Cinema {
  const factory Cinema(
      {required int id,
      required String name,
      required String phone,
      required String description,
      required String status,
      required String address,
      required String email,
      required String establishYear}) = _Cinema;

  factory Cinema.fromJson(Map<String, dynamic> json) => _$CinemaFromJson(json);
}
