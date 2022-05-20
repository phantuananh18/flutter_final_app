import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_final_app/model/cinema.model.dart';
import 'package:flutter_final_app/model/argument.dart';
import 'package:flutter_final_app/screens/home.dart';
import 'package:flutter_final_app/screens/list.cinema.dart';
import 'package:flutter_final_app/utils.dart';
import 'package:http/http.dart' as http;

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late Cinema cinema;
  late String formName = 'ADD NEW CINEMA';
  late Argument args = Argument();
  final formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _status = TextEditingController(text: 'Open');
  final TextEditingController _establishYear = TextEditingController();

  setValueField(String value, TextEditingController controller) {
    controller.value = TextEditingValue(
        text: value,
        selection:
            TextSelection.fromPosition(TextPosition(offset: value.length)));
  }

  initValue(Cinema cinema) {
    setValueField(cinema.name, _name);
    setValueField(cinema.phone, _phone);
    setValueField(cinema.email, _email);
    setValueField(cinema.address, _address);
    setValueField(cinema.status, _status);
    setValueField(cinema.description, _description);
    setValueField(cinema.establishYear, _establishYear);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      args = ModalRoute.of(context)?.settings.arguments as Argument;
      if (args.isUpdate) {
        cinema = args.cinema!;
        initValue(cinema);
        if (cinema.status != 'Open' && cinema.status == 'Close') {
          _status.text = 'Close';
        }
        formName = 'UPDATE CINEMA #${cinema.id}';
      }
      setState(() {});
    });
  }

  submit() {
    if (formKey.currentState!.validate()) {
      args.isUpdate ? update() : add();
    }
  }

  Future<void> add() async {
    var res = await http.get(Uri.parse(
        'http://api.phanmemquocbao.com/api/Doituong/InsertObjects?p0=${_name.text}&id=1&p1=${_phone.text}&p2=${_description.text}&p3=${_status.text}&p4=${_address.text}&p5=${_email.text}&p6=${_establishYear.text}&tokenin=lethibaotran'));
    if (res.statusCode == 200) {
      CustomDialog.makeDialog(
          context: context,
          title: 'SUCCESS',
          content: 'Add new cinema successful!',
          actions: [
            TextButton(
                onPressed: () =>
                    Navigator.of(context).popAndPushNamed('$ListAllScreen'),
                child: const Text('OK'))
          ]);
    } else {
      CustomDialog.makeDialog(
          context: context,
          title: 'ERROR',
          content: 'Can not add new cinema!',
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'))
          ]);
    }
  }

  Future<void> update() async {
    var res = await http.get(Uri.parse(
        'http://api.phanmemquocbao.com/api/Doituong/updateObjects?id=${cinema.id}&p0=${_name.text}&p1=${_phone.text}&p2=${_description.text}&p3=${_status.text}&p4=${_address.text}&p5=${_email.text}&p6=${_establishYear.text}&tokenup=lethibaotran'));
    if (res.statusCode == 200) {
      CustomDialog.makeDialog(
          context: context,
          title: 'SUCCESS',
          content: 'Update the cinema successful!',
          actions: [
            TextButton(
                onPressed: () =>
                    Navigator.of(context).popAndPushNamed('$ListAllScreen'),
                child: const Text('OK'))
          ]);
    } else {
      CustomDialog.makeDialog(
          context: context,
          title: 'Error',
          content: 'Can not update!',
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'))
          ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          formName,
          style: const TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
        backgroundColor: kLightColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
              onPressed: submit,
              icon: const Icon(
                Icons.done_all,
                color: kWhiteColor,
              ))
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    customInputField(
                      label: 'Name of cinema',
                      hint: 'Name of cinema',
                      controller: _name,
                      validator: (value) =>
                          (value!.isEmpty || value.length > 100)
                              ? 'Please enter valid name'
                              : null,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Status',
                          style: PrimaryFont.regular(16),
                        ),
                        Expanded(
                          flex: 1,
                          child: ListTile(
                            title: const Text('Open'),
                            leading: Radio(
                              groupValue: _status.text,
                              value: 'Open',
                              onChanged: (value) {
                                setState(() {
                                  _status.text = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ListTile(
                            title: const Text('Close'),
                            leading: Radio(
                              groupValue: _status.text,
                              value: 'Close',
                              onChanged: (value) {
                                setState(() {
                                  _status.text = value.toString();
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customInputField(
                      label: 'Description',
                      hint: 'Description',
                      controller: _description,
                      validator: (value) =>
                          (value!.isEmpty || value.length > 3000)
                              ? 'Please enter valid name'
                              : null,
                    ),
                    const SizedBox(height: 10),
                    customInputField(
                        label: 'Phone',
                        hint: 'Enter phone number',
                        controller: _phone,
                        validator: (value) {
                          RegExp regex =
                              RegExp(r'(84|0[3|5|7|8|9])+([0-9]{8})\b');
                          if (!regex.hasMatch(value.toString())) {
                            return "Please enter valid phone number";
                          } else {
                            return null;
                          }
                        },
                        type: TextInputType.number),
                    const SizedBox(height: 10),
                    customInputField(
                        label: 'Mail',
                        hint: 'Enter cinema email',
                        controller: _email,
                        validator: (value) {
                          if (!EmailValidator.validate(value.toString()) ||
                              value!.length > 100) {
                            return "Please enter valid mail";
                          } else {
                            return null;
                          }
                        },
                        type: TextInputType.emailAddress),
                    const SizedBox(height: 10),
                    customInputField(
                        label: 'Established year of cinema',
                        hint: 'Enter year',
                        controller: _establishYear,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter valid year";
                          } else if (value.length < 1 ||
                              value.length > 4 ||
                              value.length < 2 ||
                              value.length < 4) {
                            return "Please enter 4 digits";
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(height: 10),
                    customInputField(
                      label: 'Address',
                      hint: 'Address of cinema',
                      controller: _address,
                      validator: (value) =>
                          (value!.isEmpty || value.length > 100)
                              ? 'Please enter valid address'
                              : null,
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom)),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField customInputField(
          {required String label,
          required String hint,
          FormFieldValidator<String>? validator,
          TextEditingController? controller,
          String? initValue,
          TextInputType? type,
          Function()? onTap,
          bool enable = true}) =>
      TextFormField(
        controller: controller,
        initialValue: initValue,
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: const OutlineInputBorder()),
        keyboardType: type,
        validator: validator,
        onTap: onTap,
        readOnly: !enable,
      );
}
