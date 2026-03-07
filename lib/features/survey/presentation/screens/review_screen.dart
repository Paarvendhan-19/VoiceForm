import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../../../core/widgets/glass_card.dart';

class ReviewScreen extends ConsumerStatefulWidget {
  final String sessionId;

  const ReviewScreen({super.key, required this.sessionId});

  @override
  ConsumerState<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends ConsumerState<ReviewScreen> {
  bool _isGenerating = false;

  final List<Map<String, String>> _responses = [
    {
      'question': 'What is your overall satisfaction?',
      'answer': 'Very satisfied with the product quality',
      'sentiment': 'Positive',
    },
    {
      'question': 'How likely are you to recommend us?',
      'answer': 'Definitely would recommend to friends',
      'sentiment': 'Positive',
    },
    {
      'question': 'What features do you use most?',
      'answer': 'Voice recording and AI transcription',
      'sentiment': 'Neutral',
    },
    {
      'question': 'Any suggestions for improvement?',
      'answer': 'Add more language support',
      'sentiment': 'Neutral',
    },
    {
      'question': 'Rate your experience (1-10)',
      'answer': 'I would rate it 9 out of 10',
      'sentiment': 'Positive',
    },
  ];

  Future<void> _generatePDF() async {
    setState(() => _isGenerating = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isGenerating = false);
      context.push('/pdf-preview/${widget.sessionId}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Responses'),
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
              AppTheme.green.withOpacity(0.05),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(24),
                itemCount: _responses.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildResponseCard(_responses[index], index + 1),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: GradientButton(
                text: 'Generate Report',
                onPressed: _generatePDF,
                isLoading: _isGenerating,
                icon: Icons.picture_as_pdf_rounded,
                width: double.infinity,
                gradient: AppTheme.secondaryGradient,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResponseCard(Map<String, String> response, int number) {
    final sentiment = response['sentiment']!;
    final sentimentColor = sentiment == 'Positive'
        ? AppTheme.green
        : sentiment == 'Negative'
            ? Colors.red
            : AppTheme.navyBlue;

    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '$number',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  response['question']!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.navyBlue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.navyBlue.withOpacity(0.03),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              response['answer']!,
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.navyBlue.withOpacity(0.8),
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: sentimentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      sentiment == 'Positive'
                          ? Icons.sentiment_satisfied_rounded
                          : sentiment == 'Negative'
                              ? Icons.sentiment_dissatisfied_rounded
                              : Icons.sentiment_neutral_rounded,
                      size: 16,
                      color: sentimentColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      sentiment,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: sentimentColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.edit_outlined, size: 20),
                onPressed: () {},
                color: AppTheme.navyBlue.withOpacity(0.6),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
