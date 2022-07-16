from brownie import Area, Farmer, Basket, Consumer, accounts

def main():
    acct = accounts.load('69')
    Farmer.deploy(--------, {'from': acct})
    Basket.deploy(--------, {'from': acct})
    Consumer.deploy(--------, {'from': acct})
    Area.deploy(--------, {'from': acct})