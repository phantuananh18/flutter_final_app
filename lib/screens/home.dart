import 'package:flutter/material.dart';
import 'package:flutter_final_app/model/argument.dart';
import 'package:flutter_final_app/screens/list.cinema.dart';
import 'package:flutter_final_app/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          const HomeBackground(),
          const HomeTitle(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonNav(
                      fixedSize: MaterialStateProperty.all(
                          Size(size.width * 0.44, size.height * 0.07)),
                      textStyle: MaterialStateProperty.all(
                          PrimaryFont.medium(size.height * 0.025)),
                      content: 'CREATE',
                      route: '/add',
                      args: Argument(),
                    ),
                    ButtonNav(
                      fixedSize: MaterialStateProperty.all(
                          Size(size.width * 0.44, size.height * 0.07)),
                      textStyle: MaterialStateProperty.all(
                          PrimaryFont.medium(size.height * 0.025)),
                      content: 'VIEW ALL',
                      route: '$ListAllScreen',
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class HomeBackground extends StatelessWidget {
  const HomeBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FractionallySizedBox(
        heightFactor: 0.3,
        widthFactor: 0.8,
        child: FittedBox(
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
          clipBehavior: Clip.antiAlias,
          child: Image.asset('assets/images/home_bg.png'),
        ),
      ),
    );
  }
}

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.35,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          const Spacer(
            flex: 1,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: RichText(
                text: TextSpan(
              text: 'CINEMA MANAGEMENT',
              style: PrimaryFont.medium(30)
                  .copyWith(color: kLightColor, letterSpacing: 0.5),
            )),
          ),
        ]),
      ),
    );
  }
}

class ButtonNav extends StatelessWidget {
  final MaterialStateProperty<Size?> fixedSize;
  final MaterialStateProperty<TextStyle> textStyle;
  final String content;
  final String route;
  final Object? args;
  const ButtonNav(
      {Key? key,
      required this.fixedSize,
      required this.textStyle,
      required this.content,
      required this.route,
      this.args})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(route, arguments: args);
      },
      child: Text(content),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kLightColor),
          fixedSize: fixedSize,
          textStyle: textStyle,
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )),
          elevation: MaterialStateProperty.all(0)),
    );
  }
}
