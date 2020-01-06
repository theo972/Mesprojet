package com.company;

import javax.swing.*;

public class Main {

    static void variables() {
        int nbr;
        float comp;
        float dec;
        String str;
        boolean piece;

        nbr = 10;
        comp = 0f;
        dec = 9.4f;
        str = "Eh dis donc, Jamy !";
        piece = true;
        System.out.println("Hello World, bitchies !");
        System.out.println("nbr est égal à: " + nbr);
        System.out.println("dec est égal à: " + dec);
        System.out.println("str est égal à: " + str);
        System.out.println("piece est égal à: " + piece);
        System.out.println();

        nbr = 2 * nbr + 3;
        System.out.println("2 * nbr + 3 est égal à : " + nbr);
        nbr = (nbr - 5) / 2 % 3 + 9;
        System.out.println("(nbr - 5) / 2 % 3 + 9 est égal à " + nbr);
        comp = nbr / 2;
        System.out.println("nbr / 2 = " + comp);
        //Un int impair divisé par 2 affiche un float qui s'arrête à l'unité.0
        comp = dec / 2;
        System.out.println("dec / 2 = " + comp);
        //un float divisé par 2 donne un float qui s'arrête net ou au nombre maximal de digit flottant
    }

    static void conditional() {
        int grd;
        int myn;
        int pti;

        grd = 0;
        myn = 0;
        pti = 0;

        System.out.println();
        if (pti < grd && pti < myn)
            System.out.println("pti est le nombre le plus petit");
        else if (myn < grd && myn < pti)
            System.out.println("myn est le nombre le plus petit");
        else if (grd < myn && grd < pti)
            System.out.println("grd est le nombre le plus petit");
        else if (pti == grd && pti < myn)
            System.out.println("pti et grd sont les nombres les plus petits");
        else if (myn == grd && myn < pti)
            System.out.println("myn et grd sont les nombres les plus petits");
        else if (myn == pti && myn < grd)
            System.out.println("myn et pti sont les nombres le plus petits");
        else
            System.out.println("Tous les nombres sont égaux");

        int sign1;
        int sign2;

        sign1 = -10;
        sign2 = -12;
        System.out.println();
        if ((sign1 >= 0 && sign2 >= 0) || (sign1 < 0 && sign2 < 0))
            System.out.println("Le signe de sign1 * sign2 est positif");
        else
            System.out.println("Le signe de sign1 * sign2 est négatif");

        int age;

        age = 14;
        System.out.println();
        if (age >= 18)
            System.out.println("Cette personne est légale =3");
        else
            System.out.println("Cette personne est illégale :/");

        int notebac;

        notebac = 42;
        System.out.println();
        if (notebac < 10)
            System.out.println("T'as pas l'niveau !");
        if (notebac >= 10 && notebac < 13)
            System.out.println("Bac sans mention");
        if (notebac >= 13 && notebac < 16)
            System.out.println("Mention Assez-Bien");
        if (notebac >= 16 && notebac < 18)
            System.out.println("Mention Très Bien");
        if (notebac >= 18 && notebac < 20)
            System.out.println("Mention Excellente");
        if (notebac == 20)
            System.out.println("Mention Parfaite");
        if (notebac > 20)
            System.out.println("T'as niqué le game putain");
        if (notebac == 42)
            System.out.println("CETTE PERSONNE EST UN GENIE BORDEL");

        int pairimpair;

        pairimpair = 53;
        System.out.println();
        if (pairimpair % 2 == 0)
            System.out.println("pairimpair est pair");
        else
            System.out.println("pairimpair est impair");

        /*int annee;
        int mois;
        int jour;

        annee = 1900;
        mois = 02;
        jour = 29;
        System.out.println();
        if (annee % 400 == 0 || (annee % 4 == 0 && annee % 100 != 0))
            System.out.println("L'année " + annee + " est bissextile");
        else
            System.out.println("L'année " + annee + " est normale");

        System.out.println();
        if (annee >= 0) {
            if (mois >= 1 && mois <= 12) {
                if ((mois % 2 == 1 || mois == 8) && jour >= 1 && jour <= 31)
                    System.out.println("La date " + jour + "/" + mois + "/" + annee + " est valide");
                else if (mois % 2 == 0 && mois != 2 && mois != 7 && jour >= 1 && jour <= 30)
                    System.out.println("La date " + jour + "/" + mois + "/" + annee + " est valide");
                else if (mois == 2) {
                    if (annee % 400 == 0 || (annee % 4 == 0 && annee % 100 != 0)) {
                        if (jour >= 1 && jour <= 29)
                            System.out.println("La date " + jour + "/" + mois + "/" + annee + " est valide");
                        else
                            System.out.println("La date " + jour + "/" + mois + "/" + annee + " est invalide");
                    } else if (jour >= 1 && jour <= 28)
                        System.out.println("La date " + jour + "/" + mois + "/" + annee + " est valide");
                    else
                        System.out.println("La date " + jour + "/" + mois + "/" + annee + " est invalide");
                }
            }
        } else
            System.out.println("La date " + jour + "/" + mois + "/" + annee + " est invalide");*/
    }

