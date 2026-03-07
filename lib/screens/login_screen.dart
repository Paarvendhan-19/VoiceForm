import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../utils/theme_constants.dart';

/// LoginScreen provides authentication options for users
/// Implements Material 3 design with Indian Flag color theme
/// 
/// Validates: Requirements 1.1, 7.1, 7.2, 7.3, 7.4, 7.5
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  String? _errorMessage;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final authService = ref.read(authServiceProvider);
      final user = await authService.signInWithGoogle();

      if (user != null && mounted) {
        // Navigation will be handled by the auth state listener in main.dart
        // or by the parent widget
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Failed to sign in with Google. Please try again.';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _handlePhoneSignIn() async {
    // Show dialog explaining phone authentication is not yet implemented
    if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Phone Authentication'),
        content: const Text(
          'Phone authentication will be available soon. '
          'Please use Google Sign-In for now.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ThemeConstants.saffron.withValues(alpha: 0.1),
              ThemeConstants.white,
              ThemeConstants.green.withValues(alpha: 0.1),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.08),

                  // App Logo and Title
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      children: [
                        // Indian Flag inspired logo
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                ThemeConstants.saffron,
                                ThemeConstants.white,
                                ThemeConstants.green,
                              ],
                              stops: [0.0, 0.5, 1.0],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: ThemeConstants.navyBlue.withValues(alpha: 0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.mic_rounded,
                              size: 60,
                              color: ThemeConstants.navyBlue,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Vani-Sahayak',
                          style: textTheme.headlineLarge?.copyWith(
                            color: ThemeConstants.navyBlue,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Your Voice Assistant for Forms',
                          style: textTheme.bodyLarge?.copyWith(
                            color: ThemeConstants.navyBlue.withValues(alpha: 0.7),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: size.height * 0.08),

                  // Welcome Message
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        children: [
                          Text(
                            'Welcome!',
                            style: textTheme.headlineMedium?.copyWith(
                              color: ThemeConstants.navyBlue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Fill forms using your voice in Indian languages',
                            style: textTheme.bodyMedium?.copyWith(
                              color: ThemeConstants.navyBlue.withValues(alpha: 0.6),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.06),

                  // Authentication Buttons
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        children: [
                          // Google Sign-In Button
                          _AuthButton(
                            onPressed: _isLoading ? null : _handleGoogleSignIn,
                            backgroundColor: ThemeConstants.green,
                            icon: Icons.g_mobiledata_rounded,
                            label: 'Continue with Google',
                            isLoading: _isLoading,
                          ),

                          const SizedBox(height: 16),

                          // Divider with "OR"
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: ThemeConstants.navyBlue.withValues(alpha: 0.2),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'OR',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: ThemeConstants.navyBlue.withValues(alpha: 0.5),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: ThemeConstants.navyBlue.withValues(alpha: 0.2),
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Phone Authentication Button
                          _AuthButton(
                            onPressed: _isLoading ? null : _handlePhoneSignIn,
                            backgroundColor: ThemeConstants.white,
                            foregroundColor: ThemeConstants.navyBlue,
                            icon: Icons.phone_rounded,
                            label: 'Continue with Phone',
                            isLoading: false,
                            hasBorder: true,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Error Message
                  if (_errorMessage != null) ...[
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.red.shade200,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error_outline_rounded,
                            color: Colors.red.shade700,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _errorMessage!,
                              style: textTheme.bodySmall?.copyWith(
                                color: Colors.red.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  SizedBox(height: size.height * 0.08),

                  // Footer
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      'By continuing, you agree to our Terms of Service\nand Privacy Policy',
                      style: textTheme.bodySmall?.copyWith(
                        color: ThemeConstants.navyBlue.withValues(alpha: 0.5),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom authentication button widget
class _AuthButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color? foregroundColor;
  final IconData icon;
  final String label;
  final bool isLoading;
  final bool hasBorder;

  const _AuthButton({
    required this.onPressed,
    required this.backgroundColor,
    this.foregroundColor,
    required this.icon,
    required this.label,
    this.isLoading = false,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveForegroundColor =
        foregroundColor ?? ThemeConstants.white;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: effectiveForegroundColor,
          elevation: hasBorder ? 0 : 2,
          shadowColor: ThemeConstants.navyBlue.withValues(alpha: 0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: hasBorder
                ? BorderSide(
                    color: ThemeConstants.navyBlue.withValues(alpha: 0.2),
                    width: 1.5,
                  )
                : BorderSide.none,
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    effectiveForegroundColor,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 24),
                  const SizedBox(width: 12),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
