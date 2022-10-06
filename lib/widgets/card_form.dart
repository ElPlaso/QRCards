// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swen325_assignment_3/widgets/button.dart';
import 'package:swen325_assignment_3/providers/cardCreator_provider.dart';

class CardForm extends StatefulWidget {
  const CardForm({super.key});

  @override
  CardFormState createState() {
    return CardFormState();
  }
}

typedef textCallback = void Function(String input);

// Create a corresponding State class. This class holds data related to the form.
class CardFormState extends State<CardForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(230, 230, 230, 230))),
      child: Form(
        key: _formKey,
        child: SizedBox(
          height: 350,
          child: Scrollbar(
            controller: controller,
            thumbVisibility: true,
            child: SingleChildScrollView(
              controller: controller,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter your name',
                        labelText: 'Name',
                      ),
                      onChanged: (value) =>
                          context.read<CardCreator>().setName(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.work),
                        hintText: 'Enter your position',
                        labelText: 'Position',
                      ),
                      onChanged: (value) =>
                          context.read<CardCreator>().setPostion(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.email),
                        hintText: 'Enter your email',
                        labelText: 'Email',
                      ),
                      onChanged: (value) =>
                          context.read<CardCreator>().setEmail(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.phone_android),
                        hintText: 'Enter your phone number',
                        labelText: 'Cellphone',
                      ),
                      onChanged: (value) =>
                          context.read<CardCreator>().setCellphone(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.web),
                        hintText: 'Enter your website url',
                        labelText: 'Website',
                      ),
                      onChanged: (value) =>
                          context.read<CardCreator>().setWebsite(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.business),
                        hintText: 'Enter the name of your company',
                        labelText: 'Company',
                      ),
                      onChanged: (value) =>
                          context.read<CardCreator>().setCompany(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.home),
                        hintText: 'Enter address of company',
                        labelText: 'Address Line 1',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.home),
                        hintText: 'Enter address of company',
                        labelText: 'Address Line 2',
                      ),
                      onChanged: (value) =>
                          context.read<CardCreator>().setCompanyAddress(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.phone),
                        hintText: 'Enter phone number of company',
                        labelText: 'Company Phone',
                      ),
                      onChanged: (value) =>
                          context.read<CardCreator>().setCompanyPhone(value),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
}
