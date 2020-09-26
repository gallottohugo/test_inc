import 'dart:convert';

ClientModel clientModelFromJson(String str) => ClientModel.fromJson(json.decode(str));

class ClientModel{
	String id;
	String email;
	String firstName;
  	String lastName;
	String job;
	String country;
	String address;
	String zipCode;
	String phone;
	String error;

	ClientModel({
		this.id,
		this.email,
		this.firstName,
		this.lastName,
		this.job,
		this.country,
		this.address,
		this.zipCode,
		this.phone
	});

	factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
		id:        json['id'],
		email:     json['email'],
		firstName: json['first_name'],
		lastName:  json['last_name'],
		job:       json['job'],
		country:   json['country'],
		address:   json['address'],
		zipCode:   json['zip_code'],
		phone:     json['phone'],
    );	
}