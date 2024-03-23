List<String> banks = [
  "Sindh Bank",
  "HBL",
  "Habib",
  "Cash Flow",
];

List<String> _electricityCompanies = [
  'FESCO',
  'K-Electric New Connection',
  'HESCO',
  'SEPCO'
];


List<String> _gasCompanies = [
  "SSGC",
  "SNGPL"
];

List<String> _waterCompanies=[
  "WASA",
  "KWSB",
  "LAWASA",
];

List<String> companyNames(String type){
  if(type=="water"){
    return _waterCompanies;
  }
  else if(type=="electricity"){
    return _electricityCompanies;
  }
  else {
    return _gasCompanies;
  }

}