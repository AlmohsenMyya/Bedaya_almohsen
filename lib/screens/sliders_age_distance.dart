import 'package:flutter/material.dart';

class AgeSlider extends StatefulWidget {
  final String labelText;
  final int initialMinAge;
  final int initialMaxAge;
  final Function(int minAge, int maxAge) onChanged;

  const AgeSlider({
    Key? key,
    required this.labelText,
    required this.initialMinAge,
    required this.initialMaxAge,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<AgeSlider> createState() => _AgeSliderState();
}

class _AgeSliderState extends State<AgeSlider> {
  late int _minAge;
  late int _maxAge;

  @override
  void initState() {
    super.initState();
    _minAge = widget.initialMinAge;
    _maxAge = widget.initialMaxAge;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${widget.labelText}: $_minAge - $_maxAge',
          style: const TextStyle(fontSize: 16),
        ),
        RangeSlider(
          values: RangeValues(_minAge.toDouble(), _maxAge.toDouble()),
          min: 18,
          max: 70,
          divisions: 52,
          labels: RangeLabels('$_minAge', '$_maxAge'),
          onChanged: (RangeValues values) {
            setState(() {
              _minAge = values.start.toInt();
              _maxAge = values.end.toInt();
            });
            widget.onChanged(_minAge, _maxAge);
          },
        ),
      ],
    );
  }
}

class DistanceSlider extends StatefulWidget {
  final String labelText;
  final int initialDistance;
  final Function(int distance) onChanged;

  const DistanceSlider({
    Key? key,
    required this.labelText,
    required this.initialDistance,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DistanceSlider> createState() => _DistanceSliderState();
}

class _DistanceSliderState extends State<DistanceSlider> {
  late int _distance;

  @override
  void initState() {
    super.initState();
    _distance = widget.initialDistance;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _distance == 200210
              ? '${widget.labelText}: Anywhere'
              : '${widget.labelText}: $_distance km',
          style: const TextStyle(fontSize: 16),
        ),
        Slider(
          value: _distance.toDouble(),
          min: 0,
          max: 200210,
          divisions: 100,
          label:           _distance == 200210
              ? '${widget.labelText}: Anywhere'
              : '${widget.labelText}: $_distance km',
          onChanged: (double value) {
            setState(() {
              _distance = value.toInt();
            });
            widget.onChanged(_distance);
          },
        ),
      ],
    );
  }
}
