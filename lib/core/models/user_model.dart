import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'platform.dart';

class UserModel extends Equatable {
	String? email;
	final String? firstName;
	final String? lastName;
	final String? phoneNumber;
	List<Platform>? platforms;

	UserModel({
		this.email,
		this.firstName,
		this.lastName,
		this.phoneNumber,
		this.platforms,
	});

	factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
				platforms: (data['platforms'] as List<dynamic>?)
						?.map((e) => Platform.fromMap(e as Map<String, dynamic>))
						.toList(),
				email: data['email'] as String?,
				firstName: data['firstName'] as String?,
				lastName: data['lastName'] as String?,
				phoneNumber: data['phoneNumber'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'platforms': platforms?.map((e) => e.toMap()).toList(),
				'email': email,
				'firstName': firstName,
				'lastName': lastName,
				'phoneNumber': phoneNumber,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
	factory UserModel.fromJson(String data) {
		return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props {
		return [
				platforms,
				email,
				firstName,
				lastName,
				phoneNumber,
		];
	}
}
