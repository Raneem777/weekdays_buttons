import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewModel/view_model.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DayViewModel>(context);
    final days = viewModel.days;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Week Days",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemCount: viewModel.days.length,
          itemBuilder: (context,index) {
            final day = days[index];
        return Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            height: 70,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(

                backgroundColor: day.isSelected ? Colors.green : Colors.red,
              ),
              onPressed: () => viewModel.toggleDay(index),
              child: Text(day.name,style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
        );
          }),
    );

  }
}
