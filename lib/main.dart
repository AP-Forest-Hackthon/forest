import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app_theme.dart';
import 'providers/quiz_provider.dart';

// Screens
import 'screens/splash_screen.dart';
import 'screens/extracted_text_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';

// Auth
import 'auth/login_screen.dart';
import 'auth/register_screen.dart';

// Admin
import 'admin/admin_dashboard.dart';
import 'admin/exam_management.dart';

// Trainee
import 'trainee/trainee_dashboard.dart';
import 'trainee/exam_action_screen.dart';

// Upload (shared admin flow)
import 'screens/upload_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Firebase init error: $e');
  }
  runApp(const APForestApp());
}

class APForestApp extends StatelessWidget {
  const APForestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizProvider()),
      ],
      child: MaterialApp(
        title: 'AP Forest LMS',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          // Handle routes that need arguments
          switch (settings.name) {
            case '/trainee-exam-actions':
              final exam = settings.arguments as String? ?? '';
              return MaterialPageRoute(
                builder: (_) => ExamActionScreen(exam: exam),
              );
            default:
              return null;
          }
        },
        routes: {
          '/': (context) => const SplashScreen(),

          // Auth
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),

          // Admin
          '/admin-dashboard': (context) => const AdminDashboard(),
          '/exam-management': (context) => const ExamManagementScreen(),

          // Trainee
          '/trainee-dashboard': (context) => const TraineeDashboard(),

          // Shared quiz flow (admin uploads, trainee takes)
          '/upload': (context) => const UploadScreen(),
          '/extracted': (context) => const ExtractedTextScreen(),
          '/quiz': (context) => const QuizScreen(),
          '/result': (context) => const ResultScreen(),
        },
      ),
    );
  }
}
