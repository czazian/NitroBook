﻿//Text Slider
var slideNumber = 1;
var duration = 4000;

//Onload function only one
window.onload = function () {
    slide(slideNumber);
    //For autoplay promoter
    setInterval(function () {
        plusSlides(1);
    }, duration);
};

function plusSlides(number) {
    slide((slideNumber += number));
}

function slide(number) {
    //Selecting the slides
    var slideno = document.getElementsByClassName("promoslide");
    if (number > slideno.length) {
        slideNumber = 1;
    }
    if (number < 1) {
        slideNumber = slideno.length;
    }
    for (var i = 0; i < slideno.length; i++) {
        slideno[i].style.display = "none";
    }
    slideno[slideNumber - 1].style.display = "flex";
}


//Check the lenght of book name and author name, if > 17, take only 20 chars + ...
//For book title
$(".s1").each(function () {
    var string = $(this).text();
    var limit = 17;
    var length = string.length;
    if (length > limit) {
        var result = string.substr(0, limit);
        $(this).text(result + "...");
    }
});


//For author name
$(".s2").each(function () {
    var string = $(this).text();
    var limit = 17;
    var length = string.length;
    if (length > limit) {
        var result = string.substr(0, limit);
        $(this).text(result + "...");
    }
});



