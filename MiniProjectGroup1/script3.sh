awk -F, 'BEGIN { 
    OFS=","; 
        print "Category","PurchaseAmount"
}
NR > 1 {
    # Assuming $10 is the product category and $9 is the purchase amount
        gsub(/"/, "", $10);
	    gsub(/"/, "", $9);
	        print $10, $9
	}' customer_data.csv > category_purchase_amounts.csv
