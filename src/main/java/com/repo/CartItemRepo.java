package com.repo;

import com.entity.CartItem;
import org.springframework.data.repository.CrudRepository;

public interface CartItemRepo extends CrudRepository<CartItem, Long> {
}
