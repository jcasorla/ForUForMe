package com.java.foruforme.repositories;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.java.foruforme.models.ServiceExc;

@Repository
public interface ServiceExcRepository extends CrudRepository <ServiceExc, Long> {
	List<ServiceExc> findAll();
}
