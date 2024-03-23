import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SurveyForm extends StatefulWidget {
  @override
  _SurveyFormState createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  String? _selectedGender;

  TextEditingController _voterIdController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _fatherNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _gendController = TextEditingController();

  TextEditingController _dobController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _qualificationController = TextEditingController();
  TextEditingController _isLivingAloneController = TextEditingController();
  /* TextEditingController _noOfFamilyMembersController = TextEditingController();
  TextEditingController _whatsappNoController = TextEditingController();
  TextEditingController _otherMobNoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nativeAddressController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _occupationActivityController = TextEditingController();
  TextEditingController _healthSatatusController = TextEditingController();
  TextEditingController _disabilitiesController = TextEditingController();
  TextEditingController _typeOfStayController = TextEditingController();
  TextEditingController _visitToHomeController = TextEditingController();
  TextEditingController _bloodGroupController = TextEditingController();
  TextEditingController _satisFiedWithGovWorkController =
      TextEditingController();
  TextEditingController _anyIssueController = TextEditingController();
  TextEditingController _demandsForUpcommingGovController =
      TextEditingController();
  TextEditingController _partyFavorController = TextEditingController();
  TextEditingController _choiceOfPollingController = TextEditingController();
  TextEditingController _isHeKeyInfluencerController = TextEditingController();
  TextEditingController _isYourNeighborshiftedsomewhereController =
      TextEditingController();
  TextEditingController _stateNameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _latController = TextEditingController();
  TextEditingController _longController = TextEditingController();
  TextEditingController _insbyController = TextEditingController();
  TextEditingController _insdateController = TextEditingController();
  TextEditingController _modifybyController = TextEditingController();
  TextEditingController _modifydateController = TextEditingController();
  TextEditingController _maritalStatusController = TextEditingController();
  TextEditingController _voterPostController = TextEditingController();
  TextEditingController _wantKaryakartaController = TextEditingController();
  TextEditingController _casteController = TextEditingController();
  TextEditingController _subCasteController = TextEditingController();
  TextEditingController _stateIdController = TextEditingController();
  TextEditingController _cityIdController = TextEditingController();
  TextEditingController _consitituencynoController = TextEditingController();
  TextEditingController _remarkController = TextEditingController();
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Voter Information',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              _buildTextFormField(
                  'Voter_ID', TextInputType.text, _voterIdController),
              _buildTextFormField('Name', TextInputType.text, _nameController),
              _buildTextFormField(
                  'Fathers_Name', TextInputType.text, _fatherNameController),
              _buildTextFormField('Age', TextInputType.number, _ageController),
              _buildDropdownFormField('Gender',
                  ['select', 'Male', 'Female', 'Other'], _gendController),
              _buildDateFormField('Date_of_Birth', _dobController),
              _buildTextFormField(
                  'Address', TextInputType.multiline, _addressController),
              _buildDropdownFormField(
                  'Qualification',
                  [
                    'select',
                    'None',
                    '10th',
                    '12th',
                    'Graduate',
                    'PostGraduate'
                  ],
                  _qualificationController),
              _buildDropdownFormField('Is_Living_Alone',
                  ['select', 'Yes', 'No'], _isLivingAloneController),
              /* _buildTextFormField('Number_of_Family_Members',
                  TextInputType.number, _noOfFamilyMembersController),
              _buildTextFormField('WhatsApp_Number', TextInputType.phone,
                  _whatsappNoController),
              _buildTextFormField('Other_Mobile_Number', TextInputType.phone,
                  _otherMobNoController),
              _buildTextFormField(
                  'Email', TextInputType.emailAddress, _emailController),
              _buildTextFormField('Native_Address', TextInputType.multiline,
                  _nativeAddressController),
              _buildTextFormField(
                  'Category', TextInputType.text, _categoryController),
              _buildTextFormField('Occupation_Activity', TextInputType.text,
                  _occupationActivityController),
              _buildTextFormField('Health_Status', TextInputType.text,
                  _healthSatatusController),
              _buildTextFormField(
                  'Disabilities', TextInputType.text, _disabilitiesController),
              _buildTextFormField(
                  'Type_of_Stay', TextInputType.text, _typeOfStayController),
              _buildDropdownFormField('Visit_to_Home', ['Yes', 'No']),
              _buildTextFormField(
                  'Blood_Group', TextInputType.text, _bloodGroupController),
              _buildDropdownFormField(
                  'Satisfied_with_Govt_Work', ['Yes', 'No']),
              _buildDropdownFormField('Any_Issue', ['Yes', 'No']),
              _buildDropdownFormField(
                  'Demands_for_Upcoming_Govt', ['Yes', 'No']),
              _buildTextFormField(
                  'Party_Favor', TextInputType.text, _partyFavorController),
              _buildTextFormField('Choice_of_Polling', TextInputType.text,
                  _choiceOfPollingController),
              _buildDropdownFormField('Is_Key_Influencer', ['Yes', 'No']),
              _buildDropdownFormField(
                  'Neighbor_Shifted_Somewhere', ['Yes', 'No']),
              _buildTextFormField(
                  'Number', TextInputType.text, _numberController),
              _buildTextFormField(
                  'Latitude_Longitude', TextInputType.number, _latController),
              _buildDropdownFormField(
                  'Marital_Status', ['Mareied', 'Not_Mareied']),
              _buildTextFormField(
                  'Voter_Post', TextInputType.text, _voterPostController),
              _buildDropdownFormField('Want_Karyakarta', ['Yes', 'No']),
              _buildTextFormField(
                  'Caste', TextInputType.text, _casteController),
              _buildTextFormField(
                  'Sub_Caste', TextInputType.text, _subCasteController),
              _buildTextFormField('Constituency_No', TextInputType.text,
                  _consitituencynoController),
              _buildTextFormField(
                  'Remark', TextInputType.text, _remarkController), */
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    // Form is valid, submit data
                    _submitForm();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String labelText, TextInputType keyboardType,
      TextEditingController control) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        controller: control,
        keyboardType: keyboardType,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter $labelText';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdownFormField(
      String? labelText, List<String> options, TextEditingController contr) {
    _selectedGender = options.first;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
        value: _selectedGender,
        onChanged: (String? newValue) {
          setState(() {
            _selectedGender = newValue;
            contr.text = _selectedGender.toString();
            print(contr.text);
          });
        },
        validator: (value) {
          if (value == 'select') {
            return 'please select  $labelText';
          }
        },
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value.toString(),
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDateFormField(
      String labelText, TextEditingController dobController) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              labelText,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              _selectDate(context);
            },
            child: Text(
              _selectedDate != null
                  ? dobController.text =
                      '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                  : 'Select Date',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Construct the JSON payload
      var payload = {
        'voter_id': _voterIdController.text,
        'Name': _nameController.text,
        'Fathers_Name': _fatherNameController.text,
        'Age': _ageController.text,
        'gender': _gendController.text,
        'dob': _dobController.text,
        'address': _addressController.text,
        'qualification': _qualificationController.text,
        'isalone': _isLivingAloneController.text
      };

      // Convert payload to JSON format
      var jsonPayload = jsonEncode(payload);

      print(jsonPayload);
      // Send POST request
      var response = await http.post(
        Uri.parse('http://192.168.200.224/gvkprod/index.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonPayload,
      );

      // Check response status
      if (response.statusCode == 200) {
        print('Form submitted successfully');
        // Handle successful response
      } else {
        print('Failed to submit form: ${response.statusCode}');
        // Handle error response
      }
    }
  }
}
