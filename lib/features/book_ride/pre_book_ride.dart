import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart'; // For formatting date and time

import '../../design-system/styles.dart';
import '../../shared/constants.dart';
import 'home_screen.dart';

class PreBookRide extends StatefulWidget {
  const PreBookRide({super.key});

  @override
  _PreBookRideState createState() => _PreBookRideState();
}

class _PreBookRideState extends State<PreBookRide> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  VehicleType selectedVehicle = VehicleType.none;
  String? _startLocation;
  String? _endLocation;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PreBook Your Ride"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 0.8.sh,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Date',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacing.hmed,
                    TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      // This makes the TextFormField non-editable
                      onTap: () => _selectDate(context),
                      decoration: InputDecoration(
                        labelText: 'Choose Date',
                        suffixIcon: InkWell(
                          onTap: () => _selectDate(context),
                          child:
                              const Icon(Icons.calendar_today), // Calendar icon
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 20.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Spacing.hmed,
                    const Text(
                      'Select Time',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacing.hmed,
                    TextFormField(
                      controller: _timeController,
                      readOnly: true,
                      onTap: () => _selectTime(context),
                      decoration: InputDecoration(
                        labelText: 'Choose Time',
                        suffixIcon: InkWell(
                          onTap: () => _selectTime(context),
                          child: const Icon(Icons.lock_clock), // Calendar icon
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 20.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Spacing.hmed,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Select PickUp Location',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacing.hmed,
                        startLocation(),
                        Spacing.hlg,
                        const Text(
                          'Select Destination Location',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacing.hmed,
                        destination(destinations),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Confirm booking logic here
                          if (_selectedDate != null && _selectedTime != null) {
                            // Process booking with the selected date and time
                          } else {
                            // Show a message to select both date and time
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Please select both date and time!'),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          'Confirm Ride',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                    ),
                    Spacing.hmed,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget startLocation() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Start Location",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        floatingLabelStyle: const TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0), // Rounded corners
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      dropdownColor: Colors.white,
      iconEnabledColor: Colors.black,
      value: _startLocation,
      items: ['Location 1', 'Location 2', 'Location 3', 'Location 4']
          .map((String location) {
        return DropdownMenuItem<String>(
          value: location,
          child: Text(
            location,
            style: TextStyles.textFormFieldDefaultStyle_14,
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _startLocation = newValue;
        });
      },
    );
  }

  Widget destination(List<String> destinations) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "End Location",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0), // Rounded corners
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      dropdownColor: Colors.white,
      // White background for the dropdown
      iconEnabledColor: Colors.black,

      value: _endLocation,
      items: destinations.map((String location) {
        return DropdownMenuItem<String>(
          value: location,
          child: Text(
            location,
            style: TextStyles.textFormFieldDefaultStyle_14,
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _endLocation = newValue;
        });
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _timeController.text =
            _selectedTime!.format(context); // Format time to HH:mm AM/PM
      });
    }
  }
}
