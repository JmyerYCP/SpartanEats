package edu.ycp.cs320.spartaneats.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ycp.cs320.spartaneats.model.CreateOrderModel;
import edu.ycp.cs320.spartaneats.model.Extras;
import edu.ycp.cs320.spartaneats.model.Inventory;
import edu.ycp.cs320.spartaneats.model.Item;
import edu.ycp.cs320.spartaneats.model.Order;

public class AddExtrasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Create Extras Servlet: doGet");
		
		HttpSession session = req.getSession(false);    // fetch the session and handle 
        
		
	    if (session == null) {    // no session exists, redirect to error page with error message
	    	resp.sendRedirect(req.getContextPath()+"/login");
	        } 
	    
	    req.getRequestDispatcher("/_view/addextras.jsp").forward(req, resp);
		
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Create Extras Servlet: doPost");
		HttpSession session = req.getSession(false); 

		// holds the error message text, if there is any
		String errorMessage = null;

		
		//new AccountControllerPopulate(controller);
		Order order = (Order) session.getAttribute("order");
		Inventory inventory = (Inventory) session.getAttribute("inventory");
		CreateOrderModel model = new CreateOrderModel();
		model.setOrder(order);
		model.setInventory(inventory);
		
		
		Extras add = null;
		add = inventory.getExtras(req.getParameter("addextras"));
		if (add != null) {
			System.out.println("add extras " + add);
			order.addExtra(add);
			System.out.println("adding " + add);
			req.getRequestDispatcher("/_view/vieworder.jsp").forward(req, resp);
		}
		
		
		
		//errorMessage = "hello";
		
		//model.setError(errorMessage);
		
		req.setAttribute("model", model);
		req.setAttribute("inventory", inventory);
		req.setAttribute("order", order);
		session.setAttribute("order", order);
		session.setAttribute("inventory", inventory);
		
		req.getRequestDispatcher("/_view/vieworder.jsp").forward(req, resp);
		
	}

	
}
