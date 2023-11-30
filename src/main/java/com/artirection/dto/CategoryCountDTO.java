package com.artirection.dto;

public class CategoryCountDTO {
	private String category;
	private int categoryCount;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCategoryCount() {
		return categoryCount;
	}
	public void setCategoryCount(int categoryCount) {
		this.categoryCount = categoryCount;
	}
	public CategoryCountDTO(String category, int categoryCount) {
		super();
		this.category = category;
		this.categoryCount = categoryCount;
	}
	public CategoryCountDTO() {
		super();
	}

	
}
