$(document).ready(() =>{
    question1()
    question2()
    //question3()
    question5()
    question6()
})

function question1(){
    $('item:contains("Sucre")').text("Miel")
    $('item:first').remove()
}

function question2(){
    $('items').append('<item>Confiture</item>')
    $('item.important').prepend('+ ')
}

function question3(){
    const items = document.querySelectorAll('item')
    items.forEach((item) => {
        item.style.backgroundColor = "silver"
        item.style.fontWeight = "normal"
        item.style.fontStyle = "italic"

        if (item.innerHTML.includes("+ ")) {
            item.innerHTML = item.innerHTML.replace("+ ","");
        }
    })
}

function question4(){
    $("item").on("mouseover click", function (event) {
        const text = $(this).text()
        const status = $(this).attr("class") ?? "";
        const type = event.type

        $("list > div").remove();

        $("list").append(`
            <div>
                Item = ${text}<br>
                Status = ${status}<br>
                const type = ${type}
            <\div>
        `)
    });
}

function question5(){

    
    $("item").on("click", function (event) {
        $(this).fadeOut(500,function() {
            $(this).remove()
        });
    });
}

function question6(){
    $("#new button").click(() => {
        const value = $("#add input").val();
        $("items").append("<item>" + value + "</item>");
        $("#add").show();
        $("#new").hide();
    })
}

