import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/view/librarymodule/controller/library_controller.dart';
import 'package:sreshtgeeth/view/librarymodule/music.dart';
import 'package:sreshtgeeth/view/librarymodule/podcasts.dart';
import '../../../common/base_colors.dart';

class library1 extends StatefulWidget {
  const library1({super.key});

  @override
  State<library1> createState() => _library1State();
}

class _library1State extends State<library1> {
  LibraryCon librarycon = Get.put(LibraryCon());
  TabController? _tabController;
  var currentindex = 0;
  var selectedTabIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  call() async {
    await librarycon.musiclibraryapi();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                        color: greyColor,
                        border: Border.all(color: blackColor,width: 1),
                        borderRadius: BorderRadius.circular(21)),
                    child: TabBar(
                        indicator: BoxDecoration(
                            color: blackColor,
                            borderRadius: BorderRadius.circular(21)),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: blackColor,
                        unselectedLabelColor: blackColor,
                        labelColor: whiteColor,
                        dividerColor: Colors.transparent,
                        tabs: [
                          Tab(
                            text: "Music",
                          ),
                          Tab(
                            text: "podcast",
                          )
                        ]),
                  ),
                  Expanded(
                    child: Container(
                      child: RefreshIndicator(
                        onRefresh: () {
                          return Future.delayed(Duration(seconds: 1), () {
                            setState(() {});
                          });
                        },
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            LibraryMusic(),
                            LibraryPodcasts(),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          )),
    );
  }
}