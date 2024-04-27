awk -F, 'NR > 1 {
    # Remove potential quotes and trim spaces
        gsub(/"/, "", $2);
	    gsub(/"/, "", $8);
	        gsub(/"/, "", $11);
		    
		    age = $2 + 0;  # Convert to numeric to ensure correct comparison
		        purchase_amount = $9 + 0;  # Assuming $9 is purchase amount
			    promotion_used = $11 + 0;  # Assuming $11 is promotion usage (0 or 1)

			        # Classifying age into groups
				    if (age <= 21) age_group = "Below 21";
					        else if (age >= 22 && age <= 35) age_group = "22 to 35";
							    else age_group = "Above 35";

								        # Forming the key with age group and promotion usage
									    key = age_group SUBSEP promotion_used;

									        # Summing up purchase amounts and counting entries
										    sum_amount[key] += purchase_amount;
										        count[key]++;

										} 
										END {
										    # Calculating and printing the average purchase amounts
										        for (key in sum_amount) {
												        split(key, indices, SUBSEP);
													age_group = indices[1];
													        promotion_used = indices[2] ? "Yes" : "No";
														        avg_amount = count[key] ? sum_amount[key] / count[key] : 0;
															        print age_group, promotion_used, avg_amount;
																    }
															    }' customer_data.csv > age_promotion_purchaseFreq.csv
