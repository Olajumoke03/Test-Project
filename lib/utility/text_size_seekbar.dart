import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project_github/utility/font_controller.dart';

class ChangeTextSizeWithSeekBar extends StatefulWidget {

  const ChangeTextSizeWithSeekBar({super.key});

  @override
  State<ChangeTextSizeWithSeekBar> createState() => _ChangeTextSizeWithSeekBarState();
}

class _ChangeTextSizeWithSeekBarState extends State<ChangeTextSizeWithSeekBar> {
  late FontSizeController _fontSizeController;

  double _value=2.6;
  @override
  void initState() {
    super.initState();
    _fontSizeController = Provider.of<FontSizeController>(context, listen: false);
    setState(() {
      _value = _fontSizeController.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120,
      // color: Theme.of(context).textTheme.labelSmall!.color,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Text( "Text Size",
            //   style: TextStyle( fontSize: 10* _value, color:Theme.of(context).textTheme.bodyMedium!.color ),
            // ),

            Row(
              children: [
                Text("A"),
                Expanded(
                  child: SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Color(0XFFAFB5D9), // Active track color
                      inactiveTrackColor: Color(0XFFAFB5D9).withOpacity(0.3), // Inactive track color
                      thumbColor: Color(0XFFAFB5D9), // Thumb color
                      trackHeight: 15, // Thickness of the track
                      thumbShape: _RectangularThumbShape(), // Custom rectangular thumb shape
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 16), // Overlay when sliding
                      tickMarkShape: RoundSliderTickMarkShape(), // For the divisions (dots)
                      activeTickMarkColor: Colors.white, // Active dot color
                      inactiveTickMarkColor: Color(0XFFAFB5D9), // Inactive dot color
                    ),
                    child: Slider(
                      divisions: 9,
                      // activeColor: mainColor,
                      // inactiveColor: Colors.white,
                      onChanged: (value){
                        setState(() {
                          _value = value;
                        });
                        _fontSizeController.updateFontSize(_value);
                      },
                      max: 3,
                      min: 2,
                      value: _value,
                    ),
                  ),
                ),

                Text("A", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),

              ],
            ),


          ],
        ),
      ),
    );
  }
}



// Custom rectangular thumb shape
class _RectangularThumbShape extends SliderComponentShape {
  static const double _thumbHeight = 35.0;
  static const double _thumbWidth = 8.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(_thumbWidth, _thumbHeight); // Size of the rectangle
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter? labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    final Paint paint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.blue
      ..style = PaintingStyle.fill;

    final Rect thumbRect = Rect.fromCenter(
      center: center,
      width: _thumbWidth,
      height: _thumbHeight,
    );

    canvas.drawRect(thumbRect, paint);
  }
}



