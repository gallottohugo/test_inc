import 'package:flutter/material.dart';
import 'package:test_inc/src/pages/client_list_page.dart';
import 'package:test_inc/src/providers/test_provider.dart';

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
									await testProvider.getFile();
									setState(() { _showProgress = false;});
									Navigator.pushNamed(context, ClientListPage.routeName);
								},
							),
						)
					],
        		),
      		),
    	);
  	}
}
