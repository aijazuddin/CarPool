package com.pojo;

import java.util.List;

public class PostMap {
	private Post post;
	private List<Comment> comment;
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public List<Comment> getComment() {
		return comment;
	}
	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}
	
}
