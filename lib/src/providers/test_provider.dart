import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class TestProvider {
    static String server = "https://increase-transactions.herokuapp.com";
	static String bearerToken = "1234567890qwertyuiopasdfghjklzxcvbnm";

	Future<Map<String, dynamic>> getFile() async {
		try {
			final url = '$server/file.txt';
			final response = await http.read(url,headers: { HttpHeaders.authorizationHeader: "Bearer $bearerToken"} );
		} catch (excep){
						
		}
	}


	Future<void> getClient(String id) async {
		try{
			final url = '$server/clients/$id';
			final response = await http.get(url, headers: { HttpHeaders.authorizationHeader: "Bearer $bearerToken"} );
			String body = utf8.decode(response.bodyBytes);
			final  decodedData = json.decode(body);
		} catch(exception){ 
			
		}
		
	}

}