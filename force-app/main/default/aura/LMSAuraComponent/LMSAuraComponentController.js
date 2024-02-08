({
    //component is the instance of our Aura Component and Message is the published message from the Aura component.
    //Specifying a controller action that read the message argument to get the values in the message payload as a json object.
    //Asoon as the message is recived we can print the message.
    handelMessage: function (component, message) {
        if (message != null && message.getParam("lmsData") != null) {
            component.set("v.messageRecived",message.getParam("lmsData").value)
        }
    },

    //reciving the typed message.
    inputhandler: function (component, event) {
        console.log(event.target.value)
        // here the value is set for the attribute container name
        component.set("v.messageValue", event.target.value)
    },
    //publishing the message from the attribute container inputField to other component.
    publishMessage: function (component) {
        let msg = component.get("v.messageValue")
        let message = {
            lmsData: {
                value: msg
            }
        }
        // calling publish method by its id as a instance
        component.find("SampleMessageChannel").publish(message)
    }
})