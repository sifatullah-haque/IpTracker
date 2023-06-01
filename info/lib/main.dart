import 'package:flutter/material.dart';
import 'package:info/data/ip_data.dart';
import 'package:info/info_text.dart';

import 'button/my_button.dart';
import 'info_title_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController inputField = TextEditingController();
  String ipAddress = "No IP";
  String city = "None";
  String region = "None";
  String country = "None";
  String latLong = "None";
  String operator = "None";
  String postCode = "None";
  String timezone = "None";

  void _restartApp() {
    setState(() {
      inputField.text = "";
      ipAddress = "No IP";
      city = "None";
      region = "None";
      country = "None";
      latLong = "None";
      operator = "None";
      postCode = "None";
      timezone = "None";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xff0F0817),
            image: DecorationImage(
              image: AssetImage("assets/bg_high.png"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                height: 120.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  controller: inputField,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    fillColor: const Color(0xff1E133E),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: 'Example: 192.168.0.5',
                    hintStyle: const TextStyle(
                      color: Color(0xff432D83),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myButton(
                      text: "My IP",
                      icon: Image.asset(
                        "assets/my_ip.png",
                        height: 30.0,
                      ),
                      onPress: () async {
                        String ipFormDataScource = await ipData.myIpInfo();
                        inputField.text = ipFormDataScource;
                        setState(() {
                          ipAddress = ipFormDataScource;
                        });
                      },
                    ),
                    const SizedBox(width: 5.0),
                    myButton(
                      text: "Get Info",
                      icon: Image.asset(
                        "assets/get_info.png",
                        height: 30.0,
                      ),
                      onPress: () async {
                        Map ipInfo =
                            await ipData.getIpInformation(inputField.text);
                        setState(() {
                          ipAddress = inputField.text;
                          city = ipInfo["city"];
                          region = ipInfo["region"];
                          country = ipInfo["country"];
                          latLong = ipInfo["loc"];
                          operator = ipInfo["org"];
                          postCode = ipInfo["postal"];
                          timezone = ipInfo["timezone"];
                        });
                      },
                    ),
                    const SizedBox(width: 5.0),
                    myButton(
                      text: "Restart",
                      icon: Icon(
                        Icons.restart_alt,
                        size: 30.0,
                        color: Color(0xff481E71),
                      ),
                      onPress: () {
                        _restartApp();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    const Text(
                      "Information about the IP",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      ipAddress,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        infoTitleText(text: "City"),
                        infoTitleText(text: "Region"),
                        infoTitleText(text: "Country"),
                        infoTitleText(text: "Lat & long"),
                        infoTitleText(text: "Postal Code"),
                        infoTitleText(text: "Timezone"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          infoText(text: city),
                          infoText(text: region),
                          infoText(text: country),
                          infoText(text: latLong),
                          infoText(text: postCode),
                          infoText(text: timezone),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
