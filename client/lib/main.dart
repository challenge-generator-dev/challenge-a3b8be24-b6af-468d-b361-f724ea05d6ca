import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'app_config.dart';
import 'domain/entities/pedido.dart';
import 'domain/repositories/pedido_repository.dart';
import 'domain/usecases/get_pedidos.dart';
import 'data/datasources/api_datasource.dart';
import 'data/repositories/pedido_repository_impl.dart';
import 'presentation/screens/pedidos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = AppConfig.createDioInstance();
    final baseUrl = AppConfig.fullApiUrl;
    
    return MultiProvider(
      providers: [
        Provider<AppConfig>.value(
          value: AppConfig(),
        ),
        Provider<Dio>.value(
          value: dio,
        ),
        Provider<ApiDataSource>(
          create: (context) => ApiDataSource(
            dio: dio,
            baseUrl: baseUrl,
          ),
        ),
        Provider<PedidoRepository>(
          create: (context) => PedidoRepositoryImpl(
            apiDataSource: context.read<ApiDataSource>(),
            dio: dio,
          ),
        ),
        Provider<GetPedidos>(
          create: (context) => GetPedidos(
            context.read<PedidoRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Pedidos App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PedidosScreen(),
      ),
    );
  }
}