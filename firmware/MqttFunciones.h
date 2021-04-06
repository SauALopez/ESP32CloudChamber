//MQTT RECONECT METHOD TO SERVER
void reconnect()
{

    while (!client.connected())
    {
        Serial.print("Initialize MQTT connection...");
        if (client.connect("ESP32Client", mqtt_user, mqtt_pwd))
        { //CLIENT NAME FOR CONECTION
            Serial.println("All good, connected.");
            // SUBCRIBED TO FOLLOWING CHANNELS
            client.subscribe(TOPIC_COMMANDS);
        }
        else
        {
            Serial.print("failed, rc="); //FAIL WITH SOME ERROR HANDLE BY PUBSUBCLIENT
            Serial.print(client.state());
            delay(5000); //TRYING AGAIN IN 5 SECONDS
        }
    }
}

//MQTT METHOD CALLBACK MESSAGE ARRIVED
void callback(char *topic, byte *message, unsigned int length)
{

    // MESSAGE CONCATENATION
    String messageTemp;
    for (int i = 0; i < length; i++)
    {
        messageTemp += (char)message[i];
    }
    messageTemp.trim();
    Serial.println(messageTemp);
    //COMMANDS WEB CONDITIONAL
    if (String(topic) == TOPIC_COMMANDS)
    {
        if (messageTemp == mqtt_key_client)
        {
            isalive = true;
            alive_send = false;
            time_web_alive = millis();
            Serial.println("Session Alive");
        }
        if (messageTemp == syncrostatus)
        {
            if (digitalRead(PELTIER_12V))
            {
                client.publish(TOPIC_STATUS, "01");
            }
            else
            {
                client.publish(TOPIC_STATUS, "00");
            }
            if (digitalRead(PELTIER_5V))
            {
                client.publish(TOPIC_STATUS, "11");
            }
            else
            {
                client.publish(TOPIC_STATUS, "10");
            }
            if (digitalRead(VENT_RELAY))
            {
                client.publish(TOPIC_STATUS, "21");
            }
            else
            {
                client.publish(TOPIC_STATUS, "20");
            }
            if (digitalRead(HIGH_RELAY))
            {
                client.publish(TOPIC_STATUS, "31");
            }
            else
            {
                client.publish(TOPIC_STATUS, "30");
            }
        }
        if (messageTemp == "ALL")
        {
            if (general)
            {
                general = !general;
                //POWER OFF ALL THE THINGS
                digitalWrite(PELTIER_12V, LOW);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "00");

                digitalWrite(PELTIER_5V, LOW);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "10");

                digitalWrite(VENT_RELAY, LOW);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "20");

                digitalWrite(HIGH_RELAY, LOW);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "30");
            }else{
                //POWER ON ALL THE THINGS
                digitalWrite(PELTIER_12V, HIGH);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "01");

                digitalWrite(PELTIER_5V, HIGH);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "11");

                digitalWrite(VENT_RELAY, HIGH);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "21");

                digitalWrite(HIGH_RELAY, HIGH);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "31");
            }
        }
        if (messageTemp == "P12")
        {
            if (digitalRead(PELTIER_12V))
            {
                digitalWrite(PELTIER_12V, LOW);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "00");
            }
            else
            {
                digitalWrite(PELTIER_12V, HIGH);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "01");
            }
        }
        if (messageTemp == "P5")
        {
            if (digitalRead(PELTIER_5V))
            {
                digitalWrite(PELTIER_5V, LOW);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "10");
            }
            else
            {
                digitalWrite(PELTIER_5V, HIGH);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "11");
            }
        }
        if (messageTemp == "VENT")
        {
            if (digitalRead(VENT_RELAY))
            {
                digitalWrite(VENT_RELAY, LOW);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "20");
            }
            else
            {
                digitalWrite(VENT_RELAY, HIGH);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "21");
            }
        }
        if (messageTemp == "HIGH")
        {

            if (digitalRead(HIGH_RELAY))
            {
                digitalWrite(HIGH_RELAY, LOW);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "30");
            }
            else
            {
                digitalWrite(HIGH_RELAY, HIGH);
                //SEND COMAND TO WEB TO CHANGE INDICATOR
                client.publish(TOPIC_STATUS, "31");
            }
        }
    }
}
