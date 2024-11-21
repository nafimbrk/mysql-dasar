CREATE TABLE wallet (
    id INT NOT NULL AUTO_INCREMENT,
    id_customer INT NOT NULL,
    balance INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY fk_id_customer_unique (id_custoner),
    CONSTRAINT fk_wallet_customer FOREIGN KEY (id_customer) REFERENCES customers (id)
) ENGINE = InnoDB;

insert into
    wallet(id_customer)
VALUES
    (1);

select
    customers.email,
    wallet.balance
from
    wallet
    join customers on (wallet.id_customer = customers.id);