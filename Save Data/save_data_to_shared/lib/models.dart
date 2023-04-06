enum Gender { FEMALE , MALE , OTHER }

enum PrograminLangue {DART , JAVA, CSHARP , CPP}

class Settings {
  final String username;
  final Gender gender;
  final Set<PrograminLangue> progrmainLanguages;
  final bool isEmployed;

  Settings({this.username, this.gender, this.progrmainLanguages, this.isEmployed});

}