#include <TM1638.h>

TM1638 module(4,3,2);

const int analogTemp = A5; // Analogic reading from the temperature sensor
const int analogLDR = A1; // Analogic reading from the LDR sensor
const int Verde1 = 9; // Digital pin of the GREEN1 LED
const int Vermelho = 10; // Digital pin of the RED LED
const int Amarelo = 11; // Digital pin of the YELLOW LED
const int Verde = 12; // Digital pin of the GREEN LED

int lux; // Variable that receives the value of luminosity measured in LUX

float tempCelsius; // Variable that receives the analogRead(analogTemp)
float voltageLDR; // Function that receives the voltage measured on the resistor in series with the LDR

unsigned long showTempCelsius;

void setup()
{
  Serial.begin(9600); // Begins serial communication
  pinMode(Vermelho, OUTPUT); // Define the RED LED mode
  pinMode(Verde, OUTPUT); // Define the GREEN LED mode
  pinMode(Amarelo, OUTPUT); // Define the YELLOW LED mode
  pinMode(Verde1, OUTPUT); // Define the GREEN1 LED mode

}

void loop() 
{  
  // Converts analogRead(analogTemp) in Celsius and prints it through serial
  analogRead(analogTemp);
  delay(10);
  tempCelsius = 500*analogRead(analogTemp)/1023;
  Serial.print(tempCelsius);
  Serial.println(" Celsius");
  tempLevel(tempCelsius);
  delay(1000);
  showTempCelsius=tempCelsius;
  module.setDisplayToDecNumber(showTempCelsius,1,false);

  // Converts analogRead(analogLDR) in Lux and prints it through serial
  voltageLDR = analogRead(analogLDR)*0.004882812;
  lux = (500*voltageLDR)/(80-16*voltageLDR);
  Serial.println(" Luminosidade = ");
  Serial.println(lux);
  lightOnLDR(Verde1);
  delay(1000); 
}

/*
 * Function that turns on a LED on the circuit
 */
void lightOn (int light) 
{
  int i;
  for (i=10;i<13;i++)
  {
    digitalWrite(i, LOW);
  }
  digitalWrite(light, HIGH);

}


/*
 * Function that defines the temperature level
 */
void tempLevel (float temp)
{
  if(temp>=28)
  {
    lightOn(Vermelho);
  } 
  else if(temp>22 && temp<28)
  {
    lightOn(Amarelo);
  }  
  else 
  {
    lightOn(Verde); 
  }

}

/*
 * Function that turns on the GREEN1 LED due to the LUX
 */
void lightOnLDR (int light1) 
{
  if(lux<100)
  {
    digitalWrite(light1, HIGH);
  } 
  else 
  {
    digitalWrite(light1, LOW);
  }

}
