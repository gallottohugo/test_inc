import 'package:flutter/material.dart';
import 'package:test_inc/src/models/client_model.dart';
import 'package:test_inc/src/pages/transaction_list_page.dart';

class ClientDetailPage extends StatefulWidget {
	static final String routeName = 'client_detail_page';
  	@override
  	_ClientDetailPageState createState() => _ClientDetailPageState();
}

class _ClientDetailPageState extends State<ClientDetailPage> {
  	ClientModel clientModel;

  	@override
  	Widget build(BuildContext context) {
		Map<String, dynamic> _mapsArgument = ModalRoute.of(context).settings.arguments;
		clientModel = _mapsArgument["client"];

    	return Scaffold(
			appBar: AppBar(title: Text('Detalle de cliente')),
			body: Container(
				child: clientModel == null ? Container : Column(
					children: [
						ListTile(title: Text('Nombre'), subtitle: Text(clientModel.firstName)),
						ListTile(title: Text('Apellido'), subtitle: Text(clientModel.lastName)),
						ListTile(title: Text('Email'), subtitle: Text(clientModel.email)),
						ListTile(title: Text('Empleo'), subtitle: Text(clientModel.job)),
						ListTile(title: Text('Pais'), subtitle: Text(clientModel.country)),
						ListTile(title: Text('Dirección'), subtitle: Text(clientModel.address)),
						ListTile(title: Text('Código postal'), subtitle: Text(clientModel.zipCode)),
						ListTile(title: Text('Teléfono'), subtitle: Text(clientModel.phone)),
						RaisedButton(
							child: Text('Ver transacciones'),
							onPressed: (){
								Navigator.pushNamed(context, TransactionListPage.routeName, arguments: {"client": clientModel});
							},
						)
					],
				),
			),
		);
  	}
}