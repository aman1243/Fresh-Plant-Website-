/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package AllServlet;

import Dao.CategoryDao;
import Dao.ProductDao;
import entitie.Category;
import entitie.Product;
import helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author lenovo
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
  String op=request.getParameter("operation");
if(op.trim().equals("addcategory"))
{
String title =request.getParameter("catTitle");
String description = request.getParameter("catDescription");
Category category =  new Category();
category.setCategoryTittle(title);
category.setCategoryDescription(description);

CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
int catId =categoryDao.saveCategory(category);
out.println("Cateogry save");
HttpSession httpSession=request.getSession();
httpSession.setAttribute("message", "Category added Successfully :");
response.sendRedirect("admin.jsp");
return;
}
else if(op.trim().equals("addproduct"))
{
String pName =request.getParameter("pName");
String pDesc =request.getParameter("pDesc");
//String pPhoto =request.getParameter("pPhoto");
int pPrice =Integer.parseInt(request.getParameter("pPrice"));
int pDiscount  =Integer.parseInt(request.getParameter("pDiscount"));
int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
int catId = Integer.parseInt(request.getParameter("catId"));
Part part=request.getPart("pPhoto");

Product p = new Product();
p.setpName(pName);
p.setpDesc(pDesc);
p.setpPrice(pPrice);
p.setpDiscount(pDiscount);
p.setpQuantity(pQuantity);
p.setpPhoto(part.getSubmittedFileName());


//get category by id

CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory());
Category category = cdoa.getCategoryById(catId);
p.setCategory(category);
//

ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
pdao.saveProduct(p);

//find out path to upload photo

String path = request.getRealPath("img") +File.separator+ "products" +File.separator+part.getSubmittedFileName();
System.out.println(path);
try{

FileOutputStream fos= new FileOutputStream(path);
InputStream is =part.getInputStream();

byte[]data= new byte[is.available()];
is.read(data);

fos.write(data);
fos.close();
}catch(Exception e)
{
e.printStackTrace();
}
out.println("product save done");
HttpSession httpSession=request.getSession();
httpSession.setAttribute("message", "Product is added Successfully :");
response.sendRedirect("admin.jsp");
return;
}

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
