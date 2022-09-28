document.addEventListener("DOMContentLoaded", function(event) {
   
    var btn = document.getElementById("Save");

    btn.onclick = function() {
        test()
    };

    function test() {
        try {
            window.webkit.messageHandlers.callbackHandler.postMessage("Hello from JavaScript");    
        } catch (error) {
            console.log("The native context does not exist yet");
        }
    }

});
