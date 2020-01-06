package com.company;

import javax.swing.*;
import java.sql.SQLOutput;

public class Main {

    public static void main(String[] args) {
        // write your code here

        int age;
        float height;
        String name;
        boolean trueorfalse;

        age = 17;
        height = 1.85f;
        name = "theo";
        trueorfalse = true;

        System.out.println(age);
        System.out.println(height);
        System.out.println(name);
        System.out.println(trueorfalse);
        System.out.println(age + " " + height + " " + name);

        int A;
        int B;
        int C;
        A = 1;
        B = 17;
        C = 16;
        if (A < B) {
            System.out.println("a est la plus petite variable par rapport a B");
        } else if (B < A) {
            System.out.println("b est la plus petite variable par rapport a A");
        }

        if (C < A) {
            System.out.println("C est la plus petite par rapport a A");
        }
            else if (A < C);{
            System.out.println("A est la plus petite par rapport a C");
        }
        if (C < B) {
            System.out.println("c est plus petit que B");
        }
           else if (B < C) {
            System.out.println("B est plus petit par rapport a c");
        }


           int D;

           D = 18;

           if (D <= 17) {
               System.out.println("tu es mineur");
           }
           else if (D <= 18) {
            System.out.println("tu es majeur");
        }

           int bac;

           bac = 16;

           if (bac < 10) {
               System.out.println("pas le bac");
           }
           else {
               System.out.println("t'as le bac");
           }
           if (bac < 12) {
               System.out.println("tu n'as point la mention assez bien jeune homme");
           }
           else {
            System.out.println("tu as la mention assez bien");

           }
           if (bac < 14) {
               System.out.println("tu n'as pas la mention bien");
           }
           else {
               System.out.println("tu as la mention bien");
           }
           if (bac < 16) {
               System.out.println("tu as pas la mention tres bien");
           }
           else {
               System.out.println("tu as la mention tres bien ");
           }





           int R;

           R = 12;

           if (R % 2 == 0) {
            System.out.println("donc le numero est pair");
        }
           else {
            System.out.println("le nombre est impair");
        }

           int minutesTotals = 1000;
           int heure = minutesTotals / 60;
           int minute = minutesTotals % 60;
           System.out.println(minutesTotals + " = " + heure + "h " + minute + "m.");




        int F = 100 ;
        int I;

        for( I = 1 ; I <= F ; I = I + 1 ) {

            System.out.println( I );
        }



        int z = 0 ;
        int Q ;

        for( Q = 100 ; Q >= z ; Q = Q - 1 ) {

            System.out.println( Q );
        }

        for(int i = 0; i <= 100; i++){
            if (i % 3 == 0){
                System.out.println(i);
            }

        }

        int m;
        int p;
        int o;

        m = 5;
        p = 3;
        o = m;
        System.out.println();

        while (p - 1 > 0){
            m = m * o;
            p--;
        }
        System.out.print(m);


        int v;
        int u;
        v = 5;
        u = 0;
        System.out.println();

        while (u <= 10){
            System.out.print(v * u + " ");
            u++;
        }

        int N;

        System.out.println();
        A = 1;
        N = 0;

        while (N < 10){
            N = A + N;
            System.out.print(" " + N);

        }

        int a;
        int b;

        a = 1298;
        b = 0;
        System.out.println();
        while(a >= 10){
            b = b * 10 + a % 10;
            a = a / 10;
        }
            b = b * 10 + a;
        System.out.print(b);


        a = 14;
        System.out.println();
        while(a > 1){
            if(a % 2 == 0)
                a = a / 2;

            else

                a = a * 3 + 1;
            System.out.print(" " + a);
        }

        a = -1;
        b = -12;
        if (a < 0){
            System.out.println("c'est negatif");


            System.out.println("c'est positif");



        }
































    }








}
