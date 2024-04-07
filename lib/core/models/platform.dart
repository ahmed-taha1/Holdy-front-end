import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'account.dart';

class Platform extends Equatable {
	final List<Account>? accounts;
	final int? platformId;
	String? platformName;
	String? iconColor;
	int numOfAccounts;

	Platform({
		this.accounts = const <Account>[],
		this.platformId, 
		this.platformName, 
		this.iconColor,
		this.numOfAccounts = 0,
	});

	factory Platform.fromMap(Map<String, dynamic> data) => Platform(
				accounts: (data['accounts'] as List<dynamic>?)
						?.map((e) => Account.fromMap(e as Map<String, dynamic>))
						.toList(),
				platformId: data['platformId'] as int?,
				platformName: data['platformName'] as String?,
				iconColor: data['iconColor'] as String?,
				numOfAccounts: data['numOfAccounts'] as int? ?? 0,
			);

	Map<String, dynamic> toMap() => {
				'accounts': accounts?.map((e) => e.toMap()).toList(),
				'platformId': platformId,
				'platformName': platformName,
				'iconColor': iconColor,
				'numOfAccounts': numOfAccounts,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Platform].
	factory Platform.fromJson(String data) {
		return Platform.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Platform] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props {
		return [
				accounts,
				platformId,
				platformName,
				iconColor,
				numOfAccounts,
		];
	}
}
