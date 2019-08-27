import 'package:flutter/material.dart';

import 'package:flutter_app/widgets/list/mock_data_01.dart';
import 'package:flutter_app/widgets/list/pet_card.dart';
import 'package:flutter_app/widgets/list/credit_card.dart';
import 'package:flutter_app/widgets/list/friend_circle.dart';

class NormalList extends StatelessWidget {

  const NormalList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CreditCard(data: creditCardData),
        PetCard(data: petCardData),
        FriendCircle(data: friendCircleData),
      ],
    );
  }
}