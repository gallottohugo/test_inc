import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_inc/src/models/client_model.dart';
import 'package:test_inc/src/models/footer_model.dart';
import 'package:test_inc/src/models/transaction_model.dart';


class TestProvider {
    static String server = "https://increase-transactions.herokuapp.com";
	static String bearerToken = "1234567890qwertyuiopasdfghjklzxcvbnm";

	Future<bool> getFile() async {
		try {
			final url = '$server/file.txt';
			final response = await http.read(url,headers: { HttpHeaders.authorizationHeader: "Bearer $bearerToken"} );
			if (response == null) { return false;} 
			else {
				_readLines(response:  response);
			}
			return true;
		} catch (exception){ 
			return false; 
		}
	}


	Future<ClientModel> getClient(String id) async {
		ClientModel clientModel = new ClientModel();
		try{
			final url = '$server/clients/$id';
			final response = await http.get(url, headers: { HttpHeaders.authorizationHeader: "Bearer $bearerToken"} );
			String body = utf8.decode(response.bodyBytes);
			final  decodedData = json.decode(body);
			if (response.statusCode == 200) {
				clientModel = new ClientModel.fromJson(decodedData);
				return clientModel;
			} else { 
				clientModel.error = "Ocurrió un error con el servidor"; 
				return clientModel;
			}
		} catch(exception){ 
			clientModel.error = "Ocurrió una excepción"; 
			return clientModel;
		}
		
	}

	void _readLines({@required String response}){
		LineSplitter.split(response).forEach((line) {
			if (line.substring(0,1) == "2"){ 
				_loadTransaction(transactionLine: line);
			}
			if (line.substring(0,1) == "4"){ 
				_loadFooter(footerLine: line);
				//set client id to transaction model
				TransactionModel.listTransactions.where((t) => t.clientId == null).map((item) => item.clientId = FooterModel.listFooterModel.last.idCliente).toList();
			}
		});
	}

	void _loadFooter({@required String footerLine}){
		FooterModel _footerModel = new FooterModel();
		_footerModel.tipoDeRegistro = int.parse(footerLine.substring(0,1));
		_footerModel.reservado = footerLine.substring(1,16);
		_footerModel.fechaDePago = int.parse(footerLine.substring(16,24));
		_footerModel.idCliente =footerLine.substring(24,56);
		print(_footerModel);
		FooterModel.listFooterModel.add(_footerModel);
	}

	void _loadTransaction({@required String transactionLine}){
		TransactionModel _transactionModel = new TransactionModel();
		_transactionModel.tipoDeRegistro = int.parse(transactionLine.substring(0,1));
		_transactionModel.idTransaccion = transactionLine.substring(1,33);
		_transactionModel.monto = int.parse(transactionLine.substring(33, 46)) / 100;
		_transactionModel.reservado = transactionLine.substring(46, 51);
		_transactionModel.tipo = int.parse(transactionLine.substring(51, 52));
		TransactionModel.listTransactions.add(_transactionModel);
	}

}