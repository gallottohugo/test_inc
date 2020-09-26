import 'package:flutter/material.dart';
import 'package:test_inc/src/models/client_model.dart';
import 'package:test_inc/src/models/transaction_model.dart';

class TransactionListPage extends StatefulWidget {
	static final String routeName = 'transaction_list_page';
    TransactionListPage({Key key}) : super(key: key);
  
  	_TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
	ClientModel clientModel;
	
    @override
  	Widget build(BuildContext context) {
		Map<String, dynamic> _mapsArgument = ModalRoute.of(context).settings.arguments;
		clientModel = _mapsArgument["client"];

    	return Scaffold(
			appBar: AppBar(title: Text("Transacciones")),
			body: ListView(
				children: _transactionsCard(),
			),
		);
  	}

	List<Widget> _transactionsCard(){
		List<TransactionModel> _transactions = TransactionModel.listTransactions.where((t) => t.clientId == clientModel.id).toList();
		return new List<Widget>.generate(_transactions.length, (int index) {
			TransactionModel _transaction = _transactions[index];
			return Column(
				children: [
					ListTile(
						title: Text(_transaction.idTransaccion),
						subtitle: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Text('\$ ${_transaction.monto}'),
								 _transaction.tipo == 1 ? Text('Aceptada', style: TextStyle(color:  Colors.green)) : Text('Rechazada', style: TextStyle(color:  Colors.red)), 
							],
						),	
						leading: Icon(_transaction.tipo == 1 ? Icons.check : Icons.close, color: _transaction.tipo == 1 ? Colors.green : Colors.red,),
					),
					Divider()
				],
			);
			
		});
	}
}