import 'package:coffee_shop_360/core/models/process_status.dart';
import 'package:coffee_shop_360/features/home/presentation/components/announcement_banner.dart';
import 'package:coffee_shop_360/features/home/presentation/components/coffee_card.dart';
import 'package:coffee_shop_360/features/home/presentation/components/coffee_selection.dart';
import 'package:coffee_shop_360/features/home/presentation/components/user_info.dart';
import 'package:coffee_shop_360/features/home/presentation/cubit/home_cubit.dart';
import 'package:coffee_shop_360/features/home/presentation/widgets/coffee_text_field.dart';
import 'package:coffee_shop_360/features/product_detail/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: blocBuilder,
    );
  }

  Widget blocBuilder(BuildContext context, HomeState state) {
    switch (state.pageStatus) {
      case ProcessStatusSuccess():
        return CustomPaint(
          painter: HalfGradientPainter(),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 8),
              const UserInfo(),
              const SizedBox(height: 18),
              CoffeeTextField(
                onChanged: (name) {
                  context.read<HomeCubit>().searchCoffee(name);
                },
              ),
              const SizedBox(height: 18),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const AnnouncementBanner(),
                      const SizedBox(height: 18),
                      CoffeeSelection(coffeeNames: state.coffeeNames),
                      const SizedBox(height: 12),
                      _buildCoffeeList(state, context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      case ProcessStatusLoading():
        return const Center(child: CircularProgressIndicator());
      case ProcessStatusFailure():
        return const Center(child: Text("There is an error!"));
      default:
        return const SizedBox();
    }
  }

  GridView _buildCoffeeList(HomeState state, BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      shrinkWrap: true,
      primary: false,
      itemCount: state.coffeeFilteredList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: MediaQuery.of(context).size.width / 1.5,
      ),
      itemBuilder: (BuildContext context, int index) {
        var coffeeItem = state.coffeeFilteredList[index];
        return CoffeeCard(
          coffeeModel: coffeeItem,
          onTapCoffeeCard: () {
            Navigator.push(context, CoffeeDetail.route(coffeeItem));
          },
        );
      },
    );
  }
}

class HalfGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect topRect = Rect.fromLTRB(0, 0, size.width, size.height * 0.35);
    final Paint paint = Paint();

    paint.shader = const LinearGradient(
      colors: [Color(0xFF131313), Color(0xFF313131)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(topRect);

    canvas.drawRect(topRect, paint);

    paint.shader = null;
    paint.color = Colors.white;
    canvas.drawRect(Rect.fromLTRB(0, size.height / 2, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
