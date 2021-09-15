package com.dbservice;

import com.entity.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* old legacy database operations, that used pure JPA, not Spring */
public class JpaDbService {

    private Customer getCustomer(Long id) {
        Customer customer;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myApp");
        EntityManager em = emf.createEntityManager();
        customer = em.find(Customer.class, id);
        em.close();
        emf.close();
        Set<Integer> set = new HashSet<>();
        return customer;
    }

    private Orders getCustomerOrder(Long custId, Long orderId) {
        Orders orders;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myApp");
        EntityManager em = emf.createEntityManager();
        Customer customer = em.find(Customer.class, custId);
        List<Orders> o = customer.getOrders();
        orders = o.stream()
                .filter(orders1 -> orders1.getOrder_id() == orderId)
                .findAny()
                .orElse(null);
        em.close();
        emf.close();
        return orders;
    }

    /* instantiates objects from classes that are annotated as JPA entities,
and persists them to database. The result is a database with some dummy data to play with */
    private void createDummyTablesAndData() {
        // create entities
        Orders order = new Orders();
        Customer cust = new Customer();
        Cart cart = new Cart();
        CartItem cartItem = new CartItem();
        OrderItem orderItem = new OrderItem();
        Product product = new Product();
        Category category = new Category();
        Promotion promotion = new Promotion();
        Vendor vendor = new Vendor();

        // setup entities dummy info
        vendor.setVendorName("USA Gundam Store");

        promotion.setPromoDescrioption("9999 percent off!");

        order.setOrderStatus("shipped");
        order.setTotal(1000);

        cust.setFirstName("John");
        cust.setLastName("Poopson");
        cust.setCity("Poopopolis");

        cartItem.setQuantityOrdered(1234);

        orderItem.setQuantityOrdered(4321);

        product.setProductName("gundam");

        category.setCategoryDescription("really fun model kits!");

        // bind entities together using their setter methods
        vendor.setProducts(List.of(product));
        product.setVendor(vendor);

        promotion.setProducts(List.of(product));
        product.setPromotion(promotion);

        product.setCategory(category);
        category.setProduct(product);

        product.setCartItem(cartItem);
        product.setOrderItem(orderItem);
        cartItem.setProduct(product);
        orderItem.setProduct(product);

        cartItem.setCart(cart);
        cart.setCartItems(List.of(cartItem));

        orderItem.setOrder(order);
        order.setOrderItems(List.of(orderItem));

        order.setCustomer(cust);
        cart.setCustomer(cust);

        cust.setOrders(List.of(order));
        cust.setCarts(List.of(cart));

        // creates an entity manager, begins a transaction, then persists the apporpriate entities
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("myApp");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.persist(vendor);
        entityManager.persist(promotion);
        entityManager.persist(category);
        entityManager.persist(cust);
        entityManager.persist(product);
        transaction.commit();
        entityManager.close();
        entityManagerFactory.close();
    }
}
