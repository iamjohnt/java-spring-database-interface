package com.repo;

import com.entity.OrderItem;
import org.springframework.data.repository.CrudRepository;

public interface OrderItemRepo extends CrudRepository<OrderItem, Long> {
}
