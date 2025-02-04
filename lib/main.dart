import 'package:flutter/material.dart';
import 'package:bible/services/fetch_verses.dart';
import 'package:provider/provider.dart';
import 'providers/main_provider.dart';
import 'package:get/get.dart';

void main() {
    runApp(
        MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (context) => MainProvider())
            ],
            child: const MainApp(),
        ),
    );
}

class MainApp extends StatelessWidget {
    const MainApp({super.key});

    @override
    State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _loading = true;

  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 100), 
      () async {
        MainProvider mainProvider = Provider.of<MainProvider>(context, listen: false);
        await FetchVerses.execute(mainProvider: mainProvider).then(
          (value) {
            setState(() {
              _loading = false;
            });
          },
        );
      },
    ); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
    );
  }
}