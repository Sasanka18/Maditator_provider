import 'package:flutter/material.dart';
import 'package:flutter_meditator/providers/filter_provider.dart';
import 'package:flutter_meditator/utils/colors.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Provider.of<FilterProvider>(context,listen:false).getData(context),
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
                            label:const Text("All"), 
                            onSelected: (value){},),
                          const SizedBox(width: 8),
                            FilterChip(
                            label:const Text("Mindfulness"), 
                            onSelected: (value){},),
                            const SizedBox(width: 8),
                            FilterChip(
                            label:const Text("Meditation"), 
                            onSelected: (value){},),
                            const SizedBox(width: 8),
                            FilterChip(
                            label:const Text("Sleep Stories"), 
                            onSelected: (value){},),
                            const SizedBox(width: 8),
                        ],),
                      )
                      )
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