import 'dart:math';

import 'package:flutter/material.dart';
import './transaction_form.dart';
import './transaction_list.dart';
import '../models/transation.dart';

class TransationUser extends StatefulWidget {
  const TransationUser({Key? key}) : super(key: key);

  @override
  State<TransationUser> createState() => _TransationUserState();
}

class _TransationUserState extends State<TransationUser> {
  final List<Transation> _transations = [];

  _addTransations(String title, double value, DateTime date) {
    final newTransations = Transation(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );
    setState(() {
      _transations.add(newTransations);
    });
  }

  _removeTransations(String id) {
    setState(
      () {
        _transations.removeWhere((tr) => tr.id == id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransationForm(_addTransations),
        TransationList(_transations, _removeTransations),
      ],
    );
  }
}
