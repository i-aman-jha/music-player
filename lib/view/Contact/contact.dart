import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/icon_button.dart';
import '../../utils/topbar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final formKey = GlobalKey<FormState>();
  final _subjectFocusNode = FocusNode();
  final _messageFocusNode = FocusNode();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _subjectFocusNode.dispose();
    _messageFocusNode.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TopBar(
        title: Text(
          "Contact Me",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: MyIconButton(
          icon: Icons.arrow_back_ios_new,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Text(
            "Get in Touch!",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _subjectController,
                    focusNode: _subjectFocusNode,
                    decoration: const InputDecoration(
                      labelText: "Subject",
                    ),
                    style: TextStyle(
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.black
                            : Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Subject';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: TextFormField(
                      focusNode: _messageFocusNode,
                      controller: _messageController,
                      minLines: 5,
                      maxLines: 20,
                      decoration: const InputDecoration(
                        labelText: "Message",
                      ),
                      style: TextStyle(
                          color:
                              (Theme.of(context).brightness == Brightness.dark)
                                  ? Colors.black
                                  : Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Message';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        launchEmail(
                            _subjectController.text, _messageController.text);
                      }
                    },
                    child: const Text("Submit"),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(FontAwesomeIcons.linkedin),
                onPressed: () {
                  _launchurl(
                      'https://www.linkedin.com/in/aman-kumar-jha-461409286');
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.github),
                onPressed: () {
                  _launchurl('https://github.com/i-aman-jha');
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.instagram),
                onPressed: () {
                  _launchurl('https://www.instagram.com/aman_jha.a');
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.facebook),
                onPressed: () {
                  _launchurl('https://www.facebook.com/amankumar.jha.9822924');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> _launchurl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}

Future<void> launchEmail(String sub, String message) async {
  final String email = Uri.encodeComponent("amanjha.7096@gmail.com");
  final String subject = Uri.encodeComponent(sub);
  final String body = Uri.encodeComponent(message);
  final Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");

  try {
    final bool launched = await launchUrl(mail);
    if (launched) {
      // email app opened
    } else {
      // email app is not opened
      throw Exception('Could not launch email app');
    }
  } on PlatformException catch (e) {
    throw Exception('Error launching email: $e');
  }
}
