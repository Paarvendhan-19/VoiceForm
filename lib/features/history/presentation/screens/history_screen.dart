import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_card.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.navyBlue.withOpacity(0.05),
              Colors.white,
            ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(24),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildHistoryCard(context, index),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHistoryCard(BuildContext context, int index) {
    final dates = [
      '2 hours ago',
      '5 hours ago',
      '1 day ago',
      '2 days ago',
      '3 days ago',
      '1 week ago',
      '2 weeks ago',
      '1 month ago',
    ];

    final titles = [
      'Customer Feedback Survey',
      'Product Review Form',
      'Employee Satisfaction',
      'Market Research',
      'User Experience Study',
      'Brand Awareness Survey',
      'Service Quality Check',
      'Annual Feedback',
    ];

    return GlassCard(
      onTap: () => context.push('/pdf-preview/history-$index'),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: index % 2 == 0
                  ? AppTheme.primaryGradient
                  : AppTheme.secondaryGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.description_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titles[index],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.navyBlue,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 14,
                      color: AppTheme.navyBlue.withOpacity(0.5),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      dates[index],
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.navyBlue.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: AppTheme.navyBlue.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
