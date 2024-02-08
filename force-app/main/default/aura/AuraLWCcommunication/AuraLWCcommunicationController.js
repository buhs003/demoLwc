({
    handelMsg: function (component, event) {
        //to fetch the msg comming from lwc event 
        //we need to pass the param of the event.
        var msg = event.getParam('msg')
        //to show this message in Aura we use 
        //view v to view some property in html.
        component.set("v.message",msg)
    }
})