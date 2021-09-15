package com.repo;

import com.entity.Promotion;
import org.springframework.data.repository.CrudRepository;

public interface PromotionRepo extends CrudRepository<Promotion, Long> {
}
