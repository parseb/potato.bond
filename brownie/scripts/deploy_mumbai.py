from brownie import Farmer, Basket, Consumer, accounts, interface

def deploy():
    acct = accounts.load('69')
    #a = Area.deploy({'from': acct})
    areaAddress="0xf5c442e8bc9b99f7b601fddc5957de9408a738cf"
    f =Farmer.deploy(areaAddress, {'from': acct})
    c = Consumer.deploy(areaAddress, {'from': acct})
    b = Basket.deploy(areaAddress, {'from': acct})
    print("Farmer: "+ str(f), "Consumer: "+ str(c), "Basket: "+ str(b))
    IA= interface.IArea(areaAddress)
    IA.setFCB(f.address, c.address,b.address, {'from':acct})

    
