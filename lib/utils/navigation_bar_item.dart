import 'package:flutter/material.dart';

enum NavigationBarItem { home, posts, todos }

extension NavigationBarItemExtension on NavigationBarItem {
  String get name {
    switch (this) {
      case NavigationBarItem.home:
        return 'Home';
      case NavigationBarItem.posts:
        return 'Posts';
      case NavigationBarItem.todos:
        return 'Todos';
    }
  }

  IconData get icon {
    switch (this) {
      case NavigationBarItem.home:
        return Icons.home;
      case NavigationBarItem.posts:
        return Icons.newspaper;
      case NavigationBarItem.todos:
        return Icons.check_box;
    }
  }
}
