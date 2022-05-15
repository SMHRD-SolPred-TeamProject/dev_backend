
const test =document.querySelector("#test");


setInterval(() => {


    fetch('http://59.0.236.34:9090/solarpred/api/test')
        .then(res => res.json())
        .then(res => {
            console.log()
            test.innerHTML += res.test['0']['num1'];
            test.append("<br/>")
        })





}, 1000);