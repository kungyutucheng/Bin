package com.bin.databinder.helper;

import java.util.List;

import com.bin.model.Comment;

public class CommentListForm {

	private List<Comment> comments;

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "CommentListForm [comments=" + comments + "]";
	}
	
}
