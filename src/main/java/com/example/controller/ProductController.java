package com.example.controller;

import java.util.List;

import javax.validation.Valid;

import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.model.Product;
import com.example.model.ProductListForm;
import com.example.service.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController {

	private static final String MSG_SUCESS_INSERT = "Product inserted successfully.";
	private static final String MSG_SUCESS_UPDATE = "Product successfully changed.";
	private static final String MSG_SUCESS_DELETE = "Deleted Product successfully.";
	private static final String MSG_ERROR = "Error.";

	@Autowired
	private ProductService productService;

	@GetMapping
	public String index(Model model) {
		List<Product> all = productService.findAll();
		model.addAttribute("products", all);
		return "product/index";
	}

	@GetMapping("/{id}")
	public String show(Model model, @PathVariable("id") Integer id) {
		if (id != null) {
			Product product = productService.findOne(id);
			model.addAttribute("product", product);
		}
		return "product/show";
	}

	@GetMapping(value = "/new")
	public String create(Model model, @ModelAttribute Product entity) {
		model.addAttribute("product", entity);
		return "product/form";
	}

	@PostMapping
	public String create(@Valid @ModelAttribute Product entity, BindingResult result,
			RedirectAttributes redirectAttributes) {
		Product product = null;
		try {
			product = productService.save(entity);
			redirectAttributes.addFlashAttribute("success", MSG_SUCESS_INSERT);
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", MSG_ERROR);
			e.printStackTrace();
		}
		return "redirect:/products/" + product.getId();
	}

	@GetMapping("/{id}/edit")
	public String update(Model model, @PathVariable("id") Integer id) {
		try {
			if (id != null) {
				Product entity = productService.findOne(id);
				model.addAttribute("product", entity);
			}
		} catch (Exception e) {
			throw new ServiceException(e.getMessage());
		}
		return "product/form";
	}

	@PostMapping("/{id}/update")
	public String update(@Valid @ModelAttribute Product entity, BindingResult result,
			RedirectAttributes redirectAttributes) {
		Product product = null;
		try {
			product = productService.save(entity);
			redirectAttributes.addFlashAttribute("success", MSG_SUCESS_UPDATE);
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", MSG_ERROR);
			e.printStackTrace();
		}
		return "redirect:/products/" + product.getId();
	}

	@DeleteMapping("/{id}")
	public String delete(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		try {
			if (id != null) {
				Product entity = productService.findOne(id);
				productService.delete(entity);
				redirectAttributes.addFlashAttribute("success", MSG_SUCESS_DELETE);
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", MSG_ERROR);
			throw new ServiceException(e.getMessage());
		}
		return "redirect:/products";
	}

	@GetMapping(value = "/new_list")
	public String createList(Model model, @ModelAttribute ProductListForm entity) {
		model.addAttribute("productListForm", entity);
		return "product/form_list";
	}

	@PostMapping(value = "/create_list")
	public String createList(@Valid @ModelAttribute ProductListForm listEntity, BindingResult result,
			RedirectAttributes redirectAttributes) {
		try {
			List<Product> products = listEntity.getProducts();
			for (int i = 0; i < products.size(); i++) {
				Product product = products.get(i);
				productService.save(product);
			}
			redirectAttributes.addFlashAttribute("success", MSG_SUCESS_INSERT);
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", MSG_ERROR);
			e.printStackTrace();
		}
		return "redirect:/products";
	}

}
