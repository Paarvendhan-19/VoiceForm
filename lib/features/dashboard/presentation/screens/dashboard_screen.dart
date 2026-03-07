import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.navyBlue,
            ),
          ),
          const SizedBox(height: 24),
          // Stats Grid
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  icon: Icons.assignment_rounded,
                  value: '24',
                  label: 'Total Surveys',
                  gradient: AppTheme.primaryGradient,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard(
                  icon: Icons.people_rounded,
                  value: '342',
                  label: 'Responses',
                  gradient: AppTheme.secondaryGradient,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  icon: Icons.sentiment_satisfied_rounded,
                  value: '87%',
                  label: 'Positive',
                  gradient: AppTheme.accentGradient,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard(
                  icon: Icons.trending_up_rounded,
                  value: '+23%',
                  label: 'Growth',
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.navyBlue.withOpacity(0.8),
                      AppTheme.navyBlue,
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'Recent Surveys',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.navyBlue,
            ),
          ),
          const SizedBox(height: 16),
          _buildSurveyCard(
            title: 'Customer Feedback',
            responses: 45,
            completion: 0.85,
            trend: 12,
          ),
          const SizedBox(height: 12),
          _buildSurveyCard(
            title: 'Product Review',
            responses: 32,
            completion: 0.65,
            trend: -5,
          ),
          const SizedBox(height: 12),
          _buildSurveyCard(
            title: 'Employee Survey',
            responses: 78,
            completion: 1.0,
            trend: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Gradient gradient,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradient.colors.first.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 32),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSurveyCard({
    required String title,
    required int responses,
    required double completion,
    required int trend,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.navyBlue,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: trend > 0
                      ? AppTheme.green.withOpacity(0.1)
                      : Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      trend > 0
                          ? Icons.trending_up_rounded
                          : Icons.trending_down_rounded,
                      size: 14,
                      color: trend > 0 ? AppTheme.green : Colors.red,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${trend > 0 ? '+' : ''}$trend%',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: trend > 0 ? AppTheme.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.people_outline,
                size: 16,
                color: AppTheme.navyBlue.withOpacity(0.6),
              ),
              const SizedBox(width: 6),
              Text(
                '$responses responses',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.navyBlue.withOpacity(0.6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: completion,
              minHeight: 8,
              backgroundColor: AppTheme.navyBlue.withOpacity(0.1),
              valueColor: AlwaysStoppedAnimation<Color>(
                completion == 1.0 ? AppTheme.green : AppTheme.saffron,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${(completion * 100).toInt()}% Complete',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: completion == 1.0 ? AppTheme.green : AppTheme.saffron,
            ),
          ),
        ],
      ),
    );
  }
}
