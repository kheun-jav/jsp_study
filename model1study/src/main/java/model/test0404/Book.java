package model.test0404;
/*
 * book 클래스는 DTO를 가지고 있는 Bean 클래스이다.
 * 
 */
public class Book {
	private String writer;
	private String title;
	private String content;
// setter, getter, toString 객체 생성	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Book [writer=" + writer + ", title=" + title + ", content=" + content + "]";
	}	
}
