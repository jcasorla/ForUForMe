package com.java.foruforme.repositories;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.java.foruforme.models.Rating;


@Repository
public interface RatingRepository extends CrudRepository <Rating, Long>{

}