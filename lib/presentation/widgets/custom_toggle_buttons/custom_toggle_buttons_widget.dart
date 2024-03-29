import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';

class CustomToggleButtonsWidget extends StatefulWidget {
  final Function(int index) onSelected;

  const CustomToggleButtonsWidget({super.key, required this.onSelected});

  @override
  // ignore: library_private_types_in_public_api
  _CustomToggleButtonsWidgetState createState() =>
      _CustomToggleButtonsWidgetState();
}

class _CustomToggleButtonsWidgetState extends State<CustomToggleButtonsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      // color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    widget.onSelected(0);
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: selectedIndex == 0
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                    backgroundColor: selectedIndex == 0
                        ? AppColors.borderColor
                        : AppColors.whiteColor,
                    elevation: selectedIndex == 0 ? 2 : 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/timer.svg',
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 0
                                ? AppColors.whiteColor
                                : AppColors.primaryColor,
                            BlendMode.srcIn,
                          ),
                          width: 24.0,
                          height: 24.0,
                        ),
                        const SizedBox(width: 6),
                        Text('One-time',
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedIndex == 0
                                  ? AppColors.whiteColor
                                  : AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Roboto',
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    widget.onSelected(1);
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: selectedIndex == 1
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                    backgroundColor: selectedIndex == 1
                        ? AppColors.borderColor
                        : Colors.white,
                    elevation: selectedIndex == 1 ? 2 : 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 10.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/history.svg',
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 1
                                ? AppColors.whiteColor
                                : AppColors.primaryColor,
                            BlendMode.srcIn,
                          ),
                          width: 24.0,
                          height: 24.0,
                        ),
                        const SizedBox(width: 6),
                        Text('Recurring',
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedIndex == 1
                                  ? AppColors.whiteColor
                                  : AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Roboto',
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
