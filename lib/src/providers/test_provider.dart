import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_inc/src/models/footer_model.dart';


class TestProvider {
    static String server = "https://increase-transactions.herokuapp.com";
	static String bearerToken = "1234567890qwertyuiopasdfghjklzxcvbnm";

	Future<Map<String, dynamic>> getFile() async {
		try {
			final url = '$server/file.txt';
			final response = await http.read(url,headers: { HttpHeaders.authorizationHeader: "Bearer $bearerToken"} );
			if (response != null) {
				LineSplitter.split(response).forEach((line) {
					if (line.substring(0,1) == "4"){ _loadFooter(line);}
				});
			}
			print("__________________________");
			print(FooterModel.listFooterModel);
		} catch (excep){
			print("------");
			print(excep);
			print("------");
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


	void _loadFooter(String footerLine){
		FooterModel footerModel = new FooterModel();
		footerModel.tipoDeRegistro = int.parse(footerLine.substring(0,1));
		footerModel.reservado = footerLine.substring(1,16);
		footerModel.fechaDePago = int.parse(footerLine.substring(16,24));
		footerModel.idCliente =footerLine.substring(24,56);
		print(footerModel);
		FooterModel.listFooterModel.add(footerModel);
	}

}