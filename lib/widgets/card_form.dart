// Create a Form widget.
import 'package:flutter/material.dart';

class CardForm extends StatefulWidget {
  const CardForm({super.key});

  @override
  CardFormState createState() {
    return CardFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class CardFormState extends State<CardForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            border:
                Border.all(color: const Color.fromARGB(230, 230, 230, 230))),
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: 300,
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
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.work),
                          hintText: 'Enter your position',
                          labelText: 'Position',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.email),
                          hintText: 'Enter your email',
                          labelText: 'Email',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.phone_android),
                          hintText: 'Enter your phone number',
                          labelText: 'Cellphone',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.web),
                          hintText: 'Enter your website url',
                          labelText: 'Website',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.business),
                          hintText: 'Enter the name of your company',
                          labelText: 'Company',
                        ),
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
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.phone),
                          hintText: 'Enter phone number of company',
                          labelText: 'Company Phone',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
