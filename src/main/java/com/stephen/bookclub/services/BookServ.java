package com.stephen.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stephen.bookclub.models.Book;
import com.stephen.bookclub.models.User;
import com.stephen.bookclub.repositories.BookRepository;

@Service
public class BookServ {
	
	@Autowired
	private BookRepository bookRepo;
	
	// returns all books
	public List<Book> allBooks(){
		return bookRepo.findAll();
	}
	
	// creates a book
	public Book createBook(Book book) {
		return bookRepo.save(book);
	}
	
	// retrieves a book by Id
	public Book findBookId(Long id) {
		Optional<Book> optBook = bookRepo.findById(id);
		if(optBook.isPresent()) {
			return optBook.get();
		}else {
			return null;
		}
	}
	
	// update a book
	public Book updateBook(Book book) {
		return bookRepo.save(book);
	}
	
	// delete a book
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}
	
	public List<Book>myBooks(User user){
		return bookRepo.findByUserId(user.getId());
	}
	
	public List<Book>unborrowedBooks(User user){
		return bookRepo.findByUserIdOrBorrowerId(user.getId(), null);
	}
	
	public List<Book>borrowedBooks(User user){
		return bookRepo.findByBorrowerId(user.getId());
	}
	
	
	public void addBorrower(Book book, User user) {
		book.setBorrower(user);
		bookRepo.save(book);
	}
	
	public void removeBorrower(Book book) {
		book.setBorrower(null);
		bookRepo.save(book);
	}
	
	
}
