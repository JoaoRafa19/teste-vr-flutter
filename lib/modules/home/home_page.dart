import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/modules/home/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Modular.get<HomeController>();

  void onTap(Pages page) {
    controller.changePage(page);
    Modular.to.navigate("/home/${page.name}");
  }

  @override
  Widget build(BuildContext context) {
    final leading = LayoutBuilder(builder: (context, c) {
      final width = MediaQuery.of(context).size.width;
      return SizedBox(
        width: width * (width > 1100 ? 0.2 : 0.3),
        child: Container(
          padding:  EdgeInsets.all((width > 1200 ? 0.5 : 0.7) * 16),
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(
                builder: (context) {
                  return PagesTile(
                    name: "Dashboard",
                    page: Pages.dashboard,
                    icon: Icons.home_outlined,
                    activeIcon: Icons.home,
                    onTap: onTap,
                    active: controller.current == Pages.dashboard,
                  );
                }
              ),
              Observer(
                builder: (context) {
                  return PagesTile(
                    name: "Students",
                    page: Pages.students,
                    icon: Icons.people_outline,
                    activeIcon: Icons.people,
                    onTap: onTap,
                    active: controller.current == Pages.students,
                  );
                }
              ),
              Observer(
                builder: (context) {
                  return PagesTile(
                    name: "Courses",
                    page: Pages.courses,
                    icon: Icons.book_outlined,
                    active: controller.current == Pages.courses,
                  );
                }
              ),
            ],
          ),
        ),
      );
    });

    return LayoutBuilder(builder: (context, constraints) {
      final width = MediaQuery.of(context).size.width;
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(width < 700 ? 40 : 0),
          child: Visibility( visible : width < 700, child: AppBar())),
        drawer: Drawer(
          child: Container(
            child: leading,
          ),
        ),
        body: Row(
          children: [
            Visibility(
              visible: constraints.maxWidth > 700,
              child: leading,
            ),
            const Expanded(
              child: RouterOutlet(),
            ),
          ],
        ),
      );
    });
  }
}

class PagesTile extends StatelessWidget {
  const PagesTile({
    super.key,
    required this.page,
    required this.icon,
    required this.name,
    this.active = false,
    this.activeIcon,
    this.onTap,
  });
  final IconData icon;
  final IconData? activeIcon;
  final bool active;
  final String name;
  final Pages page;
  final void Function(Pages page)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(active ? activeIcon : icon),
          const SizedBox(width: 20),
          Text(name),
        ],
      ),
      onTap: onTap != null
          ? () => onTap!(page)
          : () => Modular.to.navigate('/home/${page.name}'),
    );
  }
}
