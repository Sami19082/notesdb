import 'package:flutter/material.dart';

class info extends StatelessWidget {
  List<Map<String, dynamic>> datalist=[
    {'title': 'Remember that spot reduction (losing fat from a specific area) is a common misconception. While ab workouts strengthen and tone your core muscles, reducing overall body fat is necessary for achieving visible, well-defined abs. A combination of cardiovascular exercise, a healthy diet, and targeted ab workouts can help you achieve your fitness goals.'},
    {'title': "When designing your chest workout, it's important to maintain good form to prevent injuries and to gradually increase the weight or resistance over time to promote muscle growth and strength. Additionally, a balanced workout routine should target other muscle groups as well, such as back, shoulders, and legs, to ensure overall body strength and symmetry. Always consult a fitness professional or trainer if you're new to weightlifting or have any specific fitness goals or limitations."},
    {'title': "Remember that a well-rounded workout routine should include exercises for all muscle groups, not just the arms. Also, consult a fitness professional or a personal trainer to tailor a workout plan to your specific fitness goals and abilities."},
    {'title': "Remember to warm up before your leg workout to prevent injury and cool down afterward to promote recovery. It's also important to use proper form and start with a weight or resistance level that's appropriate for your fitness level. Gradually increase the intensity and challenge as you become more experienced."},
    {'title': "Remember that a balanced workout routine should target all major muscle groups, not just the back. A well-rounded fitness program should include exercises for the chest, legs, shoulders, and core in addition to back workouts."},
  ];

  int index;
info({required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xfDEEADCFF)
            ),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                                child: Center(child: Text(datalist[index]['title'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.pink.shade200),)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
