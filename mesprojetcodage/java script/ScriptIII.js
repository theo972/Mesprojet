name = () => {
    var selection = document.getElementById("number").value;
    if(selection < rslt){
        console.log('Le nombre est plus grand')
        document.getElementById("demo").innerHTML = "Le nombre est plus grand";
    }
    else if(selection > rslt){
        console.log('Le nombre est plus petit')
        document.getElementById("demo").innerHTML = "Le nombre est plus petit";
    }
    else if (rslt==selection){
        console.log('Vous avez gagnez')
        document.getElementById("demo").innerHTML = "Vous avez gagner";
        
    }
}