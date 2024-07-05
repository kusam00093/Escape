package com.escape.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Package_imageVo {
	
	private int     package_image_idx;
	private int     package_idx;
	private String  image;
	private List<MultipartFile> file;
	
	public Package_imageVo(String image) {
		this.image = image;
	}


}
