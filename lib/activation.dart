import 'package:flutter/material.dart';
import 'package:lab5/home.dart';

class ActivationPages extends StatefulWidget {
  const ActivationPages({super.key});

  @override
  State<ActivationPages> createState() => _ActivationPagesState();
}

class _ActivationPagesState extends State<ActivationPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                  child: SingleChildScrollView(
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
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 20, 5, 50),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0,
                                                calculateSize(context, 80), 0),
                                            child: Text(
                                              'Enter the activation code you \nreceived via SMS.',
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
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      30, 0, 30, 0),
                                              child: TextField(
                                                key: const Key("typeOTP"),
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
                                                  hintText: 'OTP',
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
                                          40, 5, 40, 50),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            '0 / 6',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Readex Pro',
                                              fontSize:
                                                  calculateSize(context, 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 20, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Didn\'t receive?',
                                            style: TextStyle(
                                              fontFamily: 'Readex Pro',
                                              fontSize:
                                                  calculateSize(context, 16),
                                            ),
                                          ),
                                          Text(
                                            'Tap here',
                                            style: TextStyle(
                                              fontSize:
                                                  calculateSize(context, 16),
                                              fontFamily: 'Readex Pro',
                                              color: Colors.blue,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, calculateSize(context, 20), 0, 10),
                                      child: Transform.scale(
                                        scale: calculateSize(context, 1),
                                        child: ElevatedButton(
                                          key: const Key("activateButton"),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomePage(),
                                              ),
                                            );
                                          },
                                          child: const Text('Activate'),
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
                ),
              ],
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
                      fontSize: calculateSize(context, 16),
                      fontFamily: 'Readex Pro',
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
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
    double scaleFactor = screenWidth / 400;
    double scaledFontSize = baseFontSize * scaleFactor;

    return scaledFontSize;
  }

  double calculateWidth(BuildContext context, double baseWidth) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = screenWidth / 360;
    double scaledWidth = baseWidth * scaleFactor;

    return scaledWidth;
  }

  double calculateHeight(BuildContext context, double baseHeight) {
    double screenHeight = MediaQuery.of(context).size.height;
    double scaleFactor = screenHeight / 640;
    double scaledHeight = baseHeight * scaleFactor;

    return scaledHeight;
  }
}
