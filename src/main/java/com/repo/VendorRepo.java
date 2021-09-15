package com.repo;

import com.entity.Vendor;
import org.springframework.data.repository.CrudRepository;

public interface VendorRepo extends CrudRepository<Vendor, Long> {
}
