package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.model.Product;
import com.example.repository.ProductRepository;

@Service
@Transactional(readOnly = true)
public class ProductService {
	
	@Autowired
	private ProductRepository repository;
	
	public List<Product> findAll() {
		return repository.findAll();
	}

	public Product findOne(Integer id) {
		return repository.findOne(id);
	}

	@Transactional(readOnly = false)
	public Product save(Product entity) {
		return repository.save(entity);
	}
	
	@Transactional(readOnly = false)
	public List<Product> save(List<Product> products) {
		return repository.save(products);
	}

	@Transactional(readOnly = false)
	public void delete(Product entity) {
		repository.delete(entity);
	}

}
