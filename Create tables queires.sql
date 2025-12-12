----FACT TABLE  
create view marketing_table as 

select id , Income, Recency,MntFruits,MntFishProducts,MntGoldProds,MntMeatProducts,MntSweetProducts,
NumCatalogPurchases,NumDealsPurchases,NumStorePurchases,NumWebPurchases,NumWebVisitsMonth, 
AcceptedCmp1,AcceptedCmp2,AcceptedCmp3,AcceptedCmp4,AcceptedCmp5,Response,Complain,
Total_spend,Campaign_Acceptance_Score,TotalPurchase,age,Education,Marital_Status,Country,Dt_Customer ,
case 
     when age<25 then 'under 25'
	 when age between 25 and 35 then '25-35'
	 when age between 35 and 50 then '35-50'
	 when age between 50 and 60 then '50-60'
	 else 'above 60'
end as Age_group ,
case 
     when Recency between 0 and 20 then 'highly active'
	 when Recency between 21 and 40 then 'active'
	 when Recency between 41 and 60 then 'warm'
	 when Recency between 61 and 80 then 'at risk'
	 else 'lost'
end as Recency_Segment

from marketing_data
--- DIM RESPONSE TABLE 

create view Response as 
select id , Campaign_Acceptance_Score,
case 
    when Campaign_Acceptance_Score =0 then 'Non Responsive'
	when Campaign_Acceptance_Score =1 then 'Low Responsive'
	when Campaign_Acceptance_Score between 2 and 3 then 'Medium Responsive'
	when Campaign_Acceptance_Score between 4 and 5 then 'High Responsive'

end as  Response_Category
from marketing_table 




---- DIM BEHAVIOR TABLE 

create view Behavioral_Segmentation as
SELECT
    ID,
    CASE 
        WHEN NumStorePurchases >= NumWebPurchases 
         AND NumStorePurchases >= NumCatalogPurchases THEN 'In-Store Buyer'
        WHEN NumWebPurchases >= NumStorePurchases
         AND NumWebPurchases >= NumCatalogPurchases THEN 'Online Buyer'
        WHEN NumCatalogPurchases >= NumWebPurchases
         AND NumCatalogPurchases >= NumStorePurchases THEN 'Catalog Buyer'
        ELSE 'Mixed Buyer'
    END AS PurchaseChannelSegment,

    CASE
        WHEN NumDealsPurchases >= 10 THEN 'High Discount Sensitivity'
        WHEN NumDealsPurchases >= 5 THEN 'Medium Discount Sensitivity'
        ELSE 'Low Discount Sensitivity'
    END AS DiscountSegment,

    CASE
        WHEN NumWebVisitsMonth >= 10 THEN 'High Web Engagement'
        WHEN NumWebVisitsMonth >= 5 THEN 'Medium Web Engagement'
        ELSE 'Low Web Engagement'
    END AS WebEngagementSegment

FROM marketing_table;








select max(campaign_acceptance_score) from marketing_table
