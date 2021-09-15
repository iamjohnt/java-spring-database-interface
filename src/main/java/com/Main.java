package com;

import com.dbservice.SpringDbService;
import com.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import javax.annotation.PostConstruct;


/* Here we can run the spring app, and demonstrate operations on the database */
@SpringBootApplication
@ComponentScan
@EnableJpaRepositories
public class Main {

    @Autowired
    private SpringDbService springDbService;

    public static void main(String[] args) {
        Main demo = new Main();
        SpringApplication.run(Main.class, args);
    }

    @PostConstruct
    public void demonstrateAddingToDatabaseUsingSpringDataJPA() {

        // create the user Billy and persist to DB
        Customer customer = new Customer();
        customer.setFirstName("Fakey");
        customer.setLastName("McFakerson");
        customer.setCustomer_id(3L);
        springDbService.addCustomer(customer);

        // create cart and persist to DB
        Cart cart = new Cart();
        cart.setCartId(4);
        cart.setCustomer(customer);
        springDbService.addCart(cart);

        // create product and persist to DB
        Product product = new Product();
        product.setProduct_id(1L);
        product.setProductName("Model Kit");
        springDbService.addProduct(product);

        // create cartitem and persist to DB
        CartItem cartItem = new CartItem();
        cartItem.setQuantityOrdered(1234);
        cartItem.setCart_item_id(40L);
        cartItem.setCart(cart);
        cartItem.setProduct(product);
        springDbService.addCartItem(cartItem);

        // verify that it was all persisted, by printing everything
        springDbService.printCustomerCartInfo(3L);

        // cascade delete Billy, and all his info we just added
        springDbService.deleteCustomerById(3L);
    }

}
