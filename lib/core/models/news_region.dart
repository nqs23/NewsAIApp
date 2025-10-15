enum NewsRegion {
  world,
  ukraine;

  String toDisplayString(String languageCode) {
    switch (this) {
      case NewsRegion.world:
        return languageCode == 'ru' ? 'Мир' : 'World';
      case NewsRegion.ukraine:
        return languageCode == 'ru' ? 'Украина' : 'Ukraine';
    }
  }

  String toPromptFileName() {
    switch (this) {
      case NewsRegion.world:
        return 'news_prompt.txt';
      case NewsRegion.ukraine:
        return 'news_prompt_ukraine.txt';
    }
  }
}
