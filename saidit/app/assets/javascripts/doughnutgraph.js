var data = [
    {
        value: 25,
        color:"#F7464A",
        highlight: "#FF5A5E",
        label: "Joy"
    },
    {
        value: 25,
        color: "#46BFBD",
        highlight: "#5AD3D1",
        label: "Confusion"
    },
    {
        value: 25,
        color: "#FDB45C",
        highlight: "#FFC870",
        label: "Anger"
    },
     {
        value: 25,
        color: "#68EFAD",
        highlight: "#68EFFE",
        label: "Fear"
    }
]



var context = $('#chart').get(0).getContext('2d');
var chart = new Chart(context).Doughnut(data, options);
