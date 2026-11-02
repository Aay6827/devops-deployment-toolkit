-- Application Support Toolkit
-- Stuck Order Investigation
-- Training dataset: fictional e-commerce orders

-- 1. Display all orders
SELECT *
FROM orders
ORDER BY created_at;

-- 2. Identify orders stuck in processing
SELECT
    order_id,
    customer_id,
    order_status,
    payment_status,
    fulfilment_status,
    amount,
    created_at
FROM orders
WHERE order_status = 'PROCESSING'
  AND fulfilment_status IN ('PENDING', 'IN_PROGRESS')
ORDER BY created_at;

-- 3. Identify payment failures
SELECT
    order_id,
    customer_id,
    payment_status,
    amount,
    created_at
FROM orders
WHERE payment_status = 'FAILED';

-- 4. Identify paid orders not yet shipped or delivered
SELECT
    order_id,
    payment_status,
    fulfilment_status,
    amount
FROM orders
WHERE payment_status = 'PAID'
  AND fulfilment_status NOT IN ('SHIPPED', 'DELIVERED');

-- 5. Summarise orders by status
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- 6. Calculate total order value by payment status
SELECT
    payment_status,
    COUNT(*) AS total_orders,
    SUM(amount) AS total_amount
FROM orders
GROUP BY payment_status
ORDER BY total_amount DESC;

-- 7. Identify potentially inconsistent order records
SELECT
    order_id,
    order_status,
    payment_status,
    fulfilment_status
FROM orders
WHERE
    (order_status = 'COMPLETED' AND payment_status <> 'PAID')
    OR
    (order_status = 'PAYMENT_FAILED' AND payment_status <> 'FAILED')
    OR
    (order_status = 'CANCELLED' AND payment_status NOT IN ('REFUNDED', 'FAILED'));