import 'package:acres/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Properties',
          style: GoogleFonts.yeonSung(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).logout();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  padding: EdgeInsets.zero),
              child: Text(
                'R',
                style: GoogleFonts.yeonSung(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )),
        )
      ],
    );
  }
}
