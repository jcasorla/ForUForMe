package com.java.foruforme.models;

import java.util.Date;
//import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
//import javax.persistence.JoinTable;
//import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

@Entity
@Table(name="ratings")
public class Rating {

@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
private Long id;

@Column(name="rating")
private int rating;

@Column(name="author")
private String author;

@Column(name="comment")
private String comment;

@ManyToOne(fetch = FetchType.LAZY)
@JoinColumn (name="user_id")
private User user;

@ManyToOne(fetch = FetchType.LAZY)
@JoinColumn (name="serviceexc_id")
private ServiceExc serviceExc;


@Column(updatable=false)
private Date createdAt;
private Date updatedAt;

public Rating() {

}


public Long getId() {
    return id;
}
public void setId(Long id) {
    this.id = id;
}

public int getRating() {
    return rating;
}

public void setRating(int rating) {
    this.rating = rating;
}

public String getComment() {
    return comment;
}

public void setComment(String comment) {
    this.comment = comment;
}

public User getUser() {
    return user;
}

public void setUser(User user) {
    this.user = user;
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

@PrePersist
protected void onCreate(){
    this.createdAt = new Date();
}
@PreUpdate
protected void onUpdate(){
    this.updatedAt = new Date();
}


public String getAuthor() {
	return author;
}


public void setAuthor(String author) {
	this.author = author;
}


public ServiceExc getServiceExc() {
	return serviceExc;
}


public void setServiceExc(ServiceExc serviceExc) {
	this.serviceExc = serviceExc;
}
}




