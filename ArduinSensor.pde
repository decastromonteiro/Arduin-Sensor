int analogTemp = A5; // Analogic reading from the temperature sensor
int analogLDR = A1; // Analogic reading from the LDR sensor
int Verde1 = 9; // Digital pin of the GREEN1 LED
int Vermelho = 10; // Digital pin of the RED LED
int Amarelo = 11; // Digital pin of the YELLOW LED
int Verde = 12; // Digital pin of the GREEN LED
float tempCelsius; // Variable that receives the analogRead(analogTemp)
float voltageLDR; // Function that receives the voltage measured on the resistor in series with the LDR
int lux; // Variable that receives the value of luminosity measured in LUX
void lightOn ( int light); // Function that turns on a LED on the circuit
void tempLevel (float temp); // Function that defines the temperature level
void lightOnLDR(int light1); // Function that turns on the GREEN1 LED due to the LUX


void 

setup(){

  Serial.begin(9600); // Begins serial communication
  pinMode(Vermelho, OUTPUT); // Define the RED LED mode
  pinMode(Verde, OUTPUT); // Define the GREEN LED mode
  pinMode(Amarelo, OUTPUT); // Define the YELLOW LED mode
  pinMode(Verde1, OUTPUT); // Define the GREEN1 LED mode

  }

void loop() {
// Converts analogRead(analogTemp) in Celsius and prints it through serial
  
  analogRead(analogTemp);
  delay(10);
  tempCelsius = 500*analogRead(analogTemp)/1023;
  Serial.print(tempCelsius);
  Serial.println(" Celsius");
  tempLevel(tempCelsius);
    
  delay(1000);
  
  // Converts analogRead(analogLDR) in Lux and prints it through serial
  
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
