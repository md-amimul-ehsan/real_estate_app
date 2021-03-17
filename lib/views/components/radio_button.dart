import 'package:flutter/material.dart';
import 'package:real_estate_app/utilities/constants.dart';

class RadioButton extends StatefulWidget {

  RadioButton({Key key, this.callback,}) : super(key: key);

  Function callback;
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  UserType _userType;

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
              _userType = value;
              widget.callback(_userType);
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
