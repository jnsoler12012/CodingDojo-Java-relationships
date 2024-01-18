package com.nicolas.relationships.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nicolas.relationships.model.License;

@Repository
public interface LicenseRepository extends CrudRepository <License, Long>{
	
	List<License> findTopByOrderByNumberDesc();
}