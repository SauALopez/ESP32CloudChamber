/**************
DEFINICIONES DE LOS PINES UTILIZADOS EN EL NODE MCU-32S
****************/

#define HIGH_RELAY 18
#define VENT_RELAY 5
#define PELTIER_5V 21
#define PELTIER_12V 19
#define BUS_ONE_WIRE 17



/**************
CONSTANTES DE LA CONFIGURACION DEL WIFI - EL SERVIDOR MQTT
****************/

const char* ssid = "SSID_NAME";
const char* password = "SSID_PWD";

//const char* mqtt_server = "test.mosquitto.org";
const char* mqtt_server = "SERVER_NAME_OR_IP";   //MQTT DEVELOPMENT IP
const int mqtt_port = 8883;
const char* mqtt_user = "USERNAME";
const char* mqtt_pwd = "PASSWORD";
const char* mqtt_key_client = "EcFmUsAcCL"; //MQTT ALIVE-CLIENT KEY VERIFICATION
const char* mqtt_key_web = "EcFmUsAcW";    //MQTT ALIVE-WEB KEY VERIFICATION
const char* syncrostatus = "sync";



//TOPICS TO PUBLISH
#define TOPIC_COMMANDS_WEB "commandsweb"
#define TOPIC_VALUE1 "value1"
#define TOPIC_VALUE2 "value2" 
#define TOPIC_STATUS "status"
//TOPIC TO SUBSCRIBE
#define TOPIC_COMMANDS "commands"


//GLOBAL OBJECTS
WiFiClientSecure espClient;
PubSubClient client(espClient);
OneWire oneWire(BUS_ONE_WIRE);
DallasTemperature sensors(&oneWire);
// GLOBAL VARIABLES
bool general = false;
bool alive_send = false;
bool isalive = false;
long time_web_alive = 0;
long last = 0;
int number_devices =0;


