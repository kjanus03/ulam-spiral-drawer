boolean isPrime(int n){
  if (n<2){
    return false;
  }
  for (int i = 2; i<=Math.sqrt(n); i++){
    if (n % i == 0){
      return false;
    }
  }
  return true;
}

void setup() 
{
  size(800, 800);
  frameRate(30);
  background(60);
  textSize(28); 
}

int i = 1;
int stepSize = 13;
int stepCount = 1;
int stepMax = 2;
int direction = 0;
int x = 400, y = 400;
int px = x, py = y;
int counter = 0;
float max = (width * height) / (stepSize * stepSize) + 60*stepSize;

void draw(){
  line(px, py, x, y);
  stroke(200);
  if (isPrime(i)){
    ellipse(x, y, 8, 8);
  }
  i += 1;
  px = x;
  py = y;
  switch (direction) {
    case 0:
      x += stepSize;
      break;
    case 1:
      y -= stepSize;
      break;
    case 2:
      x -= stepSize;
      break;
    case 3:
      y += stepSize;
      break;
  }
  stepCount += 1;
  if (stepCount >= stepMax){
    counter += 1;
    direction += 1;
    direction %= 4;
    stepCount = 1;
    if (counter % 2 == 0){
    stepMax += 1;
    }
  }
  if (stepCount == max){
    noLoop();
  }
}
