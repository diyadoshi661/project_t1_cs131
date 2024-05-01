awk -F, 'NR > 1 {
    region = $6;  # Assuming $6 is the region column
        loyalty = $7;  # Assuming $7 is the loyalty_status column
	    purchase = $9;  # Assuming $9 is the purchase_amount column

	        # Summing purchase amounts for each region
		    region_purchase_sum[region] += purchase;
		        region_purchase_count[region]++;

			    # Counting loyalty status occurrences for each region
			        loyalty_status_count[region, loyalty]++;
			}
			END {
			    print "Region,Loyalty Status,Count,Average Purchase Amount";
			        for (region in region_purchase_sum) {
					        average_purchase = region_purchase_count[region] ? region_purchase_sum[region] / region_purchase_count[region] : 0;
						        for (loyalty in loyalty_status_count) {
								            split(loyalty, parts, SUBSEP);
									                loyalty_region = parts[1];
											            if (loyalty_region == region) {
													                    print region, parts[2], loyalty_status_count[loyalty], average_purchase;
															                }
																	        }
																		    }
																	    }' customer_data.csv > region_loyalty_metrics.csv
