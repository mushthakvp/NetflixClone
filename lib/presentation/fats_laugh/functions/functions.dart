class Ffunction {
  Ffunction.demo();

  static Ffunction instance = Ffunction.demo();

  factory Ffunction() {
    return instance;
  }

  final image =
      'https://assets-prd.ignimgs.com/2022/05/12/stranger-things-4-poster-1652364986162.jpeg';
}
