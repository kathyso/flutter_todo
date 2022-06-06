import 'package:flutter/material.dart';

enum NavigationBarItem { home, posts }

extension NavigationBarItemExtension on NavigationBarItem {
  String get name {
    switch (this) {
      case NavigationBarItem.home:
        return 'Home';
      case NavigationBarItem.posts:
        return 'Posts';
    }
  }

  IconData get icon {
    switch (this) {
      case NavigationBarItem.home:
        return Icons.home;
      case NavigationBarItem.posts:
        return Icons.newspaper;
    }
  }
}
