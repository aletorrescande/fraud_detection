CREATE TABLE "card_holder" 
(
    "id" int PRIMARY KEY,
    "name" varchar(20) NOT NULL);

CREATE TABLE "credit_card" (
    "card" varchar(20) PRIMARY KEY,
    "cardholder_id" int NOT NULL,
	FOREIGN KEY (cardholder_id) REFERENCES card_holder(id)
);

-- Table documentation comment 1 (try the PDF/RTF export)
CREATE TABLE "merchant_category" (
    "id" int PRIMARY KEY,
    "name" varchar(20)   NOT NULL
     );

-- Table documentation comment 2
CREATE TABLE "merchant" (
    "id" int PRIMARY KEY,
    "name" VARCHAR(50)   NOT NULL,
    "id_merchant_category" int  NOT NULL,
    FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);


CREATE TABLE "transaction" (
    "id" int PRIMARY KEY,
    "date" TIMESTAMP  NOT NULL,
    "amount" int  NOT NULL,
    "card" varchar(20)  NOT NULL,
    "id_merchant" int  NOT NULL,
    FOREIGN KEY (card) REFERENCES credit_card(card),
	FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);
   