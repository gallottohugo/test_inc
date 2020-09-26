import 'package:flutter/material.dart';
import 'package:test_inc/src/models/footer_model.dart';
import 'package:test_inc/src/pages/client_list_page.dart';
import 'package:test_inc/src/providers/test_provider.dart';
import 'package:test_inc/src/routes/routes.dart';

void main() { runApp(MyApp()); }

class MyApp extends StatelessWidget {
  	@override
  	Widget build(BuildContext context) {
    	return MaterialApp(
      		title: 'Test Inc.',
      		theme: ThemeData(
        		primarySwatch: Colors.blue,
        		visualDensity: VisualDensity.adaptivePlatformDensity,
      		),
			debugShowCheckedModeBanner: false,
			routes: ApplicationRoutes.getApplicationRoutes(),
      		home: MyHomePage(),
    	);
  	}
}

class MyHomePage extends StatefulWidget {
  	MyHomePage({Key key}) : super(key: key);

  	@override
  	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	bool _showProgress = false;
  	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
      		appBar: AppBar(title: Text('Test Inc.')),
      		body: Center(
        		child: Column(          
          			mainAxisAlignment: MainAxisAlignment.center,
          			children: <Widget>[
						_showProgress ? Center(child: CircularProgressIndicator() ) : Center(
							child: RaisedButton(
								child: Text('INICIAR APLICACIÓN'),
								onPressed: () async {
									setState(() { _showProgress = true;});
									TestProvider testProvider = TestProvider();
									bool _response = await testProvider.getFile();
									setState(() { _showProgress = false;});
									if (_response == false){
										return showDialog<void>(
											context: context,
											builder: (BuildContext context) {
												return AlertDialog(
													title: Text('Error'),
													content: Text('Ocurrió un error, vuelva a intentarlo.'),
													actions: <Widget>[
														FlatButton(
															child: Text('Ok'),
															onPressed: () { Navigator.of(context).pop(); },
														),
													],
												);
											}
										);
									} else {
										Navigator.pushNamed(context, ClientListPage.routeName);
									}
								},
							),
						)
					],
        		),
      		),
    	);
  	}
}
