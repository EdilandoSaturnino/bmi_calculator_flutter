import 'package:flutter/material.dart';
import 'package:bmi_calculator/services/colors.dart';

class GenderSelectionCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final Function(String) onSelect;
  final bool isSelected;

  const GenderSelectionCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.onSelect,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<GenderSelectionCard> createState() => _GenderSelectionCardState();
}

class _GenderSelectionCardState extends State<GenderSelectionCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!widget.isSelected) {
            widget.onSelect(widget.label.toLowerCase());
          }
        },
        child: Container(
          height: 180,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          decoration: BoxDecoration(
            color: widget.isSelected ? Colors.blue : kActiveCardColour,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: widget.isSelected ? Colors.white : Colors.transparent,
              width: 2.0,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                widget.icon,
                size: 80,
                color:
                    widget.isSelected ? Colors.white : kBottomContainerColour,
              ),
              Text(
                widget.label,
                style: TextStyle(
                  color:
                      widget.isSelected ? Colors.white : kBottomContainerColour,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
