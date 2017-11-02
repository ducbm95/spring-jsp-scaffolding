package com.example.api.controller;

import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.model.Product;
import com.example.service.ProductService;

@RestController
@RequestMapping("/api/products")
public class RestProductController {

	@Autowired
	private ProductService productService;

	// api/products?page=0&size=10
	@GetMapping
	public Page<Product> index(@PageableDefault(page = 0, size = 10, sort = { "id" }) Pageable pageable) {
		Page<Product> all = productService.findAll(pageable);
		return all;
	}

	@GetMapping("/{id}")
	public Product show(@PathVariable("id") Integer id) {
		return productService.findOne(id);
	}

	@PostMapping
	public Product create(@RequestBody Product entity) {
		Product product = null;
		try {
			product = productService.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return product;
	}

	@PostMapping("/{id}/update")
	public Product update(@RequestBody Product entity) {
		Product product = null;
		try {
			product = productService.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return product;
	}

	@DeleteMapping("/{id}")
	public Product delete(@PathVariable("id") Integer id) {
		Product entity = null;
		try {
			if (id != null) {
				entity = productService.findOne(id);
				productService.delete(entity);
			}
		} catch (Exception e) {
			throw new ServiceException(e.getMessage());
		}
		return entity;
	}
}
