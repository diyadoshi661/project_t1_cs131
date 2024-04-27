awk -F, 'NR > 1 {
    # Assuming $8 is the purchase frequency and $9 is the purchase amount
        gsub(/"/, "", $8);  # Remove quotes if present
	    gsub(/"/, "", $9);  # Remove quotes if present and convert to numeric
	        purchase_amount = $9 + 0;  # Convert to numeric to ensure proper addition
		    
		    # Accumulate purchase amounts based on purchase frequency
		        if ($8 == "rare") {
				        total_rare += purchase_amount;
					    } else if ($8 == "occasional") {
					            total_occasional += purchase_amount;
						        } else if ($8 == "frequent") {
							        total_frequent += purchase_amount;
								    }
							    }
							    END {
							        print "Total Purchase Amount for Rare: " total_rare;
								    print "Total Purchase Amount for Occasional: " total_occasional;
								        print "Total Purchase Amount for Frequent: " total_frequent;
								}' customer_data.csv > freq_income.csv
