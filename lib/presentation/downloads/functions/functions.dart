class Dfunction {
  Dfunction.demo();

  static Dfunction instance = Dfunction.demo();

  factory Dfunction() {
    return instance;
  }

  final images = [
    'https://m.media-amazon.com/images/M/MV5BYjJhYmM3MWQtMWM3NC00MWQyLTliZWItNDI3NGYwZTU0MDAyXkEyXkFqcGdeQXVyMjkxNzQ1NDI@._V1_.jpg',
    'https://assets-prd.ignimgs.com/2022/05/12/stranger-things-4-poster-1652364986162.jpeg',
    'https://i0.wp.com/bloody-disgusting.com/wp-content/uploads/2022/06/NPE_Char1Sht_Steven_1080x1920pxH_RGB_3.jpg'
  ];
}
