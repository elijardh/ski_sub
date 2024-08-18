import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ski_sub/models/vehicle.dart';
import 'package:ski_sub/screens/car_booking_screen/car_booking_screen_view_model.dart';
import 'package:ski_sub/shared/shared.dart';
import 'package:ski_sub/utils/extensions.dart';

class CarBookingScreen extends StatefulWidget {
  final Vehicle vehicle;
  const CarBookingScreen({super.key, required this.vehicle});

  @override
  State<CarBookingScreen> createState() => _CarBookingScreenState();
}

class _CarBookingScreenState extends State<CarBookingScreen> {
  final TextEditingController _pickUp = TextEditingController();
  final TextEditingController _dropLocation = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  final TextEditingController _driverAge = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void dispose() {
    _pickUp.dispose();
    _dropLocation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CarBookingScreenViewModel(
        widget.vehicle,
      ),
      child: Consumer<CarBookingScreenViewModel>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              leading: const CustomBackButton(),
              leadingWidth: 70,
              title: const Text(
                'Car Rentals Booking',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SafeArea(
                minimum: const EdgeInsets.only(bottom: 40),
                child: Button(
                  buttonName: 'Book',
                  loading: value.loading,
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      if (_endDate == null ||
                          _endTime == null ||
                          _startDate == null ||
                          _startTime == null) {
                        BotToast.showText(
                            text: "Please fill all fields as required");
                        return;
                      }
                      value.bookVehicle(
                        startDate: DateFormat('yyyy-MM-dd').format(_startDate!),
                        endDate: DateFormat('yyyy-MM-dd').format(_endDate!),
                        pickUpTime: _startTime!.format(context),
                        dropOffTime: _endTime!.format(context),
                        pickupLocation: _pickUp.text,
                        dropOffLocation: _dropLocation.text,
                        age: _driverAge.text,
                        context: context,
                      );
                    }
                  },
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      40.vSpace,
                      const Text(
                        'Pick Up',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      10.vSpace,
                      InputField(
                        textEditingController: _pickUp,
                        label: 'Pick Up Location',
                        hint: 'City',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input a valid pick up location';
                          }
                          return null;
                        },
                      ),
                      20.vSpace,
                      const Text(
                        'Drop Off Location',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      10.vSpace,
                      InputField(
                        textEditingController: _dropLocation,
                        label: 'Drop Off Location',
                        hint: 'City',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input a valid drop off location';
                          }
                          return null;
                        },
                      ),
                      20.vSpace,
                      const Text(
                        'Date',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      10.vSpace,
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(3000));
                                if (pickedDate != null) {
                                  setState(() {
                                    pickedDate = pickedDate;
                                    _startDate = pickedDate;
                                  });
                                }
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromRGBO(249, 250, 251, 1),
                                ),
                                child: Center(
                                    child: Text(
                                  _startDate == null
                                      ? 'Pick Up Date'
                                      : DateFormat.MEd().format(_startDate!),
                                )),
                              ),
                            ),
                          ),
                          10.hSpace,
                          const Text('-'),
                          10.hSpace,
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(3000));
                                if (pickedDate != null) {
                                  setState(() {
                                    pickedDate = pickedDate;
                                    _endDate = pickedDate;
                                  });
                                }
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromRGBO(249, 250, 251, 1),
                                ),
                                child: Center(
                                    child: Text(
                                  _endDate == null
                                      ? 'Drop Off Date'
                                      : DateFormat.MEd().format(_endDate!),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      20.vSpace,
                      Row(
                        children: [
                          const Text(
                            'Pick Up Time',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          100.hSpace,
                          const Text(
                            'Drop Off Time',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      10.vSpace,
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    pickedTime = pickedTime;
                                    _startTime = pickedTime!;
                                  });
                                }
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromRGBO(249, 250, 251, 1),
                                ),
                                child: Center(
                                    child: Text(
                                  _startTime == null
                                      ? '10:10'
                                      : _startTime!.format(context),
                                )),
                              ),
                            ),
                          ),
                          20.hSpace,
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    pickedTime = pickedTime;
                                    _endTime = pickedTime!;
                                  });
                                }
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromRGBO(249, 250, 251, 1),
                                ),
                                child: Center(
                                    child: Text(
                                  _endTime == null
                                      ? '10:10'
                                      : _endTime!.format(context),
                                )),
                              ),
                            ),
                            // child: TextFormField(
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return 'Input a valid drop off time';
                            //     }
                            //     return null;
                            //   },
                            //   controller: _endTime,
                            //   decoration: const InputDecoration(
                            //       border: OutlineInputBorder(
                            //           borderSide: BorderSide(),
                            //           borderRadius: BorderRadius.all(
                            //               Radius.circular(20))),
                            //       // icon: Icon(Icons.calendar_today),
                            //       labelText: '10:10'),
                            //   readOnly: true,
                            //   onTap: () async {
                            //     TimeOfDay? pickedTime = await showTimePicker(
                            //       context: context,
                            //       initialTime: TimeOfDay.now(),
                            //     );
                            //     if (pickedTime != null) {
                            //       setState(() {
                            //         pickedTime = pickedTime;
                            //         _endTime.text = pickedTime!.format(context);
                            //         pickedTime.toString();
                            //       });
                            //     }
                            //   },
                            // ),
                          ),
                        ],
                      ),
                      20.vSpace,
                      const Text(
                        'Driver Age',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      10.vSpace,
                      InputField(
                        textEditingController: _driverAge,
                        label: 'Enter Age',
                        hint: '18',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Input a driver's age";
                          }
                          return null;
                        },
                      ),
                      60.vSpace,
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
