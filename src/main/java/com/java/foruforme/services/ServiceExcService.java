package com.java.foruforme.services;

import java.util.List;


import java.util.Optional;

import org.springframework.stereotype.Service;




import java.util.Optional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.java.foruforme.models.Rating;
import com.java.foruforme.models.ServiceExc;
import com.java.foruforme.repositories.RatingRepository;
import com.java.foruforme.repositories.ServiceExcRepository;

@Service
public class ServiceExcService {

    private final ServiceExcRepository serviceExcRepository;
    private final RatingRepository ratingRepository;

    public ServiceExcService(ServiceExcRepository serviceExcRepository, RatingRepository ratingRepository) {
        this.serviceExcRepository = serviceExcRepository;
        this.ratingRepository = ratingRepository;

    }

public List<ServiceExc> allServiceExc(){
    return serviceExcRepository.findAll();
}

public ServiceExc findServiceExc(Long id) {
    Optional <ServiceExc> s = serviceExcRepository.findById(id);
    if(s.isPresent()) {
        return s.get();
    
    } else {
        return null;
    }
}

public ServiceExc addServiceExc(ServiceExc serviceExc) {
    return serviceExcRepository.save(serviceExc);
}



public void deleteServiceExc(Long id) {
    serviceExcRepository.deleteById(id);
}

public ServiceExc submitEdit(ServiceExc serviceExc) {
    serviceExcRepository.save(serviceExc);
    return serviceExc;
}

 

public List<ServiceExc> getSearchLocations(String state) {
	return serviceExcRepository.findByState(state);
}

public List<ServiceExc> getSearchServices(String description) {
	return serviceExcRepository.findByDescription(description);
}

//RATINGS 

public Rating createRating(Rating rating) {
	return ratingRepository.save(rating);
}

public Rating addRating(Rating rating) {
	return ratingRepository.save(rating);
}

// END RATINGS


}

