import 'dart:ui';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🌌 Background gambar penuh
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/tron.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 🌫️ Efek blur lembut di tengah layar
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 350,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  /// 📦 Isi konten login
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _GlowingLogo(),
                      const SizedBox(height: 15),
                      const Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Please login to continue",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 35),

                      /// Username field
                      TextField(
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: const TextStyle(color: Colors.white70),
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: Colors.white70,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Colors.white54),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 255, 90, 40),
                              width: 1.8,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.05),
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// Password field
                      TextField(
                        obscureText: _obscurePassword,
                        obscuringCharacter: '•',
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(color: Colors.white70),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Colors.white70,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              transitionBuilder: (child, anim) =>
                                  ScaleTransition(scale: anim, child: child),
                              child: Image.asset(
                                _obscurePassword
                                    ? 'assets/icons/closev.png'
                                    : 'assets/icons/openv.png',
                                key: ValueKey<bool>(_obscurePassword),
                                color: Colors.white70,
                                width: 22,
                                height: 22,
                              ),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Colors.white54),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 255, 90, 40),
                              width: 1.8,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.05),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Tombol login dengan efek hover
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            minimumSize: WidgetStateProperty.all(
                              const Size(double.infinity, 50),
                            ),
                            backgroundColor:
                                WidgetStateProperty.resolveWith<Color>((
                                  Set<WidgetState> states,
                                ) {
                                  if (states.contains(WidgetState.hovered)) {
                                    // warna saat hover
                                    return Colors.redAccent.withOpacity(0.9);
                                  }
                                  // warna normal
                                  return Colors.redAccent.withOpacity(0.8);
                                }),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            elevation: WidgetStateProperty.all(5),
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white, // warna tulisan putih
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      /// Lupa password
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔥 Neon Glow Effect (versi halus dan lebih berani)
class _GlowingLogo extends StatefulWidget {
  const _GlowingLogo({super.key});

  @override
  State<_GlowingLogo> createState() => _GlowingLogoState();
}

class _GlowingLogoState extends State<_GlowingLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8), // 🌙 durasi lebih panjang (smooth)
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // pakai kurva lebih lembut biar glow-nya halus banget
    final Animation<double> intensity = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutSine,
    );

    return AnimatedBuilder(
      animation: intensity,
      builder: (context, child) {
        final double glow = intensity.value.clamp(0.0, 1.0);

        return Stack(
          alignment: Alignment.center,
          children: [
            // ✨ Lapisan cahaya dasar (warna utama neon)
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                const Color.fromARGB(
                  255,
                  255,
                  45,
                  0,
                ).withOpacity(0.85 * glow), // makin tebal dan panas
                BlendMode.srcATop,
              ),
              child: Image.asset(
                'assets/images/logo.png',
                width: 105,
                height: 105,
                color: const Color.fromARGB(
                  255,
                  255,
                  60,
                  20,
                ).withOpacity(0.75 * glow),
              ),
            ),

            // 💫 Efek blur menyebar (aura neon)
            ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 20 * glow, // makin besar, makin menyala
                sigmaY: 20 * glow,
              ),
              child: Image.asset(
                'assets/images/logo.png',
                width: 105,
                height: 105,
                color: const Color.fromARGB(
                  255,
                  255,
                  40,
                  0,
                ).withOpacity(0.55 * glow),
              ),
            ),

            // 💡 Glow luar tambahan (lebih lembut & luas)
            ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 35 * glow,
                sigmaY: 35 * glow,
              ),
              child: Image.asset(
                'assets/images/logo.png',
                width: 115,
                height: 115,
                color: const Color.fromARGB(
                  255,
                  255,
                  80,
                  30,
                ).withOpacity(0.25 * glow),
              ),
            ),

            // 🎯 Logo utama paling depan (tajam & putih)
            Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
              color: Colors.white.withOpacity(0.95),
            ),
          ],
        );
      },
    );
  }
}
