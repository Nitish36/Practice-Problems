SELECT COUNT(shipment_id),DATE_FORMAT(shipment_date,"%Y-%m") as date_ym
FROM amazon_shipment
GROUP BY date_ym
