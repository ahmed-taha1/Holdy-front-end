import 'dart:convert';

import 'account_attribute.dart';

class Account {
	String? accountName;
	final int? platformId;
	int? accountId;
	List<AccountAttribute>? accountAttributes;

	Account({
		this.accountName, 
		this.platformId, 
		this.accountId, 
		this.accountAttributes,
	});

	factory Account.fromMap(Map<String, dynamic> data) => Account(
				accountName: data['accountName'] as String?,
				platformId: data['platformId'] as int?,
				accountId: data['accountId'] as int?,
				accountAttributes: (data['accountAttributes'] as List<dynamic>?)
						?.map((e) => AccountAttribute.fromMap(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toMap() => {
				'accountName': accountName,
				'platformId': platformId,
				'accountId': accountId,
				'accountAttributes': accountAttributes?.map((e) => e.toMap()).toList(),
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
}
