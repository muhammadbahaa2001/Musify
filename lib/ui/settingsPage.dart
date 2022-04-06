import 'package:fluttertoast/fluttertoast.dart';
import 'package:musify/services/data_manager.dart';
import 'package:musify/style/appColors.dart';
import 'package:musify/ui/aboutPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            color: accent,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(child: SettingsCards()),
    );
  }
}

class SettingsCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 6),
            child: Card(
              color: Color(0xff263238),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 2.3,
              child: ListTile(
                leading: Icon(MdiIcons.shapeOutline, color: accent),
                title: Text(
                  'Accent Color',
                  style: TextStyle(color: accent),
                ),
                onTap: () {
                  showModalBottomSheet(
                      isDismissible: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        final List<int> colors = [
                          0xFFFFCDD2,
                          0xFFF8BBD0,
                          0xFFE1BEE7,
                          0xFFD1C4E9,
                          0xFFC5CAE9,
                          0xFF8C9EFF,
                          0xFFBBDEFB,
                          0xFF82B1FF,
                          0xFFB3E5FC,
                          0xFF80D8FF,
                          0xFFB2EBF2,
                          0xFF84FFFF,
                          0xFFB2DFDB,
                          0xFFA7FFEB,
                          0xFFC8E6C9,
                          0xFFB9F6CA,
                          0xFFDCEDC8,
                          0xFFCCFF90,
                          0xFFF0F4C3,
                          0xFFF4FF81,
                          0xFFFFF9C4,
                          0xFFFFFF8D,
                          0xFFFFECB3,
                          0xFFFFE57F,
                          0xFFFFE0B2,
                          0xFFFFD180,
                          0xFFFFCCBC,
                          0xFFFF9E80,
                          0xFFFFFFFF
                        ];
                        return Center(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: bgColor,
                                    border: Border.all(
                                      color: accent,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                width: MediaQuery.of(context)
                                        .copyWith()
                                        .size
                                        .width *
                                    0.90,
                                child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                    ),
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: colors.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: const EdgeInsets.only(
                                            top: 15.0,
                                            bottom: 15.0,
                                          ),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                colors.length - 1 > index
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          addOrUpdateData(
                                                              "settings",
                                                              "accentColor",
                                                              colors[index]);
                                                          accent = Color(
                                                              colors[index]);
                                                          Fluttertoast.showToast(
                                                              backgroundColor:
                                                                  accent,
                                                              textColor:
                                                                  Colors.white,
                                                              msg:
                                                                  "Accent Color has been Changed, move to other page to see changes!",
                                                              toastLength: Toast
                                                                  .LENGTH_SHORT,
                                                              gravity:
                                                                  ToastGravity
                                                                      .BOTTOM,
                                                              timeInSecForIosWeb:
                                                                  1,
                                                              fontSize: 14.0);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Material(
                                                            elevation: 4.0,
                                                            shape:
                                                                const CircleBorder(),
                                                            child: CircleAvatar(
                                                                radius: 25,
                                                                backgroundColor:
                                                                    Color(colors[
                                                                        index]))),
                                                      )
                                                    : SizedBox.shrink()
                                              ]));
                                    })));
                      });
                },
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 6),
            child: Card(
              color: Color(0xff263238),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 2.3,
              child: ListTile(
                leading: Icon(MdiIcons.broom, color: accent),
                title: Text(
                  'Clear Cache',
                  style: TextStyle(color: accent),
                ),
                onTap: () {
                  clearCache();
                  Fluttertoast.showToast(
                      backgroundColor: accent,
                      textColor: Colors.white,
                      msg: "Cache cleared!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      fontSize: 14.0);
                },
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 6),
            child: Card(
              color: Color(0xff263238),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 2.3,
              child: ListTile(
                leading: Icon(MdiIcons.information, color: accent),
                title: Text(
                  'About',
                  style: TextStyle(color: accent),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AboutPage()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}