part of '../home_page.dart';

class HomeLoadingComponent extends StatelessWidget {
  const HomeLoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.percentWidth(0.1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/baby_sleeping_animation.json'),
            Text(
              'Aguarde...',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.blueGrey.shade500,
                fontFamily: 'LilitaOne',
              ),
            )
          ],
        ),
      ),
    );
  }
}
