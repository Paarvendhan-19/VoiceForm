import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_card.dart';

class SurveyListScreen extends ConsumerWidget {
  const SurveyListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Surveys'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.saffron.withOpacity(0.05),
              Colors.white,
            ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(24),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildSurveyCard(context, index),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSurveyCard(BuildContext context, int index) {
    final surveys = [
      {'title': 'Customer Feedback', 'responses': 45, 'status': 'Active'},
      {'title': 'Product Review', 'responses': 23, 'status': 'Active'},
      {'title': 'Employee Survey', 'responses': 67, 'status': 'Completed'},
      {'title': 'Market Research', 'responses': 12, 'status': 'Active'},
      {'title': 'User Experience', 'responses': 89, 'status': 'Completed'},
    ];

    final survey = surveys[index];
    final isActive = survey['status'] == 'Active';

    return GlassCard(
      onTap: () => context.push('/voice-recording/survey-$index'),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: isActive
                      ? AppTheme.primaryGradient
                      : AppTheme.secondaryGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.mic_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      survey['title'] as String,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.navyBlue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${survey['responses']} responses',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.navyBlue.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppTheme.green.withOpacity(0.1)
                      : AppTheme.navyBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  survey['status'] as String,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isActive ? AppTheme.green : AppTheme.navyBlue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
