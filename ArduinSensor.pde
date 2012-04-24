int analogTemp = A5; // Leitura Analogica do sensor de Temperatura
float tempCelsius; // Variavel que recebe o valor do analogRead(analogTemp)
int Vermelho = 10; // Pino digital do LED Vermelho
int Verde = 12; // Pino digital do LED Verde
int Amarelo = 11; // Pino digital do LED Amarelo
void lightOn ( int light); // Funçao que liga um LED do circuito
void tempLevel (float temp); // Funçao que define o grau de temperatura medida
int analogLDR = A1; // Leitura Analogica do sensor LDR
int Verde1 = 9; // Pino digital do LED Verde1
int lux; // Variavel que recebe o valor da luminosidade medida em lux
void lightOnLDR(int light1); // Funçao que liga o LED conforme luminosidade medida
float voltageLDR; // Funçao que recebe o valor da tensao medida no resistor em serie com o LDR
void 

setup(){

  Serial.begin(9600); // Começa a comunicaçao serial
  pinMode(Vermelho, OUTPUT); // Define o modo do LED Vermelho
  pinMode(Verde, OUTPUT); // Define o modo do LED Verde
  pinMode(Amarelo, OUTPUT); // Define o modo do LED Amarelo
  pinMode(Verde1, OUTPUT); // Define o modo do LED Verde1

  }

void loop() {

  analogRead(analogTemp);
  delay(10);
  tempCelsius = 500*analogRead(analogTemp)/1023;
  Serial.print(tempCelsius);
  Serial.println(" Celsius");
  tempLevel(tempCelsius);
    
  delay(1000);
  
  voltageLDR = analogRead(analogLDR)*0.004882812;
  lux = (500*voltageLDR)/(80-16*voltageLDR);
  Serial.println(" Luminosidade = ");
  Serial.println(lux);
  lightOnLDR(Verde1);
  
  delay(1000);


}

void

lightOn ( int light) {
 
   int i;
  for (i=10;i<13;i++) {
   digitalWrite(i, LOW);
}
digitalWrite(light, HIGH);

}

void

tempLevel ( float temp) {
 
  if(temp>=28){
    lightOn(Vermelho);
  } else if(temp>22 && temp<28){
    lightOn(Amarelo);
  }  else {
    lightOn(Verde); 
  }
  
}
  
void

lightOnLDR ( int light1) {
 
  
    if(lux<100){
       digitalWrite(light1, HIGH);
      
    } else {
       digitalWrite(light1, LOW);
      
    }
} 
  
  


