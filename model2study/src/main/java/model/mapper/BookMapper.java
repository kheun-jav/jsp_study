package model.mapper;

import org.apache.ibatis.annotations.Insert;

import model.book.Book;

public interface BookMapper {

	
	@Insert("insert into book (writer, title, content)"
			+ " values(#{writer}, #{title}, #{content})")
	boolean insert(Book book);

}
