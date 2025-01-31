

// theme_selector.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_project_github/utility/app_provider.dart';
import 'package:test_project_github/utility/constants.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    // Determine current theme mode
    final isLightMode = appProvider.theme == Constants.lightTheme;
    final ThemeMode currentThemeMode = isLightMode ? ThemeMode.light : ThemeMode.dark;

    return SegmentedButton<ThemeMode>(
      showSelectedIcon: false,

      segments: const [
        ButtonSegment<ThemeMode>(
          value: ThemeMode.light,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.light_mode_outlined, size: 16),
              SizedBox(width: 5),
              Text('Light Mode', style: TextStyle(fontSize: 13),),
            ],
          ),
        ),

        // ButtonSegment<ThemeMode>(
        //   value: ThemeMode.system,
        //   label: Row(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Icon(Icons.phone_android_sharp, size: 16),
        //       SizedBox(width: 5),
        //       Text('Follow Device', style: TextStyle(fontSize: 13),),
        //     ],
        //   ),
        // ),

        ButtonSegment<ThemeMode>(
          value: ThemeMode.dark,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.dark_mode_outlined, size: 16),
              SizedBox(width: 5),
              Text('Dark Mode', style: TextStyle(fontSize: 13),),
            ],
          ),
        ),
      ],

      selected: {currentThemeMode},

      onSelectionChanged: (Set<ThemeMode> newSelection) {
        final newMode = newSelection.first;
        if (newMode == ThemeMode.light) {
          Provider.of<AppProvider>(context, listen: false)
              .setTheme(Constants.lightTheme, "light");
        } else {
          Provider.of<AppProvider>(context, listen: false)
              .setTheme(Constants.darkTheme, "dark");
        }
      },

      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return Theme.of(context).colorScheme.primaryContainer;
              // return Theme.of(context).colorScheme.primaryContainer;
            }
            return Colors.transparent;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return Theme.of(context).colorScheme.onPrimaryContainer;
            }
            return Theme.of(context).colorScheme.onSurface;
          },
        ),
      ),
    );
  }
}





