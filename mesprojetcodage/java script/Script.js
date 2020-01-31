{
var exob = 10;
switch(exob){
case Number:
    console.log("c'est un nombre");
break;
case String:
    console.log("C'est une chaine de charatere")
break;
case Boolean:
    console.log("c'est un booléen")
break;
default:
    console.log("c'est une variable non defini")
}
console.log(typeof exob);
}

{
var boucle = 0
while (boucle < 10) {
console.log(boucle);
++boucle;
}
}

function isEven(exoD){
    if (exoD % 2 == 0){
        console.log("C'est un nombre pair")
    }else if(exoD % 2 == 1){
        console.log("C'est un nombre impair")
    }if(exoD == -1){
        console.log("c'est un chiffre negative")
    }
    return;
}
isEven(-1);


function compareA_B(ExoE_A,ExoE_B){
    if (ExoE_B < ExoE_A){
        console.log("ExoE_B est inferieur a ExoE_A")
    }else if(ExoE_B > ExoE_A){
        console.log("ExoE_A est superieux a ExoE_B")
    }if(ExoE_A = exoE_B){ 
        console.log("les deux sont egale")
    }
    return;
}
compareA_B(20,20);
