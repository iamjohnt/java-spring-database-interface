drop database if exists hobbystore; -- deletes database, if it already exists
create database hobbystore; -- create database
use hobbystore;	-- says i want to use the database
create table customer(customer_id int,
						firstName varchar(20),
                        lastName varchar(20), -- variable length string of chars, number in parenthesis is maximum
                        phoneNumber char(10), -- fixed length string of chars
                        email varchar(40),
                        street varchar(40),
                        city varchar(20),
                        state char(2),
                        zipcode char(5),
                        dateAdded date,
                        primary key(customer_id));	-- sets primary key
insert into customer values(1, 'Mal', 'Maciejak', '2608977273', 'mmaciejak0@multiply.com', '2898 Fieldstone Lane', 'Fort Wayne', 'IN', '46805', '2017-05-30');
insert into customer values(2, 'Kary', 'Lillico', '5714349411', 'klillico1@phoca.cz', '0786 Dunning Trail', 'Dulles', 'VA', '20189', '2013-07-03');
insert into customer values(3, 'Sheena', 'Brammar', '4174960065', 'sbrammar2@sphinn.com', '3 Crest Line Plaza', 'Springfield', 'MO', '65805', '2004-11-17');
insert into customer values(4, 'Frankie', 'Nelthropp', '3041683708', 'fnelthropp3@netlog.com', '868 Memorial Plaza', 'Charleston', 'WV', '25305', '2016-06-12');
insert into customer values(5, 'Aurelea', 'Champ', '2037392112', 'achamp4@ed.gov', '8 Shopko Place', 'Bridgeport', 'CT', '06673', '2012-01-09');
insert into customer values(6, 'Alonzo', 'Comusso', '8596670600', 'acomusso5@qq.com', '27905 Cody Center', 'Lexington', 'KY', '40546', '2006-03-22');
insert into customer values(7, 'Walsh', 'Lisciardelli', '9122209758', 'wlisciardelli6@sciencedirect.com', '12260 Red Cloud Hill', 'Macon', 'GA', '31217', '2021-05-18');
insert into customer values(8, 'Alli', 'Trappe', '4101084272', 'atrappe7@un.org', '4 Roth Trail', 'Baltimore', 'MD', '21203', '2005-07-02');
insert into customer values(9, 'Suzie', 'Haslock', '9153918278', 'shaslock8@pbs.org', '06 Parkside Court', 'El Paso', 'TX', '88541', '2013-11-13');
insert into customer values(10, 'Dre', 'Micah', '3026902346', 'dmicah9@so-net.ne.jp', '4 Grayhawk Hill', 'Wilmington', 'DE', '19805', '2021-04-08');
insert into customer values(11, 'Desmund', 'Bazeley', '6015342397', 'dbazeleya@multiply.com', '991 Oxford Parkway', 'Jackson', 'MS', '39216', '2000-01-14');
insert into customer values(12, 'Tailor', 'Rymell', '8651349345', 'trymellb@moonfruit.com', '8 Lien Junction', 'Knoxville', 'TN', '37939', '2001-03-05');
insert into customer values(13, 'Mario', 'Denington', '5041780497', 'mdeningtonc@independent.co.uk', '1700 Maywood Circle', 'New Orleans', 'LA', '70160', '2002-07-15');
insert into customer values(14, 'Federica', 'Ollarenshaw', '7547233160', 'follarenshawd@parallels.com', '7 Meadow Vale Lane', 'Pompano Beach', 'FL', '33075', '2012-02-25');
insert into customer values(15, 'Atlante', 'Garley', '4152719032', 'agarleye@amazon.com', '43462 Hallows Road', 'San Francisco', 'CA', '94137', '2012-03-26');
insert into customer values(16, 'Alwyn', 'Ducrow', '2186995134', 'aducrowf@tamu.edu', '5968 Nova Alley', 'Duluth', 'MN', '55805', '2011-08-20');
insert into customer values(17, 'Jule', 'Savil', '2291433869', 'jsavilg@howstuffworks.com', '89 Derek Crossing', 'Valdosta', 'GA', '31605', '2004-10-18');
insert into customer values(18, 'Lacy', 'Hallworth', '2031633607', 'lhallworthh@freewebs.com', '83 Village Green Terrace', 'New Haven', 'CT', '06505', '2012-07-21');
insert into customer values(19, 'Nikolaus', 'Orme', '7657432621', 'normei@cam.ac.uk', '01 Harbort Alley', 'Crawfordsville', 'IN', '47937', '1998-12-08');
insert into customer values(20, 'Verene', 'Le Noir', '7207937198', 'vlenoirj@va.gov', '9 Green Ridge Court', 'Boulder', 'CO', '80305', '2001-03-11');
insert into customer values(21, "John", "Tran", "6172659063", "nohjnart@gmail.com", "20 Washington Streeet", "Boston", "MA", "01801", "2000-01-01");
insert into customer values(22, "Sonita", "Rin", "194628447", "sonitarin@gmail.com", "51 New Park Street", "Lynn", "MA", "01905", "2005-07-02");
insert into customer values(23, "Mupp", "Bug", "1234567890", "muppbug@gmail.com", "841 Western Ave", "Lynn", "MA", "01901", "2010-09-16");
create table orders(order_id int,
					customer_id int,
                    datePlaced date,
                    dateShipped date,
                    orderStatus varChar(10),
                    total decimal(4,2),
                    primary key(order_id),
                    foreign key(customer_id) references Customer(customer_id));	-- sets foreign key
