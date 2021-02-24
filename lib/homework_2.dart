/// Цель: научится работать с коллекциями, функциями и классами.

List<Map<String, dynamic>> data = [
  {"name": "Batman", "age": 30},
  {"name": "Spiderman", "age": 18},
  {"name": "Kung fury", "age": 23},
  {"name": "Tor", "age": 550},
  {"name": "Halk", "age": 44},
  {"name": "Iron man", "age": 35},
];

void main() {
  print(task1());

  var hero = findUserTask2(data, 'Halk2');
  print(hero);

  SuperMan superMan = SuperMan();
  superMan.say(200);
}

///Есть массив юзеров. Создайте из него новый массив так,
///чтобы имена начинались с большой буквы, а остальные символы были в нижнем регистре.
///Например, Anna, Viktor и так далее.
List task1() {
  List<String> users = ['anna', 'viKtor', 'Mike', 'aleX', 'dan'];
  List<String> usersHead = List();

  for (String user in users) {
    String word = user.substring(0, 1).toUpperCase() + user.substring(1);
    usersHead.add(word);
  }

  return usersHead;
}

///Есть массив супергероев. Напишите функцию findUser, которая принимает два параметра.
///Первый — массив с героями, второй — имя героя. Эта функция ищет по имени героя в списке
/// и возвращает нам объект с героем, например {"name": "Batman", "age": 30}.
/// Если такого имени в списке нет, функция должна вернуть {name: Anonimus, age: 0}.
Map findUserTask2(List<Map<String, dynamic>> data, String s) {
  for (Map map in data) {
    for (MapEntry result in map.entries)
      if (result.value == s)
        return map;
  }

  return {'name': 'Anonimus', 'age': 0};
}


///Код изменён так, что при создании нового объекта вы можете передать параметр со скоростью.
///При обращении к методу say() этого объекта в консоль должно выводиться
///«Я могу летать со скоростью 200 км/ч!», где значение 200 берётся из параметра при создании объекта.

abstract class Hero {
  void say(int speed);
}

mixin Fly {
  void canFly(int speed) {
    print("Я могу летать со скоростью ${speed} км/ч");
  }
}

mixin Jump {
  void canJump() {
    print("Я могу прыгать!");
  }
}

class SuperMan extends Hero with Fly, Jump{
  SuperMan();

  @override
  void say(int speed) {
    canFly(speed);
    canJump();
  }
}