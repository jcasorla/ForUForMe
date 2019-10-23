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
	
	@Column(name="profilePic")
	private String profilePic;
	
	@Column(name="comment")
	private String comment;
	
	@Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn (name="user_id")
	private User user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn (name="serviceexc_id")
	private ServiceExc serviceExc;
	
	
	@PrePersist
	protected void onCreate(){
	    this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate(){
	    this.updatedAt = new Date();
	}
    
    public Rating() {
    	
    }
    
    
	

}