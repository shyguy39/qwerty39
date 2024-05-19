import 'package:flutter/material.dart';
import 'package:lab5/person.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _pressureController;
  late TextEditingController _flowController;
  late TextEditingController _levelController;
  late TextEditingController _powerController;
  int currentIndex = 1;
  double _pressure = 0;
  double _flow = 0;
  double _level = 0;
  double _power = 0;
  String appBarTitle = "Factory 1";
  String selectedFactory = "Factory 1";
  List<Widget> containers = [];
  late Widget pressureGaugeWidget1;
  late Widget flowGaugeWidget1;
  late Widget levelGaugeWidget1;
  late Widget powerGaugeWidget1;
  late Widget pressureGaugeWidget2;
  late Widget flowGaugeWidget2;
  late Widget levelGaugeWidget2;
  late Widget powerGaugeWidget2;
  late Widget pressureGaugeWidget3;
  late Widget flowGaugeWidget3;
  late Widget levelGaugeWidget3;
  late Widget powerGaugeWidget3;

  @override
  void initState() {
    super.initState();
    _pressureController = TextEditingController();
    _flowController = TextEditingController();
    _levelController = TextEditingController();
    _powerController = TextEditingController();
    pressureGaugeWidget1 = buildPressureGauge(_pressure);
    flowGaugeWidget1 = buildFlowGauge(_flow);
    levelGaugeWidget1 = buildLevelGauge(_level);
    powerGaugeWidget1 = buildPowerGauge(_power);
    pressureGaugeWidget2 = buildPressureGauge(_pressure);
    flowGaugeWidget2 = buildFlowGauge(_flow);
    levelGaugeWidget2 = buildLevelGauge(_level);
    powerGaugeWidget2 = buildPowerGauge(_power);
    pressureGaugeWidget3 = buildPressureGauge(_pressure);
    flowGaugeWidget3 = buildFlowGauge(_flow);
    levelGaugeWidget3 = buildLevelGauge(_level);
    powerGaugeWidget3 = buildPowerGauge(_power);
  }

  @override
  void dispose() {
    _pressureController.dispose();
    _flowController.dispose();
    _levelController.dispose();
    _powerController.dispose();
    super.dispose();
  }

  void updateAllValues(double pressure, double flow, double level, double power,
      String factoryName) {
    setState(() {
      _pressure = pressure;
      _flow = flow;
      _level = level;
      _power = power;
      if (factoryName == 'Factory 1') {
        pressureGaugeWidget1 = buildPressureGauge(_pressure);
        flowGaugeWidget1 = buildFlowGauge(_flow);
        levelGaugeWidget1 = buildLevelGauge(_level);
        powerGaugeWidget1 = buildPowerGauge(_power);
      } else if (factoryName == 'Factory 2') {
        pressureGaugeWidget2 = buildPressureGauge(_pressure);
        flowGaugeWidget2 = buildFlowGauge(_flow);
        levelGaugeWidget2 = buildLevelGauge(_level);
        powerGaugeWidget2 = buildPowerGauge(_power);
      } else if (factoryName == 'Factory 3') {
        pressureGaugeWidget3 = buildPressureGauge(_pressure);
        flowGaugeWidget3 = buildFlowGauge(_flow);
        levelGaugeWidget3 = buildLevelGauge(_level);
        powerGaugeWidget3 = buildPowerGauge(_power);
      }
    });
  }

  Widget buildPressureGauge(double pressure) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double containerWidth = constraints.maxWidth * 1;
      double fontSize = containerWidth * 0.10;
      double markerOffset = containerWidth * -0.08;
      double rangePointerWidth = containerWidth * 0.13;

      return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
        child: Container(
          width: containerWidth,
          height: containerWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Steam Pressure',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              Expanded(
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Text(
                            '$pressure bar',
                            style: TextStyle(fontSize: fontSize),
                          ),
                          positionFactor: 0.30,
                          angle: 90,
                        ),
                      ],
                      minimum: 0,
                      maximum: 100,
                      endAngle: 0,
                      startAngle: 180,
                      axisLineStyle: const AxisLineStyle(
                        thicknessUnit: GaugeSizeUnit.factor,
                        thickness: 0.3,
                      ),
                      canScaleToFit: true,
                      minorTicksPerInterval: 0,
                      interval: 25,
                      showLabels: false,
                      pointers: <GaugePointer>[
                        MarkerPointer(
                          enableAnimation: true,
                          value: pressure,
                          markerOffset: markerOffset,
                        ),
                        RangePointer(
                          enableAnimation: true,
                          value: pressure,
                          width: rangePointerWidth,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildFlowGauge(double flow) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double containerWidth = constraints.maxWidth * 1;
      double fontSize = containerWidth * 0.10;
      double markerOffset = containerWidth * -0.08;
      double rangePointerWidth = containerWidth * 0.13;
      return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
        child: Container(
          width: containerWidth,
          height: containerWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Steam Flow',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              Expanded(
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Text(
                            '$flow T/H',
                            style: TextStyle(fontSize: fontSize),
                          ),
                          positionFactor: 0.30,
                          angle: 90,
                        ),
                      ],
                      minimum: 0,
                      maximum: 100,
                      endAngle: 0,
                      startAngle: 180,
                      axisLineStyle: const AxisLineStyle(
                        thicknessUnit: GaugeSizeUnit.factor,
                        thickness: 0.3,
                      ),
                      canScaleToFit: true,
                      minorTicksPerInterval: 0,
                      interval: 25,
                      showLabels: false,
                      pointers: <GaugePointer>[
                        MarkerPointer(
                          enableAnimation: true,
                          value: flow,
                          markerOffset: markerOffset,
                        ),
                        RangePointer(
                          enableAnimation: true,
                          value: flow,
                          width: rangePointerWidth,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildLevelGauge(double level) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double containerWidth = constraints.maxWidth * 1;
      double fontSize = containerWidth * 0.10;
      double markerOffset = containerWidth * -0.08;
      double rangePointerWidth = containerWidth * 0.13;
      return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
        child: Container(
          width: containerWidth,
          height: containerWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Steam Level',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              Expanded(
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Text(
                            '$level %',
                            style: TextStyle(fontSize: fontSize),
                          ),
                          positionFactor: 0.30,
                          angle: 90,
                        ),
                      ],
                      minimum: 0,
                      maximum: 100,
                      endAngle: 0,
                      startAngle: 180,
                      axisLineStyle: const AxisLineStyle(
                        thicknessUnit: GaugeSizeUnit.factor,
                        thickness: 0.3,
                      ),
                      canScaleToFit: true,
                      minorTicksPerInterval: 0,
                      interval: 25,
                      showLabels: false,
                      pointers: <GaugePointer>[
                        MarkerPointer(
                          enableAnimation: true,
                          value: level,
                          markerOffset: markerOffset,
                        ),
                        RangePointer(
                          enableAnimation: true,
                          value: level,
                          width: rangePointerWidth,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildPowerGauge(double power) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double containerWidth = constraints.maxWidth * 1;
      double fontSize = containerWidth * 0.10;
      double markerOffset = containerWidth * -0.08;
      double rangePointerWidth = containerWidth * 0.13;
      return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
        child: Container(
          width: containerWidth,
          height: containerWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Power Output',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              Expanded(
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Text(
                            '$power kW',
                            style: TextStyle(fontSize: fontSize),
                          ),
                          positionFactor: 0.30,
                          angle: 90,
                        ),
                      ],
                      minimum: 0,
                      maximum: 100,
                      endAngle: 0,
                      startAngle: 180,
                      axisLineStyle: const AxisLineStyle(
                        thicknessUnit: GaugeSizeUnit.factor,
                        thickness: 0.3,
                      ),
                      canScaleToFit: true,
                      minorTicksPerInterval: 0,
                      interval: 25,
                      showLabels: false,
                      pointers: <GaugePointer>[
                        MarkerPointer(
                          enableAnimation: true,
                          value: power,
                          markerOffset: markerOffset,
                        ),
                        RangePointer(
                          enableAnimation: true,
                          value: power,
                          width: rangePointerWidth,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime malaysiaTime = now.toUtc().add(const Duration(hours: 8));
    String date = DateFormat('yyyy-MM-dd').format(malaysiaTime);
    String time = DateFormat('HH:mm:ss').format(malaysiaTime);
    String formatedTime = '$date $time';

    void addContainer(String name, int number) {
      setState(() {
        containers.add(
          Container(
            width: calculateWidth(context, 350),
            height: calculateHeight(context, 100),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: calculateSize(context, 20),
                    ),
                  ),
                  Text(
                    '+60$number',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: calculateSize(context, 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    }

    Widget buildContainerContents(String factoryName, int currIndex) {
      switch (currIndex) {
        case 0:
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: calculateWidth(context, 342.7),
              height: calculateHeight(context, 470),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: containers.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsetsDirectional.all(10),
                          child: containers[index],
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          calculateWidth(context, 250), 20, 10, 20),
                      child: Container(
                        width: calculateWidth(context, 50),
                        height: calculateHeight(context, 50),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: calculateSize(context, 4),
                              color: const Color(0x33000000),
                              offset: Offset(
                                0,
                                calculateSize(context, 2),
                              ),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          key: const Key("addButton"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PersonPage(
                                  factoryName: factoryName,
                                  addContainer: addContainer,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: calculateSize(context, 24),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        case 1:
          if (factoryName == 'Factory 1') {
            formatedTime = "-- : --";
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: calculateWidth(context, 372.7),
                height: calculateHeight(context, 470),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.warning,
                          size: calculateSize(context, 24),
                        ),
                        Text(
                          ' ABD1234 IS UNREACHABLE !',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: calculateSize(context, 20),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: pressureGaugeWidget1),
                        Expanded(child: flowGaugeWidget1),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: levelGaugeWidget1),
                        Expanded(child: powerGaugeWidget1),
                      ],
                    ),
                    Text(
                      formatedTime,
                      style: TextStyle(
                        fontSize: calculateSize(context, 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (factoryName == 'Factory 2') {
            formatedTime = formatedTime;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: calculateWidth(context, 372.7),
                height: calculateHeight(context, 470),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '1549.7kW',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: calculateSize(context, 20),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: pressureGaugeWidget2),
                        Expanded(child: flowGaugeWidget2),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: levelGaugeWidget2),
                        Expanded(child: powerGaugeWidget2),
                      ],
                    ),
                    Text(
                      formatedTime,
                      style: TextStyle(
                        fontSize: calculateSize(context, 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (factoryName == 'Factory 3') {
            formatedTime = "-- : --";
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: calculateWidth(context, 372.7),
                height: calculateHeight(context, 470),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.warning,
                          size: calculateSize(context, 24),
                        ),
                        Text(
                          ' ABD5678 IS UNREACHABLE !',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: calculateSize(context, 20),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: pressureGaugeWidget3),
                        Expanded(child: flowGaugeWidget3),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: levelGaugeWidget3),
                        Expanded(child: powerGaugeWidget3),
                      ],
                    ),
                    Text(
                      formatedTime,
                      style: TextStyle(
                        fontSize: calculateSize(context, 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        case 2:
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: calculateWidth(context, 372.7),
              height: calculateHeight(context, 470),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Minimum Threshold',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Readex Pro',
                            fontSize: calculateSize(context, 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Icon(
                            Icons.info_outline,
                            size: calculateSize(context, 24),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              calculateSize(context, 35), 0, 10, 0),
                          child: Container(
                            width: calculateWidth(context, 70),
                            height: calculateHeight(context, 40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Transform.scale(
                              scale: 1,
                              child: ElevatedButton(
                                key: const Key("editButton"),
                                onPressed: () {
                                  updateAllValues(
                                    double.parse(_pressureController.text),
                                    double.parse(_flowController.text),
                                    double.parse(_levelController.text),
                                    double.parse(_powerController.text),
                                    factoryName,
                                  );
                                },
                                child: Icon(
                                  Icons.edit,
                                  size: calculateSize(context, 24),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Steam \nPressure',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: calculateSize(context, 20),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Container(
                              width: calculateWidth(context, 120),
                              height: calculateHeight(context, 50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      key: const Key("typePressure"),
                                      style: TextStyle(
                                        fontSize: calculateSize(context, 16),
                                      ),
                                      controller: _pressureController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          fontSize: calculateSize(context, 16),
                                        ),
                                        hintText: 'Type here',
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: calculateHeight(context, 100),
                                    child: const VerticalDivider(
                                      thickness: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Text(
                                      'bar',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontWeight: FontWeight.bold,
                                        fontSize: calculateSize(context, 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Steam \nFlow',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: calculateSize(context, 20),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Container(
                              width: calculateWidth(context, 120),
                              height: calculateHeight(context, 50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      key: const Key("typeFlow"),
                                      style: TextStyle(
                                        fontSize: calculateSize(context, 16),
                                      ),
                                      controller: _flowController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          fontSize: calculateSize(context, 16),
                                        ),
                                        hintText: 'Type here',
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: calculateHeight(context, 100),
                                    child: const VerticalDivider(
                                      thickness: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Text(
                                      'T/H',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontWeight: FontWeight.bold,
                                        fontSize: calculateSize(context, 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Water \nLevel',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: calculateSize(context, 20),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Container(
                              width: calculateWidth(context, 120),
                              height: calculateHeight(context, 50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      key: const Key("typeLevel"),
                                      style: TextStyle(
                                        fontSize: calculateSize(context, 16),
                                      ),
                                      controller: _levelController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          fontSize: calculateSize(context, 16),
                                        ),
                                        hintText: 'Type here',
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: calculateHeight(context, 100),
                                    child: const VerticalDivider(
                                      thickness: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Text(
                                      '%',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontWeight: FontWeight.bold,
                                        fontSize: calculateSize(context, 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Power \nFrequency',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: calculateSize(context, 20),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Container(
                              width: calculateWidth(context, 120),
                              height: calculateHeight(context, 50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      key: const Key("typePower"),
                                      style: TextStyle(
                                        fontSize: calculateSize(context, 16),
                                      ),
                                      controller: _powerController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          fontSize: calculateSize(context, 16),
                                        ),
                                        hintText: 'Type here',
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: calculateHeight(context, 100),
                                    child: const VerticalDivider(
                                      thickness: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Text(
                                      'Hz',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontWeight: FontWeight.bold,
                                        fontSize: calculateSize(context, 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        default:
          return Container();
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appBarTitle,
          style: TextStyle(
            fontSize: calculateSize(context, 16),
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              size: calculateSize(context, 20),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildContainerContents(selectedFactory,
                  currentIndex), // Render container contents based on selected factory
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      GestureDetector(
                        key: const Key("factory1"),
                        onTap: () {
                          setState(() {
                            appBarTitle = 'Factory 1';
                            selectedFactory =
                                'Factory 1'; // Update selected factory
                          });
                        },
                        child: Container(
                          width: calculateWidth(context, 160),
                          height: calculateHeight(context, 110),
                          margin: const EdgeInsets.fromLTRB(20, 5, 15, 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: selectedFactory == 'Factory 1'
                                ? Border.all(color: Colors.blue, width: 2)
                                : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.factory,
                                color: Colors.black,
                                size: calculateSize(context, 30),
                              ),
                              Text(
                                'Factory 1',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: calculateSize(context, 20),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        key: const Key("factory2"),
                        onTap: () {
                          setState(() {
                            appBarTitle = 'Factory 2';
                            selectedFactory =
                                'Factory 2'; // Update selected factory
                          });
                        },
                        child: Container(
                          width: calculateWidth(context, 160),
                          height: calculateHeight(context, 110),
                          margin: EdgeInsets.fromLTRB(
                              10, 5, calculateSize(context, 15), 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: selectedFactory == 'Factory 2'
                                ? Border.all(color: Colors.blue, width: 2)
                                : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.factory,
                                color: Colors.black,
                                size: calculateSize(context, 30),
                              ),
                              Text(
                                'Factory 2',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: calculateSize(context, 20),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        key: const Key("factory3"),
                        onTap: () {
                          setState(() {
                            appBarTitle = 'Factory 3';
                            selectedFactory =
                                'Factory 3'; // Update selected factory
                          });
                        },
                        child: Container(
                          width: calculateWidth(context, 160),
                          height: calculateHeight(context, 110),
                          margin: EdgeInsets.fromLTRB(
                              calculateSize(context, 10), 5, 20, 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: selectedFactory == 'Factory 3'
                                ? Border.all(color: Colors.blue, width: 2)
                                : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.factory,
                                color: Colors.black,
                                size: calculateSize(context, 30),
                              ),
                              Text(
                                'Factory 3',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: calculateSize(context, 20),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            label: 'Person',
            icon: Icon(
              Icons.person,
              size: calculateSize(context, 20),
              key: const Key("personIcon"),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home_outlined,
              size: calculateSize(context, 20),
              key: const Key("homeIcon"),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Setting',
            icon: Icon(
              Icons.settings,
              size: calculateSize(context, 20),
              key: const Key("settingIcon"),
            ),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
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
