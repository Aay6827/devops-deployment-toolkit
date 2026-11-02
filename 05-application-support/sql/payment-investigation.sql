-- Application Support Toolkit
-- Payment Investigation
-- Fictional e-commerce training dataset

-- 1. Find all failed payments
SELECT
    order_id,
    customer_id,
    payment_status,
    amount,
    created_at
FROM orders
WHERE payment_status = 'FAILED'
ORDER BY created_at;

-- 2. Find payments still pending
SELECT
    order_id,
    customer_id,
    amount,
    created_at
FROM orders
WHERE payment_status = 'PENDING'
ORDER BY created_at;

-- 3. Find orders paid but not yet fulfilled
SELECT
    order_id,
    order_status,
    payment_status,
    fulfilment_status,
    amount
FROM orders
WHERE payment_status = 'PAID'
  AND fulfilment_status NOT IN ('SHIPPED', 'DELIVERED');

-- 4. Summarise payment outcomes
SELECT
    payment_status,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount
FROM orders
GROUP BY payment_status
ORDER BY transaction_count DESC;

-- 5. Calculate total value of failed payments
SELECT
    COUNT(*) AS failed_transaction_count,
    SUM(amount) AS failed_payment_value
FROM orders
WHERE payment_status = 'FAILED';

-- 6. Investigate payment and order status mismatches
SELECT
    order_id,
    order_status,
    payment_status,
    fulfilment_status
FROM orders
WHERE
    (payment_status = 'FAILED' AND fulfilment_status <> 'NOT_STARTED')
    OR
    (payment_status = 'PENDING' AND fulfilment_status IN ('SHIPPED', 'DELIVERED'));

-- 7. Display recent payment-related records
SELECT *
FROM orders
ORDER BY created_at DESC
LIMIT 10;