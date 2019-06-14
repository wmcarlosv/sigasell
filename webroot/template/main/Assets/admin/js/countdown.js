var countdownNum = document.getElementById("countdown");
var counter = 3;
var newElement = document.createElement("p");
newElement.innerHTML = "Redirect You in 3 s...";
var id;

countdownNum.parentNode.replaceChild(newElement, countdownNum);

id = setInterval(function() {
    counter--;
    if(counter < 0) {
        newElement.parentNode.replaceChild(countdownNum, newElement);
        clearInterval(id);
    } else {
        newElement.innerHTML = "Redirect You in " + counter.toString() + " s...";
    }
}, 1000);