create table promotion(promo_id int,
						promoDescription varchar(50),
                        discountAmount decimal(4,2),
                        dateEffective date,
                        dateEnd date,
                        primary key(promo_id));
insert into promotion values(0, "No Sale", 0.00, "1998-01-01", "2999-12-31");
insert into promotion values(1, "10% Off", 0.10, "2021-08-01", "2021-08-08");
insert into promotion values(2, "20% Off", 0.20, "2021-08-01", "2021-08-08");
insert into promotion values(3, "30% Off", 0.30, null, null);
insert into promotion values(4, "40% Off", 0.40, null, null);
insert into promotion values(5, "50% Off", 0.50, "2021-07-01", "2021-08-31");
insert into promotion values(6, "60% Off", 0.60, null, null);
insert into promotion values(7, "70% Off", 0.70, null, null);
insert into promotion values(8, "80% Off", 0.80, null, null);
insert into promotion values(9, "90% Off", 0.90, null, null);
create table category(category_id int,
						categoryDescription varchar(50),
                        primary key(category_id));
insert into category values(1, "Model Kits");
insert into category values(2, "Figures");
insert into category values(3, "Paints");
insert into category values(4, "Tools and Accessories");
create table vendor(vendor_id int,
						vendorName varchar(20),
                        phoneNumber char(10),
                        email varchar(40),
                        street varchar(20),
                        city varchar(20),
                        state char(2),
                        zipcode char(5),
                        dateAdded date,
                        primary key(vendor_id));
insert into vendor values(1, "Bluefin Brands", "8779806221", "sales@bluefincorp.com", "3321 La Palma Avenue", "Anaheim", "CA", "92806", "1998-05-15");
insert into vendor values(2, "Kaiba Corporation", "6106234864", "seto@kaibacorp.com", "2082 Jody Road", "Lansdowne", "PA", "19050", "1998-05-27");
insert into vendor values(3, "Bepsi Distibutors", "9149360352", "fulfillments@bepsidistributors.com", "2232 Ward Road", "Port Chester", "NY", "10573", "1998-06-18");
insert into vendor values(4, "Sbubby Brands", "5866843621", "bob@sbubby.com", "4566 Ritter Avenue", "Deerfield Beach", "FL", "33442", "1998-06-25");
insert into vendor values(5, "Bone Apple Tea", "9789135607", "distrbutions@boneappletea.com", "3629 Russell Street", "Boston", "MA", "02110", "1998-07-17");

create table product(product_id int,
						category_id int,
                        promo_id int,
                        vendor_id int,
                        productName varchar(40),
                        productDescription varchar(200),
                        basePrice decimal(10,2),
                        amountInStock int,
						dateAdded date,
                        dateModified date,
                        primary key(product_id),
                        foreign key(category_id) references category(category_id),
                        foreign key(promo_id) references promotion(promo_id),
                        foreign key(vendor_id) references vendor(vendor_id));
                        
