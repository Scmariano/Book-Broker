package com.stephen.bookclub.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.stephen.bookclub.models.Book;

@Repository
public interface BookRepository extends CrudRepository<Book,Long> {
	
	List<Book> findAll();
	List<Book> findByUserId(Long userId);
	List<Book> findByBorrowerId(Long userId);
	List<Book> findByUserIdOrBorrowerId(Long userId, Long borrowerId);

}
