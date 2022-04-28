package com.model2.mvc.service.product;

import java.util.HashMap;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

//==> ��ǰ�������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface ProductService {

	//��ǰ���
	public void addProduct(Product product) throws Exception;
	
	//��ǰ�󼼺���
	public Product getProduct(int prodNo) throws Exception;
	
	//��ǰ���
	public Map<String, Object> getProductList(Search search) throws Exception;
	
	//��ǰ����
	public void updateProduct(Product product) throws Exception;
	
}
