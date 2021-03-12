import 'package:flutter/material.dart';
import 'package:real_estate_app/views/utilities/constants.dart';

enum UserType { Agent, User }

class RadioButton extends StatefulWidget {
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  UserType _userType = UserType.Agent;

  Expanded radioItem({String title, UserType userType}) {
    return Expanded(
      child: ListTile(
        title: Text(
          title,
          style: kWhiteTextStyle,
        ),
        leading: Radio<UserType>(
          activeColor: Colors.white,
          value: userType,
          groupValue: _userType,
          onChanged: (UserType value) {
            setState(() {
              _userType = userType;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        radioItem(title: 'Agent', userType: UserType.Agent),
        radioItem(title: 'User', userType: UserType.User),
      ],
    );
  }
}
