import 'package:flutter/material.dart';
import 'package:flutter_meditator/models/meditation_exerice_model.dart';
import 'package:flutter_meditator/models/mindfull_exerice_model.dart';
import 'package:flutter_meditator/models/sleep_exerice_model.dart';
import 'package:flutter_meditator/providers/meditation_provider.dart';
import 'package:flutter_meditator/providers/mindfull_exercise_provider.dart';
import 'package:flutter_meditator/providers/sleep_exerise_provider.dart';
import 'package:provider/provider.dart';

class FilterProvider extends ChangeNotifier{
  List<dynamic> _allData=[];
  List<dynamic> _filteredData=[];

  //get all the data from other providers
  Future<void> getData(BuildContext context) async{
    //Ensures this runs after build
    await Future.delayed(Duration.zero);

  //mindfull exercises
  final List<MindfullnessExerice> mindfullExercises =
      Provider.of<MindfullExerciseProvider>(context, listen: false)
          .mindfullExercise;

  //Meditation exercises
  final List<MeditationExercise> meditationExercises =
      Provider.of<MeditationProvider>(context, listen: false)
          .meditationExercises;

  //sleep exercises
  final List<SleepExerice> sleepExercises =
      Provider.of<SleepExeriseProvider>(context, listen: false)
          .sleepExercise;

  _allData=[
    ...mindfullExercises,
    ...meditationExercises,
    ...sleepExercises,
  ];
  _filteredData=List.from(_allData);
  notifyListeners();

  }
  //getter
  List<dynamic>get filterData => _filteredData;
}