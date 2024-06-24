package com.escape.accommodation.controller;

import java.util.List;

import javax.naming.directory.SearchResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.escape.accommodation.domain.SearchRequest;
import com.escape.accommodation.service.AccommodationApiService;

@RestController
@RequestMapping("/AccommodationApi")
public class AccommodationApiController {
	
	@Autowired
	private AccommodationApiService accommodationApiService;
	
	// /AccommodationApi/Search
	@PostMapping("/Search")
	public List<SearchResult> search(@RequestBody SearchRequest request) {

		return accommodationApiService.search(request.getQuery());
	}

}
