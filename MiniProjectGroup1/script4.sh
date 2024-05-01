awk -F, 'NR > 1 {
        gsub(/"/, "", $8);  
	    gsub(/"/, "", $9); 
	        purchase_amount = $9 + 0;  
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
