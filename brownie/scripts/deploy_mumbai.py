from brownie import Farmer, Basket, Consumer, accounts, interface



def deploy():
    acct = accounts.load('69')
    #a = Area.deploy({'from': acct})
    areaAddress="0x164dc1865210e5cff1718c145d32d81765be0d51"
    f =Farmer.deploy(areaAddress, {'from': acct})
    c = Consumer.deploy(areaAddress, {'from': acct})
    b = Basket.deploy(areaAddress, {'from': acct}, publish_source=True)
    print("Farmer: "+ str(f), "Consumer: "+ str(c), "Basket: "+ str(b))
    IA= interface.IArea(areaAddress)
    IA.setFCB(f.address, c.address,b.address, {'from':acct})

    