insert into product values(1, 3, 0, 3, "Mr. Hobby Paint Thinner", "Paint thinner", 9.99, 88, "2001-03-10", "2021-07-29");
insert into product values(2, 3, 0, 3, "Mr. Hobby Topcoat Semi Gloss", "Semi gloss top coat spray", 6.99, 72, "2001-03-08", "2021-07-28");
insert into product values(3, 3, 0, 3, "Mr. Hobby Metal Primer", "Metal primer spray", 7.99, 109, "2001-03-10", "2021-07-27");
insert into product values(4, 3, 2, 3, "Tamiya Panel Line Accent Color Gray", "Panel line paint", 7.99, 56, "2001-03-10", "2021-07-27");
insert into product values(5, 3, 2, 3, "Tamiya Panel Line Accent Color Brown", "Panel line paint", 7.99, 43, "2001-03-10", "21-07-28");
insert into product values(6, 3, 0, 3, "Mr. Hobby Paint Remover", "Paint Remover", 3.99, 63, "2001-03-10", "2021-07-29");
insert into product values(7, 3, 0, 3, "Mr. Paint Tray", "Paint tray", 2.99, 214, "2001-03-01", "2021-07-29");
insert into product values(8, 4, 0, 2, "Mr. Basic Nipper", "Nipper", 12.99, 201, "2001-03-10", "2021-07-29");
insert into product values(9, 4, 3, 2, "Premium Tweezers", "Tweezers", 7.99, 247, "2001-03-10", "2021-07-29");
insert into product values(10, 4, 0, 2, "GodHand Pliers", "Pliers", 27.99, 153, "2005-12-02", "2021-07-29");
insert into product values(11, 4, 0, 4, "Tamiya Masking Tape", "12mm Masking tape", 8.99, 189, "2001-03-10", "2021-07-29");
insert into product values(12, 4, 0, 4, "10 Pack Pipettes", "Pipettes", 2.99, 203, "2001-03-10", "2021-07-29");
insert into product values(13, 1, 2, 1, "Gundam Exia HG", "Gundam 00 HG 1/144 Model Kit", 15.99, 6, "2017-04-24", "2021-07-28");
insert into product values(14, 1, 1, 1, "Aegis Gundam MG", "Gundam SEED MG 1/100 Model Kit", 57.99, 2, "2017-05-01", "2021-07-13");
insert into product values(15, 1, 1, 1, "Gundam Kyrios MG 1/100", "Gundam 00 MG 1/100 Model Kit", 60.99, 5, "2017-05-20", "2021-07-29");
insert into product values(16, 1, 0, 1, "Wing Gundam Zero EW Ver.Ka MG", "Gundam Wing: Endless Waltz MG 1/100 Model Kit", 65.99, 7, "2017-08-10", "2021-07-29");
insert into product values(17, 1, 0, 1, "Freedom Gundam (Ver 2.0) MG", "Gundam SEED MG 1/100 Model Kit", 54.99, 4, "2018-01-10", "2021-07-29");
insert into product values(18, 1, 1, 1, "Transient Gundam HG", "Gundam Build Fighters Try HG 1/144 Model Kit", 22.99, 4, "2019-02-10", "2021-07-29");
insert into product values(19, 1, 0, 1, "Jupitive Gundam HGBD 1/144", "Gundam Build Divers HG 1/144 Model Kit", 24.99, 5, "2020-08-11", "2021-07-20");
insert into product values(20, 2, 1, 5, "Goku Figure", "Dragon Ball Z Figure", 79.99, 50, "2020-04-10", "2021-07-29");
insert into product values(21, 2, 1, 5, "Mario Figure", "Super Mario Sunshine Figure", 44.99, 109, "2001-03-10", "2021-07-27");



create table order_items(order_id int,
						product_id int,
                        quantityOrdered int,
                        foreign key(order_id) references orders(order_id),
                        foreign key(product_id) references product(product_id));
insert into orders values(1, 1, "2021-03-10", "2021-03-13", "In Transit", 45.69);
insert into order_items values(1, 18, 1);
insert into order_items values(1, 19, 1);
insert into orders values(2, 2, "2016-04-06", "2016-04-08", "Shipped", 55.98);
insert into order_items values(2, 10, 2);
insert into orders values(3, 1, "2021-07-01", "2021-07-03", "Complete", 68.97);
insert into order_items values(3, 17, 1);
insert into order_items values(3, 2, 2);
insert into orders values(4, 3, "2000-01-10", "2000-01-13", "Shipped", 21.77);
insert into order_items values(4, 13, 1);
insert into order_items values(4, 7, 3);
insert into orders values(5, 4, "2021-02-01", "2021-02-02", "Cancelled", 71.59);
insert into order_items values(5, 9, 1);
insert into order_items values(5, 16, 1);
insert into orders values(6, 10, "2021-08-07", null, "Received", 20.70);
insert into order_items values(6, 18, 1);
insert into orders values(7, 17, "2021-08-06", null, "Received", 40.50);
insert into order_items values(7, 21, 1);

create table cart(cart_id int,
					customer_id int,
                    primary key(cart_id),
                    foreign key(customer_id) references Customer(customer_id));
                    
create table cart_items(cart_id int,
						product_id int,
                        quantityOrdered int,
                        foreign key(cart_id) references cart(cart_id),
                        foreign key(product_id) references product(product_id));
                        
INSERT INTO cart VALUES (1, 21);
INSERT INTO cart_items VALUES (1, 17, 2);
INSERT INTO cart_items VALUES (1, 15, 2);

-- create procedure to add product to cart, and subtract from the product stock
DELIMITER //
CREATE PROCEDURE `add_product_to_cart`(IN cart_id INT, product_id INT, quantity INT)
	BEGIN
			DECLARE EXIT HANDLER FOR SQLEXCEPTION 
			BEGIN
				GET DIAGNOSTICS CONDITION 1
				@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
				SELECT @p1 as RETURNED_SQLSTATE  , @p2 as MESSAGE_TEXT;
				ROLLBACK;
			END;
            
			START TRANSACTION;
				-- add product id and quantity to cart table
				INSERT INTO cart_items (cart_items.cart_id, cart_items.product_id, cart_items.quantityOrdered) 
										VALUES (cart_id, product_id, quantity);
				
				-- then subtract quantity from the product table
				UPDATE product SET product.amountInStock = product.amountInStock - quantity
				WHERE product.product_id = product_id;
			COMMIT;
	END // 
DELIMITER ;

-- create trigger to message product thing
DELIMITER //
CREATE TRIGGER stock_check BEFORE UPDATE ON product FOR EACH ROW 
	IF NEW.amountInStock > 0 
		THEN SET NEW.amountInStock = NEW.amountInStock;
	ELSE signal sqlstate '45000' set message_text = "ERROR: p < cart's product quantity";
	END IF; // 
DELIMITER ;