    static void loop() {
        int n;

        n = 0;
        System.out.println();
        while (n <= 100) {
            System.out.print(n + " ");
            n++;
        }
        System.out.println();
        while (n > 0) {
            n--;
            System.out.print(n + " ");
        }
        System.out.println();

        while (n <= 100) {
            if (n % 3 == 0 && n != 0)
                System.out.print(n + " ");
            n++;
        }

        int a;
        int b;
        int c;

        a = 9;
        b = 3;
        c = a;
        System.out.println();
        if (b == 0)
            a = 1;
        while (b - 1 > 0) {
            a = a * c;
            b--;
        }
        System.out.println(a);

        a = 6;
        b = 0;
        System.out.println();
        while (b <= 10) {
            System.out.print(a * b + " ");
            b++;
        }

        int m;

        a = 0;
        m = 45;

        System.out.println();
        while (a + a + 1 <= m) {
            a = a + a + 1;
            System.out.print(a + " ");
        }

        int nb;
        int bn;

        nb = 5432;
        bn = 0;
        System.out.println();
        while (nb >= 10) {
            bn = bn * 10 + nb % 10;
            nb = nb / 10;
        }
        bn = bn * 10 + nb;
        System.out.println(bn);

        nb = 25;
        System.out.println();
        System.out.print(nb + " ");
        while (nb > 1) {
            if (nb % 2 == 0)
                nb = nb / 2;
            else
                nb = 3 * nb + 1;
            System.out.print(nb + " ");
        }
    }

    static int min(int minA, int minB) {
        int eq;

        eq = minA;
        if (minA < minB)
            return minA;
        else if (minA > minB)
            return minB;
        return eq;
    }

    static int abs(int valab) {
        if (valab < 0)
            valab = -valab;
        return valab;
    }

    static boolean isCorrectDate(int day, int month, int year) {
        if (month >= 1 && month <= 12 && year >= 0) {
            if ((month % 2 == 1 || month == 8) && day >= 1 && day <= 31)
                return true;
            else if (month % 2 == 0 && month != 2 && day >= 1 && day <= 30)
                return true;
            else {
                if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0))
                    return day >= 1 && day <= 29;
                return day >= 1 && day <= 28;
            }
        }
        return false;
    }

    static boolean leapYear(int year) {
        if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0))
            return true;
        return false;
    }

    static int sum(int nbr)
    {
        int sm;
        int neg;

        sm = 0;
        neg = 1;
        if (nbr < 0) {
            nbr = -nbr;
            neg = -1;
        }
        while (nbr >= 10)
        {
            sm = sm + nbr % 10;
            nbr = nbr / 10;
        }
        sm = (sm + nbr) * neg;
        return sm;
    }

    static int power(int nb, int pow)
    {
        int mul;

        mul = nb;
        if (pow == 0)
            nb = 1;
        while (pow - 1 > 0) {
            nb = nb * mul;
            pow--;
        }
        return nb;
    }

    static void displayMultTable(int numb)
    {
        int mul;

        for (mul = 0; mul <= 10; mul++)
            System.out.print(numb * mul + " ");
        System.out.println();
    }

    static int integerMirror(int nmb)
    {
        int rbmn;

        rbmn = 0;
        while (nmb >= 10) {
            rbmn = rbmn * 10 + nmb % 10;
            nmb = nmb / 10;
        }
        rbmn = rbmn * 10 + nmb;
        return (rbmn);
    }

    static void function()
    {
        int minA;
        int minB;
        minA = -3;
        minB = 5;
        System.out.println("Le chiffre le plus petit est " + min(minA, minB));

        int valab;
        valab = -1232;
        System.out.println("La valeur absolue de valab est " + abs(valab));


        int day;
        int month;
        int year;
        String correct;
        String norbi;

        day = 29;
        month = 02;
        year = 2004;

        correct = "valide";
        if (!isCorrectDate(day, month, year))
            correct = "invalide";
        System.out.println("La date " + day + "/" + month + "/" + year + " est " + correct);

        norbi = "bissextile";
        if (!leapYear(year))
            norbi = "normale";
        System.out.println("L'année " + year + " est " + norbi);

        int nbr;

        nbr = -3678;
        System.out.println("La somme des chiffres de " + nbr + " est " + sum(nbr));

        int nb;
        int pow;

        nb = 4;
        pow = 7;
        System.out.println("Le nombre " + nb + " à la puissance " + pow + " est de " + power(nb,pow));

        int numb;
        numb = 6;
        displayMultTable(numb);

        int nmb;

        nmb = 356275;
        System.out.println("Le nombre mirroir de " + nmb + " est " + integerMirror(nmb));
    }

    public static void main(String[] args) {
        /*variables();
        conditional();
        loop();
        function();*/
    }
}