// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cinema.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cinema _$CinemaFromJson(Map<String, dynamic> json) {
  return _Cinema.fromJson(json);
}

/// @nodoc
mixin _$Cinema {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get establishYear => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CinemaCopyWith<Cinema> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CinemaCopyWith<$Res> {
  factory $CinemaCopyWith(Cinema value, $Res Function(Cinema) then) =
      _$CinemaCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String phone,
      String description,
      String status,
      String address,
      String email,
      String establishYear});
}

/// @nodoc
class _$CinemaCopyWithImpl<$Res> implements $CinemaCopyWith<$Res> {
  _$CinemaCopyWithImpl(this._value, this._then);

  final Cinema _value;
  // ignore: unused_field
  final $Res Function(Cinema) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? address = freezed,
    Object? email = freezed,
    Object? establishYear = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      establishYear: establishYear == freezed
          ? _value.establishYear
          : establishYear // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CinemaCopyWith<$Res> implements $CinemaCopyWith<$Res> {
  factory _$$_CinemaCopyWith(_$_Cinema value, $Res Function(_$_Cinema) then) =
      __$$_CinemaCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String phone,
      String description,
      String status,
      String address,
      String email,
      String establishYear});
}

/// @nodoc
class __$$_CinemaCopyWithImpl<$Res> extends _$CinemaCopyWithImpl<$Res>
    implements _$$_CinemaCopyWith<$Res> {
  __$$_CinemaCopyWithImpl(_$_Cinema _value, $Res Function(_$_Cinema) _then)
      : super(_value, (v) => _then(v as _$_Cinema));

  @override
  _$_Cinema get _value => super._value as _$_Cinema;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? address = freezed,
    Object? email = freezed,
    Object? establishYear = freezed,
  }) {
    return _then(_$_Cinema(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      establishYear: establishYear == freezed
          ? _value.establishYear
          : establishYear // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cinema implements _Cinema {
  const _$_Cinema(
      {required this.id,
      required this.name,
      required this.phone,
      required this.description,
      required this.status,
      required this.address,
      required this.email,
      required this.establishYear});

  factory _$_Cinema.fromJson(Map<String, dynamic> json) =>
      _$$_CinemaFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String description;
  @override
  final String status;
  @override
  final String address;
  @override
  final String email;
  @override
  final String establishYear;

  @override
  String toString() {
    return 'Cinema(id: $id, name: $name, phone: $phone, description: $description, status: $status, address: $address, email: $email, establishYear: $establishYear)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cinema &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.establishYear, establishYear));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(establishYear));

  @JsonKey(ignore: true)
  @override
  _$$_CinemaCopyWith<_$_Cinema> get copyWith =>
      __$$_CinemaCopyWithImpl<_$_Cinema>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CinemaToJson(this);
  }
}

abstract class _Cinema implements Cinema {
  const factory _Cinema(
      {required final int id,
      required final String name,
      required final String phone,
      required final String description,
      required final String status,
      required final String address,
      required final String email,
      required final String establishYear}) = _$_Cinema;

  factory _Cinema.fromJson(Map<String, dynamic> json) = _$_Cinema.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get phone => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get establishYear => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CinemaCopyWith<_$_Cinema> get copyWith =>
      throw _privateConstructorUsedError;
}
