import 'package:flutter/material.dart';
import 'package:lab5/activation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ActivationPage(),
    );
  }
}

class ActivationPage extends StatefulWidget {
  const ActivationPage({super.key});

  @override
  State<ActivationPage> createState() => _ActivationPageState();
}

class _ActivationPageState extends State<ActivationPage> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'images/upm.jpg',
                          width: calculateWidth(context, 200),
                          height: calculateHeight(context, 150),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Welcome !',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: calculateSize(context, 40),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: calculateWidth(context, 330),
                                height: calculateHeight(context, 400),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFDADA),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 20, 5, 80),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0,
                                                calculateSize(context, 80), 0),
                                            child: Text(
                                              'Enter your mobile number to \nactivate your account.',
                                              style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                fontSize:
                                                    calculateSize(context, 17),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.info_outlined,
                                            size: calculateSize(context, 24),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Image.asset(
                                            'images/malaysia.jpg',
                                            width: calculateWidth(context, 40),
                                            height:
                                                calculateHeight(context, 25),
                                            fit: BoxFit.cover,
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 0, 0, 0),
                                            child: Text(
                                              '+60',
                                              style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                                fontSize:
                                                    calculateSize(context, 16),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      30, 0, 20, 0),
                                              child: TextField(
                                                key: const Key("mainPhone"),
                                                style: TextStyle(
                                                  fontSize: calculateSize(
                                                      context, 16),
                                                ),
                                                keyboardType:
                                                    TextInputType.phone,
                                                decoration: InputDecoration(
                                                  hintStyle: TextStyle(
                                                    fontSize: calculateSize(
                                                        context, 16),
                                                  ),
                                                  hintText:
                                                      'Enter your phone number',
                                                  border:
                                                      const OutlineInputBorder(),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 20, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Transform.scale(
                                            scale: calculateSize(context, 1),
                                            child: Checkbox(
                                              value: isChecked,
                                              activeColor: Colors.blue,
                                              onChanged: (newBool) {
                                                setState(() {
                                                  isChecked = newBool;
                                                });
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              'I agree to the term & conditions',
                                              style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                fontSize:
                                                    calculateSize(context, 15),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: calculateWidth(context, 200),
                                      height: calculateHeight(context, 40),
                                      child: ElevatedButton(
                                        key: const Key("getOTPButton"),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ActivationPages(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Get Activation Code',
                                          style: TextStyle(
                                            fontSize:
                                                calculateSize(context, 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Disclaimer | Privacy Statement',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: calculateSize(context, 16),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Copyright UPM & Kejuruteraan Minyak Sawit\nCCS Sdn. Bhd.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: calculateSize(context, 12),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double calculateSize(BuildContext context, double baseFontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = screenWidth / 420;
    double scaledFontSize = baseFontSize * scaleFactor;

    return scaledFontSize;
  }

  double calculateWidth(BuildContext context, double baseWidth) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = screenWidth / 380;
    double scaledWidth = baseWidth * scaleFactor;

    return scaledWidth;
  }

  double calculateHeight(BuildContext context, double baseHeight) {
    double screenHeight = MediaQuery.of(context).size.height;
    double scaleFactor = screenHeight / 660;
    double scaledHeight = baseHeight * scaleFactor;

    return scaledHeight;
  }
}
