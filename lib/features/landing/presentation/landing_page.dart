import 'package:flutter/material.dart';

import '../services/waitlist_service.dart';
import 'widgets/app_preview_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/how_it_works_section.dart';
import 'widgets/landing_footer.dart';
import 'widgets/landing_nav_bar.dart';
import 'widgets/problem_section.dart';
// import 'widgets/social_proof_section.dart';
import 'widgets/solution_section.dart';
import 'widgets/waitlist_section.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    super.key,
    required this.waitlistService,
  });

  final WaitlistService waitlistService;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _scrollController = ScrollController();
  final _featuresKey = GlobalKey();
  final _howItWorksKey = GlobalKey();
  final _waitlistKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final target = key.currentContext;
    if (target == null) return;

    Scrollable.ensureVisible(
      target,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: LandingNavBar(
                onJoinWaitlist: () => _scrollTo(_waitlistKey),
                onHowItWorks: () => _scrollTo(_howItWorksKey),
                onFeatures: () => _scrollTo(_featuresKey),
              ),
            ),
            SliverToBoxAdapter(
              child: HeroSection(
                onJoinWaitlist: () => _scrollTo(_waitlistKey),
                onHowItWorks: () => _scrollTo(_howItWorksKey),
              ),
            ),
            const SliverToBoxAdapter(child: ProblemSection()),
            SliverToBoxAdapter(
              child: KeyedSubtree(
                key: _featuresKey,
                child: const SolutionSection(),
              ),
            ),
            SliverToBoxAdapter(
              child: KeyedSubtree(
                key: _howItWorksKey,
                child: const HowItWorksSection(),
              ),
            ),
            const SliverToBoxAdapter(child: AppPreviewSection()),
            // TODO: Re-enable when testimonials are available.
            // const SliverToBoxAdapter(child: SocialProofSection()),
            SliverToBoxAdapter(
              child: KeyedSubtree(
                key: _waitlistKey,
                child: WaitlistSection(service: widget.waitlistService),
              ),
            ),
            const SliverToBoxAdapter(child: LandingFooter()),
          ],
        ),
      ),
    );
  }
}
