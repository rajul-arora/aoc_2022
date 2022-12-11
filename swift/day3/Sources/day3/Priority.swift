//
//  File.swift
//  
//
//  Created by Rajul Arora on 2022-12-11.
//

import Foundation

enum Priority: Int {
    case a = 1
    case b = 2
    case c = 3
    case d = 4
    case e = 5
    case f = 6
    case g = 7
    case h = 8
    case i = 9
    case j = 10
    case k = 11
    case l = 12
    case m = 13
    case n = 14
    case o = 15
    case p = 16
    case q = 17
    case r = 18
    case s = 19
    case t = 20
    case u = 21
    case v = 22
    case w = 23
    case x = 24
    case y = 25
    case z = 26
    case A = 27
    case B = 28
    case C = 29
    case D = 30
    case E = 31
    case F = 32
    case G = 33
    case H = 34
    case I = 35
    case J = 36
    case K = 37
    case L = 38
    case M = 39
    case N = 40
    case O = 41
    case P = 42
    case Q = 43
    case R = 44
    case S = 45
    case T = 46
    case U = 47
    case V = 48
    case W = 49
    case X = 50
    case Y = 51
    case Z = 52
}

extension Priority {
    init?(stringValue: String) {
        if stringValue == "a" {
            self = .a
        } else if stringValue == "b" {
            self = .b
        } else if stringValue == "c"  {
            self = .c
        } else if stringValue == "d" {
            self = .d
        } else if stringValue == "e" {
            self = .e
        } else if stringValue == "f" {
            self = .f
        } else if stringValue == "g"  {
            self = .g
        } else if stringValue == "h" {
            self = .h
        } else if stringValue == "i" {
            self = .i
        } else if stringValue == "j" {
            self = .j
        } else if stringValue == "k" {
            self = .k
        } else if stringValue == "l"  {
            self = .l
        } else if stringValue == "m" {
            self = .m
        } else if stringValue == "n" {
            self = .n
        } else if stringValue == "o" {
            self = .o
        } else if stringValue == "p"  {
            self = .p
        } else if stringValue == "q" {
            self = .q
        } else if stringValue == "r" {
            self = .r
        } else if stringValue == "s" {
            self = .s
        } else if stringValue == "t" {
            self = .t
        } else if stringValue == "u" {
            self = .u
        } else if stringValue == "v"  {
            self = .v
        } else if stringValue == "w" {
            self = .w
        } else if stringValue == "x" {
            self = .x
        } else if stringValue == "y" {
            self = .y
        } else if stringValue == "z"  {
            self = .z
        } else if stringValue == "A" {
            self = .A
        } else if stringValue == "B" {
            self = .B
        } else if stringValue == "C" {
            self = .C
        } else if stringValue == "D" {
            self = .D
        } else if stringValue == "E"  {
            self = .E
        } else if stringValue == "F" {
            self = .F
        } else if stringValue == "G" {
            self = .G
        } else if stringValue == "H" {
            self = .H
        } else if stringValue == "I"  {
            self = .I
        } else if stringValue == "J" {
            self = .J
        } else if stringValue == "K" {
            self = .K
        } else if stringValue == "L" {
            self = .L
        } else if stringValue == "M" {
            self = .M
        } else if stringValue == "N" {
            self = .N
        } else if stringValue == "O"  {
            self = .O
        } else if stringValue == "P" {
            self = .P
        } else if stringValue == "Q" {
            self = .Q
        } else if stringValue == "R" {
            self = .R
        } else if stringValue == "S"  {
            self = .S
        } else if stringValue == "T" {
            self = .T
        } else if stringValue == "U" {
            self = .U
        } else if stringValue == "V" {
            self = .V
        } else if stringValue == "W" {
            self = .W
        } else if stringValue == "X"  {
            self = .X
        } else if stringValue == "Y" {
            self = .Y
        } else if stringValue == "Z" {
            self = .Z
        } else {
            return nil
        }
    }
}
