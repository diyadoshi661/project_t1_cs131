awk -F, 'BEGIN {
    print "Age Group,Product Category,Purchase Amount";
    }
    NR > 1 {
        age = $2 + 0;  # Ensure age is treated as a number
	    category = $10;  # Assuming $10 is the product category column
	        amount = $9 + 0;  # Ensure amount is treated as a number

		    # Remove quotes from category if present
		        gsub(/"/, "", category);

			    # Defining age categories
			        if (age < 22) age_group = "Below 22";
					    else if (age <= 35) age_group = "22 to 35";
						        else age_group = "Above 35";

								    # Focusing only on Food and Health categories
								        if (category == "Food" || category == "Health") {
										        key = age_group SUBSEP category;
											        purchase_sum[key] += amount;
												        count[key]++;
													    }
												    }
												    END {
												        for (key in purchase_sum) {
														        split(key, keys, SUBSEP);
															        mean_purchase = count[key] ? purchase_sum[key] / count[key] : 0;
																        print keys[1], keys[2], mean_purchase;
																	    }
																    }' customer_data.csv > age_category_purchases.csv
