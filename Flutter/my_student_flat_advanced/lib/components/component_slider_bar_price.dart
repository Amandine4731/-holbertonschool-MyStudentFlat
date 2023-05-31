import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'package:my_student_flat_4/main.dart';

class ComponentSliderBarPrice extends StatefulWidget {
  const ComponentSliderBarPrice({Key? key}) : super(key: key);

  @override
  _ComponentSliderBarPriceState createState() =>
      _ComponentSliderBarPriceState();
}

class _ComponentSliderBarPriceState extends State<ComponentSliderBarPrice> {
  SfRangeValues _values = SfRangeValues(300.0, 800.0);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SfRangeSlider(
            min: 300.0,
            max: 800.0,
            values: _values,
            interval: 100,
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
            stepSize: 50, // Set stepSize to match the interval of the ticks
            enableIntervalSelection: true,
          ),
        ),
        SizedBox(width: 10),
        Text(
          '€',
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
