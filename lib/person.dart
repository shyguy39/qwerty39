import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  final String factoryName;
  final Function(String, int) addContainer;

  const PersonPage(
      {super.key, required this.factoryName, required this.addContainer});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.factoryName),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Invitation',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: calculateSize(context, 35),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Invite users',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.w400,
                          fontSize: calculateSize(context, 16),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Owner\'s Name',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: calculateSize(context, 17),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: TextField(
                      key: const Key("typeName"),
                      style: TextStyle(
                        fontSize: calculateSize(context, 16),
                      ),
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: calculateSize(context, 16),
                        ),
                        hintText: 'Type here',
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Owner\'s Phone Number',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: calculateSize(context, 17),
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    'images/malaysia.jpg',
                    width: calculateWidth(context, 40),
                    height: calculateHeight(context, 25),
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      '+60',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                        fontSize: calculateSize(context, 17),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: TextField(
                        key: const Key("typePhone"),
                        style: TextStyle(
                          fontSize: calculateSize(context, 16),
                        ),
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: calculateSize(context, 16),
                          ),
                          hintText: 'Enter your phone number',
                          border: const OutlineInputBorder(),
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
              padding: EdgeInsets.fromLTRB(0, calculateSize(context, 20), 0, 0),
              child: Transform.scale(
                scale: calculateSize(context, 1),
                child: ElevatedButton(
                  key: const Key("submitButton"),
                  onPressed: () {
                    widget.addContainer(
                        _nameController.text, int.parse(_phoneController.text));
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: calculateSize(context, 16),
                    ),
                  ),
                ),
              ),
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
