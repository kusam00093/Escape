package com.escape.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Package_Review_ImgVo {
	public Package_Review_ImgVo(String image) {
		this.image = image;
	}
	int package_review_image_idx;
	int package_review_idx;
	String image;
}
