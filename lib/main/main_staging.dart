import 'package:five_chat_app/app/app.dart';
import 'package:five_chat_app/main/bootstrap.dart';
import 'package:five_chat_app/main/environments.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: EnvironmentVariables.supabaseUrl,
    anonKey: EnvironmentVariables.supabaseAnnonKey,
  );
  await bootstrap(() => const App());
}
