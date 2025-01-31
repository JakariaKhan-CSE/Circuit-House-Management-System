import 'package:circuit_house_management/Controller/foodController.dart';
import 'package:circuit_house_management/common/custom_button.dart';
import 'package:circuit_house_management/model/req/food_order.dart';
import 'package:circuit_house_management/view/ui/widget/drawer/sign_in_user_drawer.dart';
import 'package:circuit_house_management/view/ui/widget/textDummyStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';



class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  FoodNotifier foodNotifier = FoodNotifier();
  final _formKey = GlobalKey<FormState>();
  //  dropdown menu items
  final List<String> orderTypes = <String>['Morning', 'Lunch', 'Dinner'];
  final List<String> roomName = <String>['রজনীগন্ধা', 'সূর্যমুখী', 'কবরী',
  'কৃষ্ণচূড়া', 'হাসনাহেনা', 'মেঘদূত', 'পদ্মাবতী', 'অপরাজিতা', 'ঊর্বশী', 'শিউলী',
  'তিলোত্তমা', 'ঊর্বশী', 'দোলনচাপা', 'তিতাস', 'সুরমা', 'তিস্তা', 'কর্ণফুলী', 'রূপসা'];

  String? selectedOrderType; // Initialized as null for no default selection
  String? selectedRoomName; // Initialized as null for no default selection

  // TextEditingControllers
  final TextEditingController foodMenuController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  DateTime? selectedDate;

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    // Dispose controllers when not needed
    foodMenuController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFACD2C7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFACD2C7),
        elevation: 8,
        title: const Text('Circuit House, Jashore'),
        centerTitle: true,
      ),
      drawer: signInUserDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                const Textdummystyle(btnTxt: 'Food Order',),

                const SizedBox(height: 20),

                // room name dropdown
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          'Room Name',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(
                          ':',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          height: 40, // Increased height for better UX
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: const Text(
                                'Select Room Name',
                                style: TextStyle(color: Colors.black54),
                              ),
                              value: selectedRoomName,
                              icon: const Icon(Icons.arrow_downward),
                              isExpanded: true,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedRoomName = newValue;
                                });
                              },
                              items: roomName.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Order Type Dropdown
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          'Order Type',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(
                          ':',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          height: 40, // Increased height for better UX
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: const Text(
                                'Select Order Type',
                                style: TextStyle(color: Colors.black54),
                              ),
                              value: selectedOrderType,
                              icon: const Icon(Icons.arrow_downward),
                              isExpanded: true,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedOrderType = newValue;
                                });
                              },
                              items: orderTypes.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Food Menu Input
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          'Food Menu',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(
                          ':',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if(value!.isEmpty || value==''){
                                return "Enter Food name with quantity";
                              }
                              return null;
                            },
                            controller: foodMenuController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Food Name with Quantity',
                                hintStyle: TextStyle(
                                    fontSize: 15
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Price Input
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          'Price',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(
                          ':',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if(value!.isEmpty || value==''){
                                return "Enter Price";
                              }
                              return null;
                            },
                            controller: priceController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Price',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Date Picker
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          'Date',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(
                          ':',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedDate == null
                                      ? 'Select a Date'
                                      : DateFormat('EEEE d yyyy').format(selectedDate!),
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Icon(Icons.calendar_today, size: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Confirm Order Button
                CustomButton(
                  pressed: () {
                    // Implement order confirmation logic here
                    print('Click Confirm Order');
                    /*
                     String? selectedOrderType; // Initialized as null for no default selection
  String? selectedRoomName;
                     */
                    if(_formKey.currentState!.validate()){
                      if(selectedOrderType==null || selectedRoomName!.isEmpty || selectedDate==null)
                        {
                          Get.snackbar('Field Empty', 'Please provide all information',backgroundColor: Colors.orange);
                        }
                      else{
                        FoodReqModel model = FoodReqModel(
                          roomName: selectedRoomName,
                          orderTime: selectedOrderType,
                          foodMenu: foodMenuController.text,
                          price: priceController.text,
                          date: DateFormat('yyyy-MM-dd').format(selectedDate!), // Format date here
                        );

                        foodNotifier.foodOrder(model);

                      }
                    }
                    //
                    // FoodOrderOld foodOrder = FoodOrderOld(
                    //     selectedOrderType: selectedOrderType.toString(),
                    //     selectedRoomName: selectedRoomName.toString(),
                    //     foodMenu: foodMenuController.text,
                    //     price: double.parse(priceController.text),
                    //     selectedDate: DateTime.parse(selectedDate.toString()));
                    //
                    // final jsonString = jsonEncode(foodOrder.toJson());
                    // print('jsonString: $jsonString');


                  },
                  btnName: 'Confirm Order',
                  backgroundColor: const Color(0xFF34A864),
                  foregroundColor: const Color(0xFF000000),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
