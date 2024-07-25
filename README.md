# Decentralized Library Smart Contract

This Solidity smart contract implements a simple decentralized library system where users can add books, borrow books, and return books.

## Features

- **Add Book:** Allows users to add new books to the library.
- **Borrow Book:** Allows users to borrow available books.
- **Return Book:** Allows users to return borrowed books.
- **Get Book Details:** Allows users to get details of a specific book.

## Error Handling

- **`require()`:** Ensures the user has borrowed the book before returning it.
- **`revert()`:** Handles unavailable books and double borrowing.
- **`assert()`:** Ensures the book's availability status is correctly updated when borrowed or returned.

## Events
- BookAdded(uint256 bookId, string title, string author)
- BookBorrowed(uint256 bookId, address borrower)
- BookReturned(uint256 bookId, address borrower)

## License

This project is licensed under the MIT License.