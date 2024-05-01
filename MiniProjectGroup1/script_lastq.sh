awk -F, 'NR > 1 {
    region = $6;  
        loyalty = $7;  
	    purchase = $9; 
		    region_purchase_sum[region] += purchase;
		        region_purchase_count[region]++;
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
