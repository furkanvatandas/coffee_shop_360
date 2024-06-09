import 'package:coffee_shop_360/core/theme/custom_light_scheme.dart';
import 'package:coffee_shop_360/features/cart/cart_page.dart';
import 'package:coffee_shop_360/features/home/data/data_sources/home_data_source.dart';
import 'package:coffee_shop_360/features/home/data/repositories/home_repository_impl.dart';
import 'package:coffee_shop_360/features/home/domain/usecases/get_all_coffees.dart';
import 'package:coffee_shop_360/features/home/presentation/cubit/home_cubit.dart';
import 'package:coffee_shop_360/features/home/presentation/home_page.dart';
import 'package:coffee_shop_360/features/my_favorites/my_favorites_page.dart';
import 'package:coffee_shop_360/features/notifications/notifications_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop 360',
      theme: CustomLightTheme().setTheme(context),
      home: const RootOfApp(),
    );
  }
}

class RootOfApp extends StatefulWidget {
  const RootOfApp({super.key});

  @override
  State<RootOfApp> createState() => _RootOfAppState();
}

class _RootOfAppState extends State<RootOfApp> {
  int currentPageIndex = 0;

  String homeIconUrl = 'assets/svg/home_icon.svg';
  String cartIconUrl = 'assets/svg/cart_icon.svg';
  String favoritesIconUrl = 'assets/svg/my_favorites_icon.svg';
  String notificationsIconUrl = 'assets/svg/notifications_icon.svg';

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        bottomNavigationBar: _bottomNavigationBar(),
        body: _body[currentPageIndex],
      ),
    );
  }

  List<Widget> get _body {
    return <Widget>[
      BlocProvider(
        create: (context) {
          return HomeCubit(
            GetAllCoffeesUseCase(HomeRepositoryImpl(const HomeDataSource())),
          )..getAllCoffees();
        },
        child: const HomePage(),
      ),
      const MyFavoritesPage(),
      const NotificationsPage(),
      const CartPage(),
    ];
  }

  NavigationBar _bottomNavigationBar() {
    return NavigationBar(
      destinations: _buildDestinations,
      selectedIndex: currentPageIndex,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      onDestinationSelected: _onDestinationSelected,
    );
  }

  void _onDestinationSelected(int index) {
    setState(() => currentPageIndex = index);
  }

  List<Widget> get _buildDestinations {
    return <Widget>[
      NavigationDestination(icon: SvgPicture.asset(homeIconUrl), label: ''),
      NavigationDestination(icon: SvgPicture.asset(favoritesIconUrl), label: ''),
      NavigationDestination(icon: SvgPicture.asset(cartIconUrl), label: ''),
      NavigationDestination(icon: SvgPicture.asset(notificationsIconUrl), label: ''),
    ];
  }
}
