import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../services/auth_service.dart';
import '../app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    
    // Initialize the video player
    _controller = VideoPlayerController.asset('assets/apforest.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
        _controller.setLooping(false);
        _controller.play();
        
        // Wait for video to finish or route after 4 seconds fallback
        Timer(const Duration(seconds: 4), _navigateBasedOnAuth);
      }).catchError((e) {
        // Fallback if video fails to load
        Timer(const Duration(seconds: 2), _navigateBasedOnAuth);
      });
  }

  void _navigateBasedOnAuth() async {
    if (!mounted) return;
    
    final user = await AuthService().getCurrentUserProfile();
    if (!mounted) return;

    if (user != null) {
      if (user.role == 'admin') {
        Navigator.pushReplacementNamed(context, '/admin-dashboard');
      } else if (user.role == 'trainee') {
        Navigator.pushReplacementNamed(context, '/trainee-dashboard');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Center(
        child: _isVideoInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Image.asset('assets/logo.jpeg', width: 200), // Show logo instantly while video buffers
      ),
    );
  }
}
