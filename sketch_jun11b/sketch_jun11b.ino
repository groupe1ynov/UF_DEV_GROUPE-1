#include <ESP8266WiFi.h>  
#include "DHT.h"
#define DHTPIN 5
#define DHTTYPE DHT22
DHT dht(DHTPIN, DHTTYPE);
int TUtil = 20;
int diff;


struct cmds {
  int ADD_TEMPERATURE;
  int REMOVE_TEMPERATURE;
};

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  dht.begin();
  Serial.print("Setting soft-AP ... ");
  boolean result = WiFi.softAP("Samy", "bonjour23");
  if(result == true)
  {
    Serial.println("Ready");
  }
  else
  {
    Serial.println("Failed!");
  }
}

void loop() {
  // put your main code here, to run repeatedly:
  float t = dht.readTemperature();

  if (isnan(t)){
      Serial.println(F("Failed to read from DHT sensor!"));
      delay(1000);
      return;
  }
  float hic = dht.computeHeatIndex(t, false);
  Serial.print(F("Temperature ambiante: "));
  Serial.print(t);
  Serial.println(F("°C "));
  delay(1000);

  
}
