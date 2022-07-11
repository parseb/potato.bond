_____________

rails g model Area owner nrc nrf area_name rules_address data_url area_id

_____________

rails g model Farmer address gps name points amount_issued amount_fulfilled referred_by farmsize data_url area_address area_name nft_id area_id

____________

rails g model  Consumer address name pending claimed data_url area_address area_name nft_id area_id

_______________________

rails g model Basket data_url farmer_address customer_address state nft_id area_id

