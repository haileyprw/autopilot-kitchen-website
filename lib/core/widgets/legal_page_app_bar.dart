import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_links.dart';

class LegalPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LegalPageAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => context.go(AppLinks.homePath),
      ),
      title: Text(title),
    );
  }
}
