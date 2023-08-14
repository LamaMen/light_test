import 'package:injectable/injectable.dart';
import 'package:light_test/features/home/models/event.dart';

@injectable
class EventsRepository {
  List<Event> getEvents() {
    return [
      const Event(
        title: 'Петербургский международный юридический форум 2023',
        place: 'Экспофорум',
        city: 'Санкт-Петербург, Россия',
        image: 'assets/images/saint-2.png',
        logo: 'assets/images/saint-2-logo.png',
        dates: '11–13 мая',
      ),
      const Event(
        title: 'Восточный экономический форум 2023',
        place: 'ДФУ',
        city: 'Владивосток, Россия',
        image: 'assets/images/vlad.png',
        logo: 'assets/images/vlad-logo.png',
        dates: '5–8 сентября',
      ),
      const Event(
        title: 'Санкт-Петербургский международный экономический форум 2023',
        place: 'Экспофорум',
        city: 'Санкт-Петербург, Россия',
        image: 'assets/images/saint-1.png',
        logo: 'assets/images/saint-1-logo.png',
        dates: '14–17 июня',
      ),
    ];
  }
}
