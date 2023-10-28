import 'dart:io';
void main() {

  <Map<Map<String,dynamic> listemployee={
    [
      'NAME' 'raman',
      'BATCH_No': 102,
      'EMP_NO': 1223,
      'DEPARTMENT': 'WEB_DEVEP',
      'ADDRESS': ['HOME- KOLKATA', 'WORK-BANGALORE'],
      'ATTENDENCE': {
        'DAY1': 'PRESENT',
        'DAY2': 'ABSENT',
        'DAY3': 'PRESENT',
        'DAY4': 'PRESENT',
        'DAY5': 'ABSENT',},
      'TASKDONE': {
        'DAY1': 100,
        'DAY2': 0,
        'DAY3': 200,
        'DAY4': 150,
        'DAY5': 0,
      }
    ],

  ///2ND EMPLOYEE
  {
  'NAME': 'RITIK',
  'BATCH_No': 102,
  'EMP_NO': 1224,
  'DEPARTMENT': 'APP_DEVEP',
  'ADDRESS': [HOME- MASOORI', 'WORK-BANGALORE'],
  'ATTENDENCE': {
  'DAY1': 'ABSENT',
  'DAY2': 'ABSENT',
  'DAY3': 'PRESENT',
  'DAY4': 'PRESENT',
  'DAY5': 'ABSENT',},
  'TASKDONE': {
  'DAY1': 0,
  'DAY2': 0,
  'DAY3': 200,
  'DAY4': 140,
  'DAY5': 0,
  }
  },

  ///3RD EMPLOYEE
  {
  'NAME': 'ROBI',
  'BATCH_No': 102,
  'EMP_NO': 1225,
  'DEPARTMENT': 'DESIGN_DEVEP',
  'ADDRESS': ['HOME- KHARAGPUR', 'WORK-BANGALORE'],
  'ATTENDENCE': {
  'DAY1': 'ABSENT',
  'DAY2': 'ABSENT',
  'DAY3': 'PRESENT',
  'DAY4': 'ABSENT',
  'DAY5': 'ABSENT',},
  'TASKDONE': {
  'DAY1': 0,
  'DAY2': 0,
  'DAY3': 200,
  'DAY4': 0,
  'DAY5': 0,
  }
  },

  };
  for(Map details in employee){
  print(details['NAME' ]);
  print(details['TASKDONE']['DAY3'] );
  }






}