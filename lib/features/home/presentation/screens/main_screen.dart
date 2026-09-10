import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/home/presentation/bloc/home_bloc.dart';
import 'package:project/features/home/presentation/pages/about_us_page.dart';
import 'package:project/features/home/presentation/pages/help_page.dart';
import 'package:project/features/home/presentation/pages/notification_page.dart';
import 'package:project/features/home/presentation/pages/payment_page.dart';
import 'package:project/features/home/presentation/pages/promos_page.dart';
import 'package:project/features/home/presentation/pages/rate_us_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const _MainScreenView(),
    );
  }
}

class _MainScreenView extends StatelessWidget {
  const _MainScreenView();

  static const Color purple = Color(0xFF673AB7);
  static const Color darkPurple = Color(0xFF4D2694);

  static const List<String> _titles = [
    'PAYMENT PAGE',
    'PROMOS',
    'NOTIFICATION',
    'HELP',
    'ABOUT US',
    'RATE US',
  ];

  static const List<Widget> _pages = [
    PaymentPage(),
    PromosPage(),
    NotificationPage(),
    HelpPage(),
    AboutUsPage(),
    RateUsPage(),
  ];

  // 3D slide + tilt matrix for the secondary background layered card
  Matrix4 _buildBackCardMatrix(bool isOpen, Size size) {
    if (!isOpen) return Matrix4.identity();
    return Matrix4.identity()
      ..translateByDouble(size.width * 0.42, size.height * 0.12, 0.0, 1.0)
      ..scaleByDouble(0.70, 0.68, 1.0, 1.0)
      ..rotateZ(-0.25);
  }

  Matrix4 _buildBackCardMatrix2(bool isOpen, Size size) {
    if (!isOpen) return Matrix4.identity();
    return Matrix4.identity()
      ..translateByDouble(size.width * 0.48, size.height * 0.11, 0.0, 1.0)
      ..scaleByDouble(0.72, 0.70, 1.0, 1.0)
      ..rotateZ(-0.20);
  }

  // 3D slide + tilt matrix for the main front screen
  Matrix4 _buildMainMatrix(bool isOpen, Size size) {
    if (!isOpen) return Matrix4.identity();
    return Matrix4.identity()
      ..translateByDouble(size.width * 0.55, size.height * 0.10, 0.0, 1.0)
      ..scaleByDouble(0.74, 0.72, 1.0, 1.0)
      ..rotateZ(-0.15);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        final isOpen = state.isDrawerOpen;

        return Scaffold(
          backgroundColor: purple,
          body: SafeArea(
            child: Stack(
              children: [
                // --- Drawer panel (always behind) ---
                _buildDrawerPanel(context, state),

                // --- Secondary stacked card 1 behind main screen (depth effect) ---
                IgnorePointer(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 320),
                    curve: Curves.easeOutCubic,
                    transform: _buildBackCardMatrix(isOpen, size),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF).withAlpha(isOpen ? 40 : 0),
                      borderRadius: BorderRadius.circular(isOpen ? 32 : 0),
                    ),
                  ),
                ),

                // --- Secondary stacked card 2 behind main screen ---
                IgnorePointer(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 320),
                    curve: Curves.easeOutCubic,
                    transform: _buildBackCardMatrix2(isOpen, size),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF).withAlpha(isOpen ? 100 : 0),
                      borderRadius: BorderRadius.circular(isOpen ? 32 : 0),
                    ),
                  ),
                ),

                // --- Sliding & tilted main content screen ---
                GestureDetector(
                  // Tap anywhere on the tilted screen to close drawer
                  onTap: isOpen
                      ? () => context.read<HomeBloc>().add(const CloseDrawerEvent())
                      : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 320),
                    curve: Curves.easeOutCubic,
                    transform: _buildMainMatrix(isOpen, size),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(isOpen ? 34 : 0),
                      boxShadow: isOpen
                          ? const [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 25,
                                spreadRadius: 2,
                                offset: Offset(-10, 10),
                              ),
                            ]
                          : [],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(isOpen ? 34 : 0),
                      child: _buildMainContent(context, state),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isOpen ? 0 : kBottomNavigationBarHeight + 20,
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      }, listener: (BuildContext context, HomeState state) {  },
    );
  }

  // ─── Drawer ────────────────────────────────────────────────────────────────

  Widget _buildDrawerPanel(BuildContext context, HomeState state) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          const CircleAvatar(radius: 29, backgroundColor: Color(0xFFD1C4E9)),
          const SizedBox(height: 14),
          // User Name
          const Text(
            'Adan Balina',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          // Menu items
          SizedBox(
            width: 250,
            child: Column(
              children: [
                _menuItem(context, Icons.credit_card, 'Payment', 0, state.selectedIndex),
                _menuItem(context, Icons.card_giftcard, 'Promos', 1, state.selectedIndex),
                _menuItem(context, Icons.notifications, 'Notification', 2, state.selectedIndex),
                _menuItem(context, Icons.help_outline, 'Help', 3, state.selectedIndex),
                _menuItem(context, Icons.info_outline, 'About Us', 4, state.selectedIndex),
                _menuItem(context, Icons.star_border, 'Rate Us', 5, state.selectedIndex),
              ],
            ),
          ),
          const Spacer(),
          // Logout button
          Padding(
            padding: const EdgeInsets.only(bottom: 48),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white, width: 1.5),
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 10,
                ),
              ),
              child: const Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
    BuildContext context,
    IconData icon,
    String label,
    int index,
    int selectedIndex,
  ) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.read<HomeBloc>().add(SelectMenuEvent(index)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 36,
        margin: const EdgeInsets.only(bottom: 2),
        padding: const EdgeInsets.symmetric(horizontal: 11),
        decoration: BoxDecoration(
          color: isSelected ? darkPurple : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 13),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Main content panel ─────────────────────────────────────────────────────

  Widget _buildMainContent(BuildContext context, HomeState state) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: purple,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => context.read<HomeBloc>().add(const ToggleDrawerEvent()),
        ),
        title: Text(
          _titles[state.selectedIndex],
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
      // IndexedStack preserves state and scroll position across all pages
      body: IndexedStack(
        index: state.selectedIndex,
        children: _pages,
      ),
    );
  }
}
