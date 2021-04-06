/*    
 *     FIRMWARE FOR MICROCONTROLLER ESP32
 *     ESPECIFIC DEVELOPMENT BOARD NODE MCU-32S
 *     AUTHOR: SAUL LOPEZ
*/

//INCLUDED LIBRARIES

//#include <WiFi.h>
#include <WiFiClientSecure.h>
#include <PubSubClient.h>
#include <OneWire.h>
#include <DallasTemperature.h>

#include "Constantes.h"
#include "MqttFunciones.h"






void setup_wifi() {
  delay(10);
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  espClient.setInsecure();
  Serial.println("");
  Serial.print("WiFi connected, ");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

void setup() {
  

  Serial.begin(115200);
  setup_wifi();
  client.setServer(mqtt_server, mqtt_port);
  client.setCallback(callback);           //CALLBACK FUNCTION
  sensors.begin();
  Serial.print("Temperature devices: ");
  number_devices = sensors.getDeviceCount();
  Serial.println(number_devices);
  pinMode(HIGH_RELAY, OUTPUT);
  pinMode(VENT_RELAY, OUTPUT);
  pinMode(PELTIER_5V, OUTPUT);
  pinMode(PELTIER_12V, OUTPUT);
  digitalWrite(HIGH_RELAY, LOW);
  digitalWrite(VENT_RELAY, LOW);
  digitalWrite(PELTIER_5V, LOW);
  digitalWrite(PELTIER_12V, LOW);

}

void loop() {

  if (!client.loop()) {
    reconnect();
  }
  
  //SOFTWARE TIMER, 1 SECOND PERIOD
  //SEND INFORMATION TO MQTT SERVER
  long now = millis();
  if ((now - last) > 2000){
    last = now;
    if (isalive){
      send_information();
    } 
  }

  //SOFTWARE TIMER, 5 SECOND PERIOD
  //CHECK IF SERVER IS ALIVE, 
  //IF NOT CHANGE isalive VALUE, AFTER SENDING COMAND
  if (isalive){
    now = millis();
    if ((now - time_web_alive) > 5000){
      if (!alive_send){
        client.publish(TOPIC_COMMANDS_WEB, mqtt_key_web);
        alive_send = true;
        time_web_alive = millis();
      }
      else{
        general=false;
        alive_send=false;
        isalive=false;
        Serial.println("NO ACTIVE WEB CONECTION");
        Serial.println("SHUTDOWN ALL");
        digitalWrite(HIGH_RELAY, LOW);
        digitalWrite(VENT_RELAY, LOW);
        digitalWrite(PELTIER_5V, LOW);
        digitalWrite(PELTIER_12V, LOW);
      }   
    }
  }

 
}

void send_information(){
  char value[15];
  sensors.requestTemperatures();
   
  float tempC = sensors.getTempCByIndex(0);
  dtostrf(tempC,7,2,value);
  client.publish(TOPIC_VALUE1,value);

  tempC = sensors.getTempCByIndex(1);
  dtostrf(tempC,7,2,value);
  client.publish(TOPIC_VALUE2,value);
}