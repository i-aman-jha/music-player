import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final String title;
  final String initialText;
  final String buttonText;
  final String hint; // content when formField is false
  final Function(String) onSubmit;
  final bool formField;

  const DialogBox({
    super.key,
    required this.title,
    this.initialText = "",
    required this.buttonText,
    required this.hint,
    required this.onSubmit,
    this.formField = true,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: initialText);
    final formKey = GlobalKey<FormState>();

    return Dialog(
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            (formField)
                ? Form(
                    key: formKey,
                    child: TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: hint,
                      ),
                      style: TextStyle(
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.black
                            : Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a playlist name';
                        }
                        return null;
                      },
                    ),
                  )
                : Text(hint, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      if (formField) {
                        if (formKey.currentState != null &&
                            formKey.currentState!.validate()) {
                          onSubmit(controller.text);
                          Navigator.pop(
                              context); // Dismiss dialog after onSubmit
                        }
                      } else {
                        //Delete
                        // Directly call onSubmit if no form field
                        onSubmit(initialText);
                        Navigator.pop(context);
                      }
                    },
                    child: Text(buttonText),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
