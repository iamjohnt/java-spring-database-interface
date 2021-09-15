package com.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "promotion")
public class Promotion {

    @Id
    @GeneratedValue
    private Long promo_id;

    @OneToMany(mappedBy = "promotion", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Product> products;

    private String promoDescrioption;
    private Double discountAmount;

    @Temporal(TemporalType.DATE)
    private Date dateEffective;

    @Temporal(TemporalType.DATE)
    private Date dateEnd;

    public Long getPromo_id() {
        return promo_id;
    }

    public void setPromo_id(Long promo_id) {
        this.promo_id = promo_id;
    }

    public String getPromoDescrioption() {
        return promoDescrioption;
    }

    public void setPromoDescrioption(String promoDescrioption) {
        this.promoDescrioption = promoDescrioption;
    }

    public Double getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(Double discountAmount) {
        this.discountAmount = discountAmount;
    }

    public Date getDateEffective() {
        return dateEffective;
    }

    public void setDateEffective(Date dateEffective) {
        this.dateEffective = dateEffective;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
}
