SELECT
  mdf.date,
  SUM(CASE WHEN mad.paying_customer = 'no' THEN mdf.downloads ELSE 0 END) as non_paying,
  SUM(CASE WHEN mad.paying_customer = 'yes' THEN mdf.downloads ELSE 0 END) as paying
FROM
  ms_user_dimension mud
  INNER JOIN ms_acc_dimension mad ON mud.acc_id = mad.acc_id
  INNER JOIN ms_download_facts mdf ON mud.user_id = mdf.user_id
GROUP BY
  mdf.date
HAVING non_paying>paying
ORDER BY
  mdf.date ASC;
