-- Application Support Toolkit
-- Order Status Reconciliation
-- Fictional e-commerce training dataset

-- 1. Compare order, payment, and fulfilment statuses
SELECT
    order_id,
    order_status,
    payment_status,
    fulfilment_status,
    amount
FROM orders
ORDER BY order_id;

-- 2. Completed orders that are not paid
SELECT *
FROM orders
WHERE order_status = 'COMPLETED'
  AND payment_status <> 'PAID';

-- 3. Paid orders with no fulfilment started
SELECT *
FROM orders
WHERE payment_status = 'PAID'
  AND fulfilment_status = 'PENDING';

-- 4. Cancelled orders that may need payment review
SELECT *
FROM orders
WHERE order_status = 'CANCELLED'
  AND payment_status NOT IN ('REFUNDED', 'FAILED');

-- 5. Payment failures with unexpected fulfilment activity
SELECT *
FROM orders
WHERE payment_status = 'FAILED'
  AND fulfilment_status NOT IN ('NOT_STARTED', 'CANCELLED');

-- 6. Overall reconciliation summary
SELECT
    COUNT(*) AS total_orders,
    SUM(CASE WHEN order_status = 'COMPLETED'
              AND payment_status = 'PAID'
              THEN 1 ELSE 0 END) AS completed_and_paid,
    SUM(CASE WHEN payment_status = 'FAILED'
              THEN 1 ELSE 0 END) AS failed_payments,
    SUM(CASE WHEN payment_status = 'PAID'
              AND fulfilment_status = 'PENDING'
              THEN 1 ELSE 0 END) AS paid_but_pending_fulfilment
FROM orders;

-- Investigation only:
-- Review mismatches before taking corrective action.
-- Never manually change order or payment states without
-- approved procedures and appropriate authorisation.