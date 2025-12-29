import 'dart:ui';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 260,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF0F1828), Color(0xFF3A7BD5)],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                      child: Container(color: Colors.black.withOpacity(0.05)),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      child: Row(
                        children: [
                          _avatar(),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text('Welcome back,', style: TextStyle(color: Colors.white70, fontSize: 14)),
                                SizedBox(height: 6),
                                Text('Alison', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700)),
                                SizedBox(height: 6),
                                Text('Explore premium courses and track your progress', style: TextStyle(color: Colors.white70, fontSize: 13)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          _premiumBadge(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle('Featured Categories', action: 'View all'),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 140,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) => _glassCard(
                        width: 260,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              CircleAvatar(radius: 28, backgroundColor: Colors.white24, child: Icon(Icons.school, color: Colors.white)),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('UX Design', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                                    SizedBox(height: 6),
                                    Text('12 courses', style: TextStyle(color: Colors.white70, fontSize: 12)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  _sectionTitle('Recommended for you', action: 'See more'),
                  const SizedBox(height: 12),
                  Column(
                    children: List.generate(4, (i) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: _courseTile(i),
                    )),
                  ),

                  const SizedBox(height: 20),
                  _ctaCard(),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _avatar() => Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(colors: [Color(0xFF6DD5FA), Color(0xFF2980B9)]),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 8, offset: const Offset(0, 4))],
        ),
        child: const Center(child: Icon(Icons.person, color: Colors.white, size: 32)),
      );

  Widget _premiumBadge() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white24),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [Icon(Icons.star, size: 16, color: Colors.amber), SizedBox(width: 6), Text('Premium', style: TextStyle(color: Colors.white))],
        ),
      );

  Widget _sectionTitle(String title, {String? action}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          if (action != null)
            Text(action, style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600)),
        ],
      );

  Widget _glassCard({required Widget child, double width = double.infinity}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 12, offset: const Offset(0, 8))],
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _courseTile(int index) {
    return _glassCard(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(backgroundColor: Colors.blueGrey[700], child: Icon(Icons.play_circle_fill, color: Colors.white)),
        title: Text('Course Title ${index + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        subtitle: const Text('Beginner • 3h 24m', style: TextStyle(color: Colors.white70)),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          onPressed: () {},
          child: const Text('Start'),
        ),
      ),
    );
  }

  Widget _ctaCard() {
    return _glassCard(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Upgrade to Premium', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
                  SizedBox(height: 6),
                  Text('Get unlimited access to all courses and certificates', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14), backgroundColor: Colors.amber[700]),
              child: const Text('Get Premium', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
  }
}