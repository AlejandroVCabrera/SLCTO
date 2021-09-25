import java.util.Date;

void setup() {  
  size(528, 713);  
  PImage recuerdo;
  int z = 0;
  PFont f;

  f = createFont("times.ttf",18);
  textFont(f);

  recuerdo = loadImage("recuerdo/recuerdo_"+ (z) + ".jpg");

  for (int i = 0; i < 400000; i++) {
    float x = (random(width));
    float y = random(height);
    color c = recuerdo.get(int(x), int(y));
    
    float b = map(brightness(c),0,255,0,255);
    
    noStroke();
   
   if ((b < 190) && (b > 130)) {
      fill((c) + color(3,1,2));
   }
    else
    fill((c) + color(0,0,1));    
    rectMode(CENTER);
    rect(x + random(-3,3), y + random(-1,1), 3, 4);
  }

  String path = sketchPath("/memorias");
  String[] filenames = listFileNames(path);
  println("Lista de archivos: ");
  printArray(filenames);  
  println("\nNumero de archivos: ");
  println(filenames.length);
  
  save("recuerdo/recuerdo_" + z + ".jpg");
  save("memorias/memoria_" + filenames.length + ".jpg");
  
  String memoria = "Recuerdo número " + (filenames.length);
  fill(0);
  text(memoria,350,693);

  noLoop();
}

void draw() {}

String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    return null;
  }
}
