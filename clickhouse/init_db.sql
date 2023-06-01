CREATE TABLE metrics
(
    metrics_id Int32,
    length     Decimal32(2),
    width      Decimal32(2),
    height     Decimal32(2)
) Engine = MergeTree
ORDER BY (metrics_id);

CREATE TABLE metrics_queue
(
    metrics_id Int32,
    length     Decimal32(2),
    width      Decimal32(2),
    height     Decimal32(2)
) ENGINE=Kafka('broker:29092', 'metrics', 'metrics_consumer_group1', 'TabSeparated');

CREATE
MATERIALIZED VIEW metrics_queue_mv TO metrics AS
SELECT metrics_id, length, width, height
FROM metrics_queue
    SETTINGS
    stream_like_engine_allow_direct_select = 1;