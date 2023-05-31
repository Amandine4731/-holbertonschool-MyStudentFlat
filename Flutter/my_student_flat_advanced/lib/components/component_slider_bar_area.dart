import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'package:my_student_flat_4/main.dart';

class ComponentSliderBarArea extends StatefulWidget {
  const ComponentSliderBarArea({Key? key}) : super(key: key);

  @override
  _ComponentSliderBarAreaState createState() => _ComponentSliderBarAreaState();
}

class _ComponentSliderBarAreaState extends State<ComponentSliderBarArea> {
  SfRangeValues _values = SfRangeValues(0.0, 80.0);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SfRangeSlider(
            min: 0.0,
            max: 80.0,
            values: _values,
            interval: 10,
            showTicks: true,
            showDividers: true,
            showLabels: true,
            minorTicksPerInterval: 1,
            activeColor: colorGrey,
            inactiveColor: colorLightgrey,
            onChanged: (SfRangeValues values) {
              setState(() {
                _values = values;
              });
            },
            stepSize: 5, // Set stepSize to match the interval of the ticks
            enableIntervalSelection: true,
          ),
        ),
        Text(
          'm²',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w600,
            color: colorDarkgrey,
            fontSize: 16,
            decorationColor: colorOrange,
          ),
        ),
      ],
    );
  }
}
