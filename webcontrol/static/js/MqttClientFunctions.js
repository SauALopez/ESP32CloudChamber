
const MQTT_SERVER = {
    NAME: 'SERVER_NAME',
    PORT: 8883,
    USER: "USERNAME",
    PWD: "PASSWORD"

};
const TOPICS = {
    COMMANDS: "commands",
    COMMANDSWEB: "commadsweb",
    VALUE1: "value1",
    VALUE2: "value2",
    STATUS: "status"
};
const COMMANDS = {
    ALIVE_WEB: "EcFmUsAcW",
    ALIVE_ESP: "EcFmUsAcCL",
    SYNC: "sync",
    GENERAL: 'ALL',
    P12: 'P12',
    P5: 'P5',
    FAN: 'VENT',
    HIGH: 'HIGH'
};


// Create a client instance
client = new Paho.MQTT.Client(MQTT_SERVER.NAME, MQTT_SERVER.PORT, '/ws', 'clientId');
// set callback handlers
client.onConnectionLost = onConnectionLost;
client.onMessageArrived = onMessageArrived;

var controlstatus = [0, 0, 0, 0];
firstvalue1 = true;
firstvalue2 = true;
// connect the client
client.connect({
    onSuccess: onConnect,
    userName: MQTT_SERVER.USER,
    password: MQTT_SERVER.PWD
});


// called when the client connects
function onConnect() {
    client.subscribe(TOPICS.COMMANDSWEB);
    client.subscribe("value1");
    client.subscribe("value2");
    client.subscribe("status");
    //ALIVE COMAND- WITH KEY
    message = new Paho.MQTT.Message(COMMANDS.ALIVE_ESP);
    message.destinationName = TOPICS.COMMANDS;
    client.send(message);
    //SYNC COMAND
    message = new Paho.MQTT.Message("sync");
    message.destinationName = TOPICS.COMMANDS;
    client.send(message);

}

// called when the client loses its connection
function onConnectionLost(responseObject) {
    if (responseObject.errorCode !== 0) {
        console.log("onConnectionLost:" + responseObject.errorMessage);
    }
}
// called when a message arrives
function onMessageArrived(message) {
    //ALIVE RECEIVED
    if (message.destinationName == TOPICS.COMMANDSWEB) {
        if (message.payloadString == COMMANDS.ALIVE_WEB) {
            message = new Paho.MQTT.Message(COMMANDS.ALIVE_ESP);
            message.destinationName = TOPICS.COMMANDS;
            client.send(message);
        }

    }
    //CSS STATUS INDICATOR UPDATE
    if (message.destinationName == TOPICS.STATUS) {
        if (message.payloadString[0] == "0") {
            if (message.payloadString[1] == "0") {
                controlstatus[0] = 0;
                $("#Peltier12").removeClass("on");
                $("#Peltier12").addClass("off");
            } else {
                controlstatus[0] = 1;
                $("#Peltier12").removeClass("off");
                $("#Peltier12").addClass("on");
            }
        }
        if (message.payloadString[0] == "1") {
            if (message.payloadString[1] == "0") {
                controlstatus[1] = 0;
                $("#Peltier5").removeClass("on");
                $("#Peltier5").addClass("off");
            } else {
                controlstatus[1] = 1;
                $("#Peltier5").removeClass("off");
                $("#Peltier5").addClass("on");
            }
        }
        if (message.payloadString[0] == "2") {
            if (message.payloadString[1] == "0") {
                controlstatus[2] = 0;
                $("#Ventiladores").removeClass("on");
                $("#Ventiladores").addClass("off");
            } else {
                controlstatus[2] = 1;
                $("#Ventiladores").removeClass("off");
                $("#Ventiladores").addClass("on");
            }
        }
        if (message.payloadString[0] == "3") {
            if (message.payloadString[1] == "0") {
                controlstatus[3] = 0;
                $("#AltoV").removeClass("on");
                $("#AltoV").addClass("off");
            } else {
                controlstatus[3] = 1;
                $("#AltoV").removeClass("off");
                $("#AltoV").addClass("on");
            }
        }
        var on = 0;
        controlstatus.forEach(function (status) {
            on += status;
        });
        if (on == 4) {
            $("#ControlGeneral").removeClass("off");
            $("#ControlGeneral").addClass("on");
        } else {
            $("#ControlGeneral").removeClass("on");
            $("#ControlGeneral").addClass("off");
        }
    }
    //UPDATE FIRST CHART
    if (message.destinationName == TOPICS.VALUE1) {
        if (firstvalue1) {
            inicio1 = Date.now() / 1000;
            firstvalue1 = false;
            document.getElementById("tv1").innerText = message.payloadString;
            DashBoardUpdate(value1_chart.config.data, message.payloadString, 0);
            value1_chart.update();

        }
        else {
            document.getElementById("tv1").innerText = message.payloadString;
            timestamp = Math.round(Date.now() / 1000 - inicio1);
            DashBoardUpdate(value1_chart.config.data, message.payloadString, timestamp);
            value1_chart.update();
        }
    }
    //UPDATE SECOND CHART
    if (message.destinationName == TOPICS.VALUE2) {
        if (firstvalue2) {
            inicio2 = Date.now() / 1000;
            firstvalue2 = false;
            document.getElementById("tv2").innerText = message.payloadString;
            DashBoardUpdate(value2_chart.config.data, message.payloadString, 0);
            value2_chart.update();
        }
        else {
            document.getElementById("tv2").innerText = message.payloadString;
            timestamp = Math.round(Date.now() / 1000 - inicio2);
            DashBoardUpdate(value2_chart.config.data, message.payloadString, timestamp);
            value2_chart.update();
        }
    }
}


$("#General").on('click', function (event) {
    message = new Paho.MQTT.Message(COMMANDS.GENERAL);
    message.destinationName = TOPICS.COMMANDS;
    client.send(message);
});
$("#12V").on('click', function (event) {
    message = new Paho.MQTT.Message(COMMANDS.P12);
    message.destinationName = TOPICS.COMMANDS;
    client.send(message);
});
$("#5V").on('click', function (event) {
    message = new Paho.MQTT.Message(COMMANDS.P5);
    message.destinationName = TOPICS.COMMANDS;
    client.send(message);
});
$("#Fan").on('click', function (event) {
    message = new Paho.MQTT.Message(COMMANDS.FAN);
    message.destinationName = TOPICS.COMMANDS;
    client.send(message);
});
$("#High").on('click', function (event) {
    message = new Paho.MQTT.Message(COMMANDS.HIGH);
    message.destinationName = TOPICS.COMMANDS;
    client.send(message);
});

function DashBoardUpdate(chardata, value, timestamp) {
    chardata.datasets[0].data.push(value);
    chardata.labels.push(timestamp);
    if (chardata.labels.length > 20) {
        chardata.datasets[0].data.shift();
        chardata.labels.shift();
    }

}