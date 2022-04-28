package com.model2.mvc.service.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;

//==> ��ǰ�������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface ProductDao {

	// INSERT
	public void addProduct(Product product) throws Exception ;

	// SELECT ONE
	public Product getProduct(int prodNo) throws Exception ;

	// SELECT LIST
	public List<Product> getProductList(Search search) throws Exception ;

	// UPDATE
	public void updateProduct(Product product) throws Exception ;
		
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
	
}//ProductDaO