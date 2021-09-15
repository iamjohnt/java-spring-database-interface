package com.dbservice;

import com.entity.Cart;
import com.entity.CartItem;
import com.entity.Customer;
import com.entity.Product;
import com.repo.CartItemRepo;
import com.repo.CartRepo;
import com.repo.CustomerRepo;
import com.repo.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;

import javax.swing.text.html.Option;
import javax.transaction.Transactional;
import java.util.Optional;

/* Holds all the needed services to access the Database, using Spring Data JPA */
public class SpringDbService {

    @Autowired CustomerRepo custRepo;
    @Autowired CartRepo cartRepo;
    @Autowired CartItemRepo cartItemRepo;
    @Autowired ProductRepo prodRepo;

    @Transactional
    public Customer getCustomer(Long id) {
        Optional<Customer> cust = custRepo.findById(id);
        if (cust.isPresent()) {
            return cust.get();
        } else {
            return null;
        }
    }

    @Transactional
    public void addCustomer(Customer customer) {
        custRepo.save(customer);
    }

    @Transactional
    public void updateCustomerName(Customer customer, String newName) {
        customer.setFirstName(newName);
        custRepo.save(customer);
    }

    @Transactional
    public void deleteCustomer(Customer customer) {
        custRepo.delete(customer);
    }

    @Transactional
    public void deleteCustomerById(Long id) {
        custRepo.deleteById(id);
    }

    @Transactional
    public void addCart(Cart cart) {
        cartRepo.save(cart);
    }

    @Transactional
    public void addCartItem(CartItem cartItem) {
        cartItemRepo.save(cartItem);
    }

    @Transactional
    public void addProduct(Product product) {
        prodRepo.save(product);
    }

    @Transactional
    public void printCustomerCartInfo(Long id) {
        Customer customer;
        Optional<Customer> possibleCust = custRepo.findById(id);
        if (possibleCust.isPresent()) {
            customer = possibleCust.get();
        } else {
            customer = null;
        }
        System.out.println("Customer name: " + customer.getFirstName() + " " + customer.getLastName());
        System.out.println("Product Name " + customer.getCarts().get(0).getCartItems().get(0).getProduct().getProductName());
        System.out.println("Quantity Ordered " + customer.getCarts().get(0).getCartItems().get(0).getQuantityOrdered());
    }
}
