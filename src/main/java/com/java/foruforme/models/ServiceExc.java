
package com.java.foruforme.models;

import java.util.Date;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name="servicesexc")
public class ServiceExc {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;


@Size(min=1, message="Service must have a description")
private String description;

@Size(min=1, message="Service must have a date! This is required.")
private String serviceExcDate;

@Size(min=1, message="An address is required")
private String address;

@Size(min=1, message="State is required")
private String state;

@Column(updatable=false)
private Date createdAt;
private Date updatedAt;

@ManyToMany(fetch = FetchType.LAZY)
@JoinTable(
        name = "ratings",
        joinColumns = @JoinColumn(name="serviceexc_id"),
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )

private List <User> users; 

//host id
@ManyToOne(fetch= FetchType.LAZY)
@JoinColumn(name="user_id")
private User user;

public User getUser() {
	return user;
}

public void setUser(User user) {
	this.user = user;
}

public List<Rating> getRatings() {
	return ratings;
}

public void setRatings(List<Rating> ratings) {
	this.ratings = ratings;
}

@OneToMany(mappedBy="serviceExc", fetch = FetchType.LAZY)
    private List<Rating> ratings;




public ServiceExc() {

}

 @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getServiceExcDate() {
		return serviceExcDate;
	}

	public void setServiceExcDate(String serviceExcDate) {
		this.serviceExcDate = serviceExcDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

        
        

}