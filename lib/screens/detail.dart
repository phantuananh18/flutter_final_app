import 'package:flutter/material.dart';
import 'package:flutter_final_app/model/cinema.model.dart';
import 'package:flutter_final_app/utils.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_final_app/utils.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Cinema cinema;

  makeCall() async {
    await launch('tel:${cinema.phone}');
  }

  mailTo() async {
    await launch('mailto:${cinema.email}?subject=Subject mail&body=Body mail');
  }

  getMap() async {
    await launch('https://www.google.com/maps/place/${cinema.address}');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cinema = ModalRoute.of(context)?.settings.arguments as Cinema;
  }

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details Cinema #${cinema.id}',
          style: PrimaryFont.medium(20).copyWith(color: kWhiteColor),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: kWhiteColor,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: kLightColor,
      ),
      resizeToAvoidBottomInset: false,
      body: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image(
                  image: const AssetImage('assets/images/cine.png'),
                  fit: BoxFit.fitWidth,
                  height: size.height * 0.2,
                ),
                const SizedBox(
                  height: 10,
                ),
                DetailItem(
                    title: 'Cinema name: ${cinema.name}', icon: Icons.theaters),
                DetailItem(
                    title:
                        'Status: ${cinema.status == 'Open' ? 'Open' : 'close'}',
                    icon:
                        cinema.status == 'Open' ? Icons.lock_open : Icons.lock),
                DetailItem(title: cinema.description, icon: Icons.description),
                DetailItem(
                  title: cinema.phone,
                  icon: Icons.phone_in_talk,
                  onTap: makeCall,
                ),
                DetailItem(
                  title: cinema.email,
                  icon: Icons.drafts,
                  onTap: mailTo,
                ),
                DetailItem(
                  title: 'Established Year: ${cinema.establishYear}',
                  icon: Icons.access_time_rounded,
                ),
                DetailItem(
                  title: cinema.address,
                  icon: Icons.place,
                  onTap: getMap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? sub;
  final Function()? onTap;
  const DetailItem(
      {Key? key, required this.title, required this.icon, this.sub, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            elevation: MaterialStateProperty.all(5)),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(icon, size: 25, color: kLightColor),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
              title,
              style: PrimaryFont.medium(20).copyWith(color: kLightColor),
            )),
          ],
        ),
      ),
    );
  }
}
