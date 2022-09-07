import 'dart:ffi';

class Corona {
  List<Countries> countries_stat;

  Corona.fromJson(Map<String, dynamic> newsJson)
      : countries_stat = List.from(newsJson['countries_stat'])
            .map((countries_stat) => Countries.fromJson(countries_stat))
            .toList();
}

class Countries {
  String country_name;
  String cases;
  String deaths;
  String region;
  String total_recovered;
  String new_deaths;
  String new_cases;
  String serious_critical;
  String active_cases;
  String total_cases_per_1m_population;
  String deaths_per_1m_population;
  String total_tests;
  String tests_per_1m_population;

  Countries.fromJson(Map<String, dynamic> articleJson)
      : country_name = articleJson['country_name'],
        cases = articleJson['cases'],
        deaths = articleJson['deaths'],
        region = articleJson['region'],
        total_recovered = articleJson['total_recovered'],
        new_deaths = articleJson['new_deaths'],
        new_cases = articleJson['new_cases'],
        serious_critical = articleJson['serious-critical'],
        active_cases = articleJson['active_cases'],
        total_cases_per_1m_population =
            articleJson['total_cases_per_1m_population'],
        deaths_per_1m_population = articleJson['deaths_per_1m_population'],
        total_tests = articleJson['total_tests'],
        tests_per_1m_population = articleJson['tests_per_1m_population'];
}
