//
//  api.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/17/26.
//

import Foundation

func getBooks() -> [Book] {
    return  [
        Book(
            title: "The Fellowship of the Ring",
            author: "J.R.R Tolkien",
            cover: "lotr_fellowship",
            summary: "In The Fellowship of the Ring, Frodo Baggins inherits the One Ring from Bilbo, discovering it is the source of Sauron’s power. Guided by Gandalf, Frodo leaves the Shire, forming a Fellowship of nine to destroy the Ring in Mount Doom, battling through dangers like the Mines of Moria before breaking apart at Amon Hen.",
            rating: 4,
            review: "A must read for all Tolkien fans!"
        ),
        
        Book(
            title: "The Two Towers",
            author: "J.R.R Tolkien",
            cover: "lotr_towers",
            summary: "The sequel to the Golden Globe-nominated and AFI Award-winning The Two Towers follows the continuing quest of Frodo and the Fellowship to destroy the One Ring. Frodo and Sam discover they are being followed by the mysterious Gollum. Aragorn, the Elf archer Legolas and Gimli the Dwarf encounter the besieged Rohan kingdom, whose once great King Theoden has fallen under Saruman's deadly spell.",
            rating: 3,
            review: "fan favorite!"
        ),
        
        Book(
            title: "The Return of the King",
            author: "J.R.R Tolkien",
            cover: "lotr_king",
            summary: "The culmination of nearly 10 years' work and conclusion to Peter Jackson's epic trilogy based on the timeless J.R.R. Tolkien classic, The Lord of the Rings: The Return of the King presents the final confrontation between the forces of good and evil fighting for control of the future of Middle-earth. Hobbits Frodo and Sam reach Mordor in their quest to destroy the `one ring', while Aragorn leads the forces of good against Sauron's evil army at the stone city of Minas Tirith.",
            rating: 5,
            review: "best book ever!"
        ),
        
        Book(
            title: "Deastiny's Child",
            author: "",
            cover: "Destinys_child",
            summary: "",
            rating: 5,
            review: ""
        )
    ]
        
 
    
        
}

func getNewBook() -> Book {
    Book(title:"", author:"", cover:"", summary:"")
}


