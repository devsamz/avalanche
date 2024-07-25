// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedLibrary {
    struct Book {
        string title;
        string author;
        bool isAvailable;
    }

    mapping(uint256 => Book) public books;
    mapping(address => mapping(uint256 => bool)) public borrowedBooks;
    uint256 public bookCount;

    event BookAdded(uint256 bookId, string title, string author);
    event BookBorrowed(uint256 bookId, address borrower);
    event BookReturned(uint256 bookId, address borrower);

    // Function to add a new book to the library
    function addBook(string memory title, string memory author) public {
        bookCount++;
        books[bookCount] = Book({
            title: title,
            author: author,
            isAvailable: true
        });
        emit BookAdded(bookCount, title, author);
    }

    // Function to borrow a book from the library
    function borrowBook(uint256 bookId) public {
        Book storage book = books[bookId];

        // Ensure the book exists and is available
        if (!book.isAvailable) {
            revert("Book is not available.");
        }

        // Ensure the user has not already borrowed this book
        if (borrowedBooks[msg.sender][bookId]) {
            revert("You have already borrowed this book.");
        }

        borrowedBooks[msg.sender][bookId] = true;
        book.isAvailable = false;

        // Assert to ensure the book is marked as unavailable after borrowing
        assert(!book.isAvailable);

        emit BookBorrowed(bookId, msg.sender);
    }

    // Function to return a borrowed book to the library
    function returnBook(uint256 bookId) public {
        Book storage book = books[bookId];

        // Ensure the user has borrowed this book
        require(borrowedBooks[msg.sender][bookId], "You have not borrowed this book.");
        
        borrowedBooks[msg.sender][bookId] = false;
        book.isAvailable = true;

        // Assert to ensure the book is marked as available after returning
        assert(book.isAvailable);

        emit BookReturned(bookId, msg.sender);
    }

    // Function to get book details
    function getBookDetails(uint256 bookId) public view returns (
        string memory title,
        string memory author,
        bool isAvailable
    ) {
        Book storage book = books[bookId];
        return (book.title, book.author, book.isAvailable);
    }
}
