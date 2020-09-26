import 'package:flutter/material.dart';
import 'package:test_inc/src/pages/client_list_page.dart';

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

  	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
      		appBar: AppBar(title: Text('Test Inc.')),
      		body: Center(
				child: RaisedButton(
					child: Row(
						children: [
							Text('Iniciar aplicación'),
							Icon(Icons.chevron_right)
						],
					),
					onPressed: (){
						Navigator.pushNamed(context, ClientListPage.routeName);
					},
				),
			),
    	);
  	}
}
