import 'package:flutter/material.dart';
import 'package:test_inc/src/pages/client_detail_page.dart';
import 'package:test_inc/src/pages/client_list_page.dart';
import 'package:test_inc/src/pages/transaction_list_page.dart';

class ApplicationRoutes {
	static Map<String, WidgetBuilder> getApplicationRoutes(){
		return <String, WidgetBuilder> {
			ClientDetailPage.routeName     : (BuildContext context) => ClientDetailPage(),
			ClientListPage.routeName       : (BuildContext context) => ClientListPage(),
			TransactionListPage.routeName  : (BuildContext context) => TransactionListPage(),
		};
	}
}