package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserService;


//==> 惑前包府 RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 备泅 臼澜
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET )
	public Product getProduct( @PathVariable int prodNo ) throws Exception{
		
		System.out.println("/product/json/getProduct : GET");
		
		//Business Logic
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping( value="json/readProduct/{prodNo}", method=RequestMethod.GET )
	public Product readProduct( @PathVariable int prodNo ) throws Exception{
		
		System.out.println("/product/json/readProduct : GET");
		
		//Business Logic
		return productService.getProduct(prodNo);
	}

	@RequestMapping( value="json/addProduct", method=RequestMethod.POST )
	public Product addProduct(@RequestBody Product product) throws Exception{
		System.out.println("/product/json/addProduct : POST");
		
		//Business Logic
		System.out.println("::"+product);
		productService.addProduct(product);
		return product;
	}
	
	@RequestMapping( value="json/updateProduct", method=RequestMethod.POST )
	public Product updateProduct(@RequestBody Product product) throws Exception{
		System.out.println("/product/json/updateProduct : POST");
		
		//Business Logic
		System.out.println("::"+product);
		productService.updateProduct(product);
		return product;
	}
	
	@RequestMapping( value="json/getProductList")
	public Map getProductList(@RequestBody Search search) throws Exception {
		
		System.out.println("/product/getProductList : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 荐青
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println(resultPage);
		
		return map;
	}
	
	
}