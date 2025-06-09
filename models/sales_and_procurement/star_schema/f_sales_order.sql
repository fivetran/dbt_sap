create or replace view EC_DB.SAP_BI.F_SALESORDER(
	SALES_DOCUMENT_NUMBER,
	SALES_DOCUMENT_ITEM,
	"Sd_Document_Category",
	"Sales_Document_Type_Id",
	"Order_Reason_Id",
	DELIVERY_BLOCK_ID,
	"Sales_Organization_Id",
	"Distribution_Channel_Id",
	"Division_Id",
	PLANT_ID,
	"Document_Date",
	"Requested_Delivery_Date",
	SOLD_TO_CUSTOMER_ID,
	"Sales_Document_Id",
	"Material_Id",
	"Material_Group_Id",
	"Sales_Document_Item_Category_Id",
	"Product_Hierarchy_Id",
	"Base_Uom_Id",
	ORDER_QUANTITY,
	"Sales_Uom_Id",
	NET_VALUE,
	NET_PRICE,
	"Sd_Document_Currency_Id",
	GROSS_WEIGHT,
	"Weight_Uom_Id",
	"Created_Date",
	"Returns_Item",
	"Reason_Rejection_Id",
	"Delivery_Status",
	"Overall_Status",
	"Item_Delivery_Status",
	"Created_By",
	"Hvr_Is_Deleted",
	"Hvr_Change_Time"
) as 
select 		
	ltrim(t1."Sales_Document_Id" , '0') 	as	sales_document_number
,	ltrim(t2."Sales_Document_Item_Id"  , '0')     as	sales_document_item
,	t1."Sd_Document_Category" 
,	t1."Sales_Document_Type_Id" 
,	t1."Order_Reason_Id" 
,	t1."Delivery_Block_Document_Header_Id" 	as	delivery_block_id
,	t1."Sales_Organization_Id" 
,	t1."Distribution_Channel_Id" 
,	t1."Division_Id" 
,	t2."Plant_Own_Or_External_Id" AS Plant_Id
, t1."Document_Date" 
, t1."Requested_Delivery_Date" 
,	t1."Sold_To_Party_Id" AS Sold_To_Customer_Id
,	t1."Sales_Document_Id" 
,	t2."Material_Id" 
,	t2."Material_Group_Id" 
,	t2."Sales_Document_Item_Category_Id" 
,	t2."Product_Hierarchy_Id" 
,	t2."Base_Uom_Id" 
-- ,	vbap.kwmeng	as	orderquantitysalesunits
,	case when t1."Sd_Document_Category"  = 'C' then 
        t2."Order_Quantity"  
        else
        t2."Order_Quantity"  * -1
    end  as Order_Quantity
,	t2."Sales_Uom_Id" 
-- ,	vbap.netwr	as	netvalue
,	case when t1."Sd_Document_Category"  = 'C' then 
        t2."Net_Val" 	
        else
        t2."Net_Val"  * -1
    end  as net_value
,	t2."Net_Price_Val" 	as	net_price
,	t2."Sd_Document_Currency_Id" 
,	t2."Gross_Weight_The_Item" as	gross_weight
,	t2."Weight_Uom_Id" 
,	t1."Created_Date" 
,	t2."Returns_Item" 
,   t2."Reason_Rejection_Id" 
,	t3."Delivery_Status" 
,	t3."Overall_Status" 
,	t4."Delivery_Status" AS "Item_Delivery_Status"
, t1."Created_By" 
, t2."_Fivetran_Deleted"
, t2."_Fivetran_Synced" 
from SAP_STG."VW_Sales_Document_Header"  t1
inner join SAP_STG."VW_Sales_Document_Item"  t2
ON t1."Sales_Document_Id" = t2."Sales_Document_Id" 
inner join SAP_STG."VW_Sales_Document_Header_Status"  t3
on t1."Sales_Document_Id" = t3."Sales_Document_Id" 
inner join SAP_STG."VW_Sales_Document_Item_Status"  t4
on t2."Sales_Document_Id" = t4."Sales_Document_Id" 
AND t2."Sales_Document_Item_Id" = t4."Sd_Item_Id"  
and t1."Sd_Document_Category"  in ('C', 'H')  -- c = orders h returns;
;