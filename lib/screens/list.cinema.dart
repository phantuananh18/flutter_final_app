import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_final_app/model/argument.dart';
import 'package:flutter_final_app/screens/detail.dart';
import 'package:flutter_final_app/model/cinema.model.dart';
import 'package:flutter_final_app/utils.dart';

class ListAllScreen extends StatefulWidget {
  const ListAllScreen({Key? key}) : super(key: key);

  @override
  State<ListAllScreen> createState() => _ListAllScreenState();
}

class _ListAllScreenState extends State<ListAllScreen> {
  final controller = ScrollController();

  Future<List<Cinema>> fetchList() async {
    final res = await http.get(Uri.parse(
        'http://api.phanmemquocbao.com/api/Doituong/getobjectsall?tokenget=lethibaotran'));

    if (res.statusCode == 200) {
      List<dynamic> json = jsonDecode(res.body);
      return json.map((e) => Cinema.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  late Future<List<Cinema>> list = fetchList();

  Future<http.Response> delteCinema(Cinema cinema) async {
    final res = await http.get(Uri.parse(
        'http://api.phanmemquocbao.com/api/Doituong/deleteObject?id=${cinema.id}&tokende=lethibaotran'));
    return res;
  }

  onHandleDelete(Cinema cinema) {
    CustomDialog.makeDialog(
        context: context,
        title: 'WARNING',
        content: 'Do you want to delete?',
        actions: [
          TextButton(
              onPressed: () {
                delteCinema(cinema).whenComplete(() {
                  setState(() {
                    list = fetchList();
                    Navigator.of(context).pop();
                  });
                }).catchError((error) {
                  CustomDialog.makeDialog(
                      context: context,
                      title: 'ERROR',
                      content: 'Can not delete!');
                });
              },
              child: const Text('OK')),
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'))
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          SliverToBoxAdapter(
              child: FutureBuilder<List<Cinema>>(
            future: list,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.9),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Cinema cine = snapshot.data[index];
                      return ListItem(
                        cinema: cine,
                        onClick: () {
                          Navigator.of(context)
                              .pushNamed('$DetailScreen', arguments: cine)
                              .then((value) {
                            setState(() {
                              list = fetchList();
                            });
                          });
                        },
                        onEdit: () {
                          Navigator.of(context)
                              .pushNamed('/update',
                                  arguments:
                                      Argument(isUpdate: true, cinema: cine))
                              .then((value) {
                            setState(() {
                              list = fetchList();
                            });
                          });
                        },
                        onDelete: () {
                          onHandleDelete(cine);
                        },
                      );
                    });
              } else {
                return const Center(child: Text("Loading..."));
              }
            },
          ))
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Cinema cinema;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onClick;
  const ListItem(
      {Key? key,
      required this.cinema,
      this.onEdit,
      this.onDelete,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            onTap: onClick,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  backgroundColor: kLightColor,
                  backgroundImage: AssetImage(
                      'assets/images/ic_${cinema.status == 'Open' ? 'open' : 'close'}.png'),
                  radius: 40,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  cinema.name,
                  style: PrimaryFont.medium(18),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'ID: #${cinema.id}',
                  style: PrimaryFont.regular(14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: onEdit,
                        icon: const Icon(
                          Icons.edit,
                          color: kGreenColor,
                        )),
                    IconButton(
                        onPressed: onDelete,
                        icon: const Icon(
                          Icons.delete,
                          color: kPrimaryColor,
                        )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      title: Text(
        'List Cinemas',
        style: PrimaryFont.medium(25).copyWith(color: Colors.white),
      ),
      backgroundColor: kLightColor,
      floating: true,
      pinned: true,
      // flexibleSpace: FlexibleSpaceBar(
      //   stretchModes: const [StretchMode.blurBackground, StretchMode.fadeTitle],
      //   background: Stack(
      //     fit: StackFit.expand,
      //     children: [
      //       Image.asset(
      //         'assets/images/appbar_bg_list.png',
      //         fit: BoxFit.contain,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
