import "package:flutter/material.dart";
import "package:lab_4/features/banner/presentation/banner.dart";
import "package:lab_4/shared/header/user_simple.dart";

import "../../moks/users.dart";

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserSimple(users[0]),
        SBanner()
      ],
    );
  }
}
