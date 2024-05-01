awk -F, 'NR > 1 {
        gsub(/"/, "", $2);
	    gsub(/"/, "", $8);
	        gsub(/"/, "", $11);
		    
		    age = $2 + 0; 
		        purchase_amount = $9 + 0;  
			    promotion_used = $11 + 0; 

				    if (age <= 21) age_group = "Below 21";
					        else if (age >= 22 && age <= 35) age_group = "22 to 35";
							    else age_group = "Above 35";
									    key = age_group SUBSEP promotion_used;
										    sum_amount[key] += purchase_amount;
										        count[key]++;

										} 
										END {
										        for (key in sum_amount) {
												        split(key, indices, SUBSEP);
													age_group = indices[1];
													        promotion_used = indices[2] ? "Yes" : "No";
														        avg_amount = count[key] ? sum_amount[key] / count[key] : 0;
															        print age_group, promotion_used, avg_amount;
																    }
															    }' customer_data.csv > age_promotion_purchaseFreq.csv
