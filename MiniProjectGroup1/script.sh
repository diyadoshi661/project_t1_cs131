awk -F, '{
    sum_sat[$7]+=$12;   
        sum_pur[$7]+=$9;     
	    count[$7]++;         
    } 
    END {
        for (l in count) {
		        print l, sum_sat[l]/count[l], sum_pur[l]/count[l]; 
			    }
		    }' customer_data.csv > avg_satisfaction_purchase_by_loyalty.csv
