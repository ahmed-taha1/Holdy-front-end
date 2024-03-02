import 'dart:convert';

import 'package:equatable/equatable.dart';

class Account extends Equatable {
	final String? accountName;
	final int? platformId;
	final int? accountId;
	final Map<String ,String>? accountFields;

	const Account({
		this.accountName, 
		this.platformId, 
		this.accountId, 
		this.accountFields, 
	});

	factory Account.fromMap(Map<String, dynamic> data) => Account(
				accountName: data['accountName'] as String?,
				platformId: data['platformId'] as int?,
				accountId: data['accountId'] as int?,
				accountFields: data['accountFields'] ,
			);

	Map<String, dynamic> toMap() => {
				'accountName': accountName,
				'platformId': platformId,
				'accountId': accountId,
				'accountFields': accountFields,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Account].
	factory Account.fromJson(String data) {
		return Account.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Account] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props {
		return [
				accountName,
				platformId,
				accountId,
				accountFields,
		];
	}
}
