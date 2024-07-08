package com.escape.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Package_BookmarkVo {
	
	private int package_bookmark_idx;
	private int user_idx;
	private int package_idx;
	private int state;
	private String 	created;

}
