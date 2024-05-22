//tp 2 comisión 1//
//Elías Esquibel //

PImage img1, img2, img3, fondo;
int tiempoTransicion1 = 5000;
int tiempoTransicion2 = 10000; 
int tiempoActual; 

String texto1 = "El profesor enseña el hechizo"; 
String texto2 = "Hermione se prepara para lanzar el hechizo";
String texto3 = "La pluma comienza a flotar en el aire";
int textSizeFinal = 30;
int tiempoAnimacion = 2000; 
int tiempoInicioAnimacion;

boolean inicio = false; //boton//

void setup() {
  size(640, 480); 
  img1 = loadImage("imagen1.png"); 
  img2 = loadImage("imagen2.png"); 
  img3 = loadImage("imagen3.png"); 
  fondo = loadImage("fondo.jpg");
}

void draw() {
  if (!inicio) {
    image(fondo, 0, 0, width, height);

    // boton //
    fill(0, 0, 0, 50); 
    noStroke();
    rectMode(CENTER);
    rect(width / 2 + 5, height / 2 + 5, 200, 100, 20);

    // boton de inicio //
    fill(0, 0, 255); 
    noStroke();
    rect(width / 2, height / 2, 200, 100, 20);


    fill(255);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Iniciar", width / 2, height / 2); // 
  } else {
    background(255);
    tiempoActual = millis();

    if (tiempoActual < tiempoTransicion1) {
 
      image(img1, 0, 0, width, height);
 
      float tiempoTranscurrido = tiempoActual - tiempoInicioAnimacion;
      int numLetras = int(map(tiempoTranscurrido, 0, tiempoAnimacion, 0, texto1.length()));
      numLetras = constrain(numLetras, 0, texto1.length());

      // mostrar texto
      textAlign(CENTER, CENTER);
      textSize(textSizeFinal);
      fill(#E8D500); // Color rojo
      text(texto1.substring(0, numLetras), width / 2, height - 30); 
    } else if (tiempoActual < tiempoTransicion2) {

      image(img2, 0, 0, width, height);

 
      float tiempoTranscurrido = tiempoActual - tiempoTransicion1;
      float fraccionTiempo = constrain(tiempoTranscurrido / (float)tiempoAnimacion, 0, 1);
      int alpha = int(map(fraccionTiempo, 0, 1, 0, 255));

      // centra el texto //
      textAlign(CENTER, CENTER);
      textSize(textSizeFinal);
      fill(#E8D500, alpha);
      text(texto2, width / 2, height - 30);
    } else {

      image(img3, 0, 0, width, height);

      // calcula cuanto dura poner el texto para saltar a la siguiente imagen //
      float tiempoTranscurrido = tiempoActual - tiempoTransicion2;
      int numLetras = int(map(tiempoTranscurrido, 0, tiempoAnimacion, 0, texto3.length()));
      numLetras = constrain(numLetras, 0, texto3.length());

      // muestra el texto letra por letra //
      textAlign(CENTER, CENTER);
      textSize(textSizeFinal);
      fill(#E8D500); 
      text(texto3.substring(0, numLetras), width / 2, height - 30);
    }
  }
}

void mousePressed() {

  if (!inicio && mouseX > width / 2 - 100 && mouseX < width / 2 + 100 && mouseY > height / 2 - 50 && mouseY < height / 2 + 50) {
    inicio = true;
    tiempoInicioAnimacion = millis(); 
  }
}
