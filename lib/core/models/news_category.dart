enum NewsCategory {
  all,
  sports,
  politics,
  finance,
  science;

  String toDisplayString(String languageCode) {
    if (languageCode == 'ru') {
      switch (this) {
        case NewsCategory.all:
          return 'Все';
        case NewsCategory.sports:
          return 'Спорт';
        case NewsCategory.politics:
          return 'Политика';
        case NewsCategory.finance:
          return 'Финансы';
        case NewsCategory.science:
          return 'Наука';
      }
    } else {
      switch (this) {
        case NewsCategory.all:
          return 'All';
        case NewsCategory.sports:
          return 'Sports';
        case NewsCategory.politics:
          return 'Politics';
        case NewsCategory.finance:
          return 'Finance';
        case NewsCategory.science:
          return 'Science';
      }
    }
  }

  String toPromptString(String languageCode) {
    if (languageCode == 'ru') {
      switch (this) {
        case NewsCategory.all:
          return 'всех категорий';
        case NewsCategory.sports:
          return 'спорте';
        case NewsCategory.politics:
          return 'политике';
        case NewsCategory.finance:
          return 'финансах и экономике';
        case NewsCategory.science:
          return 'науке и технологиях';
      }
    } else {
      switch (this) {
        case NewsCategory.all:
          return 'all categories';
        case NewsCategory.sports:
          return 'sports';
        case NewsCategory.politics:
          return 'politics';
        case NewsCategory.finance:
          return 'finance and economy';
        case NewsCategory.science:
          return 'science and technology';
      }
    }
  }
}
