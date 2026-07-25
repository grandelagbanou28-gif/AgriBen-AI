import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'logo_leaf_field.dart';
import 'logo_a_plant.dart';
import 'logo_seed_growth.dart';
import 'logo_abstract_agri.dart';

class LogoShowcaseScreen extends StatefulWidget {
  const LogoShowcaseScreen({super.key});

  @override
  State<LogoShowcaseScreen> createState() => _LogoShowcaseScreenState();
}

class _LogoShowcaseScreenState extends State<LogoShowcaseScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = -1;
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  final List<_LogoOption> _logos = [
    _LogoOption(
      title: 'Feuille & Champ',
      subtitle: 'Fusion agriculture naturelle',
      description: 'Une feuille stylisée sur fond champ agricole minimaliste. Évoque la croissance et la terre.',
      painter: LogoLeafField(),
      tags: ['Nature', 'Terre', 'Classique'],
    ),
    _LogoOption(
      title: 'Lettre A + Plante',
      subtitle: 'Identité & Innovation',
      description: 'La lettre "A" d\'AgriBen intégrant une plante. Symbole d\'identité forte et de croissance.',
      painter: LogoAPlant(),
      tags: ['Marque', 'Moderne', 'Mémorable'],
    ),
    _LogoOption(
      title: 'Graine & Croissance',
      subtitle: 'Du sol au ciel',
      description: 'Une graine émergeant du sol avec une plante en croissance. Raconte l\'histoire de l\'agriculture.',
      painter: LogoSeedGrowth(),
      tags: ['Histoire', 'Vie', 'Progression'],
    ),
    _LogoOption(
      title: 'Symbole Abstrait',
      subtitle: 'Premium International',
      description: 'Design abstrait avec feuille centrale et arcs de progression. Style premium et intemporel.',
      painter: LogoAbstractAgri(),
      tags: ['Premium', 'Tech', 'International'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _fadeAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _selectLogo(int index) {
    setState(() => _selectedIndex = index);
    _animController.reset();
    _animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAF5),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppColors.forestGreen,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.palette_outlined, color: Colors.white, size: 18),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'AgriBen Brand',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '4 propositions de logo premium',
                      style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                child: _buildRecommendedBanner(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                  child: _buildLogoCard(index),
                ),
                childCount: _logos.length,
              ),
            ),
            if (_selectedIndex >= 0)
              SliverToBoxAdapter(
                child: FadeTransition(
                  opacity: _fadeAnim,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                    child: _buildSelectedPreview(),
                  ),
                ),
              ),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF14532D), Color(0xFF166534)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.auto_awesome, color: Color(0xFFF59E0B), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommandé : Symbole Abstrait',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Le plus adapté pour une marque tech agricole internationale',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoCard(int index) {
    final logo = _logos[index];
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _selectLogo(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF22C55E)
                : Colors.grey.withValues(alpha: 0.1),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? const Color(0xFF22C55E).withValues(alpha: 0.15)
                  : Colors.black.withValues(alpha: 0.04),
              blurRadius: isSelected ? 16 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            RepaintBoundary(
              child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CustomPaint(painter: logo.painter),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        logo.title,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      if (index == 3) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF59E0B).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Top',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFF59E0B),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    logo.subtitle,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.natureGreen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: logo.tags
                        .map((t) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.border.withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                t,
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.forestGreen,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF22C55E) : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF22C55E)
                      : Colors.grey.withValues(alpha: 0.3),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 14)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedPreview() {
    final logo = _logos[_selectedIndex];
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Aperçu',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 20),
          _buildSizeShowcase(logo),
          const SizedBox(height: 20),
          Text(
            logo.description,
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          _buildColorPalette(),
          const SizedBox(height: 24),
          _buildUsageExamples(logo),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download_outlined, size: 18),
                    label: const Text('Exporter PNG'),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Logo "${logo.title}" sélectionné pour AgriBen',
                          ),
                          backgroundColor: const Color(0xFF14532D),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.check, size: 18),
                    label: const Text('Sélectionner'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSizeShowcase(_LogoOption logo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildIconVariant(logo.painter, 40, '40px', 'Favicon'),
        const SizedBox(width: 16),
        _buildIconVariant(logo.painter, 64, '64px', 'Notification'),
        const SizedBox(width: 16),
        _buildIconVariant(logo.painter, 96, '96px', 'App Store'),
        const SizedBox(width: 16),
        _buildIconVariant(logo.painter, 128, '128px', 'Play Store'),
      ],
    );
  }

  Widget _buildIconVariant(CustomPainter painter, double size, String px, String label) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size * 0.22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size * 0.22),
            child: CustomPaint(painter: painter),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildColorPalette() {
    final colors = [
      _ColorSwatch(const Color(0xFF14532D), 'Vert Forêt\n#14532D'),
      _ColorSwatch(const Color(0xFF22C55E), 'Vert Nature\n#22C55E'),
      _ColorSwatch(const Color(0xFFD6C3A5), 'Beige Terre\n#D6C3A5'),
      _ColorSwatch(const Color(0xFFF59E0B), 'Or Réussite\n#F59E0B'),
      _ColorSwatch(Colors.white, 'Blanc\n#FFFFFF'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Palette officielle',
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: colors.map((c) {
            return Column(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: c.color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: c.color == Colors.white
                          ? Colors.grey.withValues(alpha: 0.2)
                          : Colors.transparent,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: c.color == Colors.white
                            ? Colors.black.withValues(alpha: 0.08)
                            : c.color.withValues(alpha: 0.3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  c.label,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildUsageExamples(_LogoOption logo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Exemples d\'utilisation',
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildUsageCard(logo, 'Splash', 'Fond vert')),
            const SizedBox(width: 8),
            Expanded(child: _buildUsageCardWhite(logo, 'Light', 'Fond blanc')),
            const SizedBox(width: 8),
            Expanded(child: _buildUsageCardDark(logo, 'Dark', 'Fond sombre')),
          ],
        ),
      ],
    );
  }

  Widget _buildUsageCard(_LogoOption logo, String label, String sub) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF14532D), Color(0xFF166534)],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(painter: logo.painter, size: const Size(36, 36)),
          const SizedBox(height: 4),
          Text(label, style: GoogleFonts.poppins(fontSize: 9, color: Colors.white, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildUsageCardWhite(_LogoOption logo, String label, String sub) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(painter: logo.painter, size: const Size(36, 36)),
          const SizedBox(height: 4),
          Text(label, style: GoogleFonts.poppins(fontSize: 9, color: AppColors.textPrimary, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildUsageCardDark(_LogoOption logo, String label, String sub) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(painter: logo.painter, size: const Size(36, 36)),
          const SizedBox(height: 4),
          Text(label, style: GoogleFonts.poppins(fontSize: 9, color: Colors.white70, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _LogoOption {
  final String title;
  final String subtitle;
  final String description;
  final CustomPainter painter;
  final List<String> tags;

  const _LogoOption({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.painter,
    required this.tags,
  });
}

class _ColorSwatch {
  final Color color;
  final String label;

  const _ColorSwatch(this.color, this.label);
}
