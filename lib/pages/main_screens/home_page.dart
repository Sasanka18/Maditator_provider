import 'package:flutter/material.dart';
import 'package:flutter_meditator/models/meditation_exerice_model.dart';
import 'package:flutter_meditator/models/sleep_exerice_model.dart';
import 'package:flutter_meditator/pages/main_screens/mindfull_exerices_page.dart';
import 'package:flutter_meditator/providers/filter_provider.dart';
import 'package:flutter_meditator/utils/colors.dart';
import 'package:flutter_meditator/utils/text_styles.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Provider.of<FilterProvider>
          (context,listen:false).getData(context),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.hasError){
              return const Center(
                child: Text(
                  "Error loading data"
                ),
              );
            }
            return Consumer<FilterProvider>(
              builder: (context, filterData, child) {
                final completedData = filterData.filterData;
                completedData.shuffle();
               
                return   SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:10 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/meditation.png",
                      width: MediaQuery.of(context).size.width*0.09,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Meditator",
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryPurple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("Select a category to start exploring!",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primaryDarkBlue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryPurple.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Padding(
                      padding:const EdgeInsets.all(8),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          FilterChip(
                            label:const Text("All",
                            selectionColor: AppColors.primaryPurple,), 
                            onSelected: (bool value){
                              filterData.filteredData("All");
                              
                            },),
                          const SizedBox(width: 8),
                            FilterChip(
                            label: Text("Mindfulness",
                            style: TextStyle(
                              color: filterData.getSelectedCategory()== "Mindfullness" ? AppColors.primaryWhite : AppColors.primaryDarkBlue,
                            ),
                            ), 
                            onSelected: (bool value){
                              filterData.filteredData("Mindfullness");
                            },),
                            const SizedBox(width: 8),
                            FilterChip(
                            label: Text("Meditation",
                             style: TextStyle(
                              color: filterData.getSelectedCategory()== "Meditation" ? AppColors.primaryWhite : AppColors.primaryDarkBlue,
                            ),
                            ), 
                            onSelected: (bool value){
                              filterData.filteredData("Meditation");
                            },),
                            const SizedBox(width: 8),
                            FilterChip(
                            label: Text("Sleep Stories",
                             style: TextStyle(
                              color: filterData.getSelectedCategory()== "Sleep Stories" ? AppColors.primaryWhite : AppColors.primaryDarkBlue,
                            ),
                            ), 
                            onSelected: (bool value){
                              filterData.filteredData("Sleep Stories");
                            },),
                            const SizedBox(width: 8),
                        ],),
                      )
                      )
                  ),
                  const SizedBox(height: 20),
                  if (completedData.isNotEmpty)
                    StaggeredGrid.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,

                      children: completedData.map((data){
                        return GestureDetector(
                          onTap:() {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: data is MindfullExericePage
                                  ? AppColors.primaryPurple
                                  : data is SleepExerice
                                      ? AppColors.primaryDarkBlue
                                      : AppColors.primaryGreen,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                   Text(
                                    data.category,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                  "${data.duration} min",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                   Text(
                                    data.description,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    maxLines:(data.description.length/2).toInt(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    
                    ),
                ],
              ),
            ),
          );
              },
            );
          },

        )),
    );
  }
}