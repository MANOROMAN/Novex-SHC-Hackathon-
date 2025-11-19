import 'package:flutter/material.dart';

import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final surface = AppTheme.getSurfaceColor(context);

    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(

                color: surface.withValues(alpha: 0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.getShadowColor(context),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(

                icon: Icon(Icons.arrow_back, color: AppTheme.getTextPrimaryColor(context)),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            title: const SizedBox.shrink(),
            centerTitle: true,
            pinned: true,

            expandedHeight: 140,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: AppTheme.buildBrandGradient(
                    context,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.help_outline,
                        size: 48,

                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.faqSubtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [

                  ..._buildFaqList(l10n).entries.map((entry) {
                    final index = entry.key;
                    final value = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildFAQItem(index, value.$1, value.$2),
                    );
                  }),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Map<int, (String, String)> _buildFaqList(AppLocalizations l10n) {
    return {
      0: (l10n.faqQuestion1, l10n.faqAnswer1),
      1: (l10n.faqQuestion2, l10n.faqAnswer2),
      2: (l10n.faqQuestion3, l10n.faqAnswer3),
      3: (l10n.faqQuestion4, l10n.faqAnswer4),
      4: (l10n.faqQuestion5, l10n.faqAnswer5),
      5: (l10n.faqQuestion6, l10n.faqAnswer6),
      6: (l10n.faqQuestion7, l10n.faqAnswer7),
      7: (l10n.faqQuestion8, l10n.faqAnswer8),
      8: (l10n.faqQuestion9, l10n.faqAnswer9),
      9: (l10n.faqQuestion10, l10n.faqAnswer10),
    };
  }

  Widget _buildFAQItem(int index, String question, String answer) {
    final isExpanded = _expandedIndex == index;
    return Container(
      decoration: BoxDecoration(

        color: AppTheme.getElevatedSurfaceColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.getBorderColor(context)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.getShadowColor(context),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _expandedIndex = isExpanded ? null : index;
            });
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        question,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isExpanded

                              ? AppTheme.getBrandPrimaryColor(context)
                              : AppTheme.getTextPrimaryColor(context),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: isExpanded

                            ? AppTheme.getBrandPrimaryColor(context)
                            : AppTheme.getTextSecondaryColor(context),
                      ),
                    ),
                  ],
                ),
                if (isExpanded) ...[
                  const SizedBox(height: 16),
                  Container(
                    height: 1,

                    color: AppTheme.getBorderColor(context),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    answer,

                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.getTextSecondaryColor(context),
                      height: 1.6,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

