/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import entitie.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author lenovo
 */
public class ProductDao {
     private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
public boolean saveProduct(Product product)
{
boolean f =false;
try{
Session session = this.factory.openSession();
Transaction tx = session.beginTransaction();

session.save(product);

tx.commit();
session.close();
f= true;
}catch(Exception e){
e.printStackTrace();
f= false;
}
         return f;
}


//get All product

public List<Product> getAllProducts()
{

         Session s = this.factory.openSession();
         Query query = s.createQuery("from Product");
         List<Product> list = query.list();
return list;
}
//get all product give category
public List<Product> getAllProductsById(int cid)
{

         Session s = this.factory.openSession();
         Query query = s.createQuery("from Product as p where p.category.categoryId =: id");
query.setParameter("id", cid);
List<Product> list = query.list();
return list;
}

}
