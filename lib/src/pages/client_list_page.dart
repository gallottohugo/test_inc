import 'package:flutter/material.dart';
import 'package:test_inc/src/models/client_model.dart';
import 'package:test_inc/src/models/footer_model.dart';
import 'package:test_inc/src/pages/client_detail_page.dart';
import 'package:test_inc/src/providers/test_provider.dart';

class ClientListPage extends StatefulWidget {
	static final String routeName = 'client_list_page';
  	ClientListPage({Key key}) : super(key: key);

  	_ClientListPageState createState() => _ClientListPageState();
}

class _ClientListPageState extends State<ClientListPage> {
	int page = 1;
	
  	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(title: Text('Listado de clientes')),
			body: ListView(
				children: [
					Container(
						padding: EdgeInsets.only(top: 20.0),
						child: Center(child: Text("Page $page", style: TextStyle(fontSize: 25),),)
					),
					SizedBox(height: 20,),
					Column( children: _clientCard(page: page)),
					SizedBox(height: 20,),
					Container(
						child: Row(
							children: [
								SizedBox(width: 20,),
								IconButton(
									icon: Icon(Icons.navigate_before),
									onPressed: (){
										if (page > 1){
											setState(() {page -= 1; });
										}
									},
								),
								Expanded(child: SizedBox(),),
								IconButton(
									icon: Icon(Icons.navigate_next),
									onPressed: (){
										setState(() { page += 1; });
									},
								),
								SizedBox(width: 20,),
							],
						)	
					)
				]
			),
		);
  	}


	List<Widget> _clientCard({@required int page}){
		int end = page * 3;
		int start = end - 3;
		List<FooterModel> listPage = FooterModel.listFooterModel.getRange(start, end).toList();
		TestProvider testProvider = new TestProvider();
		return new List<Widget>.generate(listPage.length, (int index) {
			FooterModel _footer = listPage[index];
			return Column(
				children: [
					FutureBuilder(
						future: testProvider.getClient(_footer.idCliente),
						initialData: null,
						builder: (BuildContext context, AsyncSnapshot<ClientModel> snapshot) {
							if (snapshot.hasData){
								if (snapshot.data.error != null){ return CardError(client: snapshot.data,); } 
								else { return CardData(client: snapshot.data,); }
							} else {
								return Container(padding: EdgeInsets.symmetric(vertical: 5.0), child: Center(child: CircularProgressIndicator()));
							}	
						},
					),
					Divider()
				],
			);
		});
	}
}

class CardError extends StatelessWidget {
	final ClientModel client;
  	const CardError({Key key, @required this.client}) : super(key: key);
  	@override
  	Widget build(BuildContext context) {
		return Container(
			color: Colors.grey,
			child: ListTile(
				title: Text(this.client.error),
				trailing: Icon(Icons.refresh),
			),
		);
  	}
}


class CardData extends StatelessWidget {
	final ClientModel client;
  	const CardData({Key key, @required this.client}) : super(key: key);

  	@override
  	Widget build(BuildContext context) {
	return Container(
			padding: EdgeInsets.symmetric(vertical: 5.0),
			child: ListTile(
				title: Text(this.client.firstName),
				subtitle: Text(this.client.email),
				trailing: Icon(Icons.navigate_next),
				onTap: (){ Navigator.pushNamed(context, ClientDetailPage.routeName, arguments: {"client": this.client});},
			),
		);
  	}
}