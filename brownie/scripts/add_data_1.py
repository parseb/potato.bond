from brownie import Farmer, Basket, Consumer, accounts, interface

def main():

F = interface.IFarmer
F = F("0x30a6b6708c8544b32926BE6Fbd03f27cd01D85e4")
C = interface.IConsumer
C = C("0xC00cDfa2a36E4B8aDa253a5bd90f4f7b43171558")
B = interface.IBasket
B = B("0xd1924049d907b48D7Ea619ED8c08Fad5Bb47A483")

A = interface.IArea("0xf5c442e8bc9b99f7b601fddc5957de9408a738cf")

# accountA = accounts.load('101') # 0xF6d7dd5D1608F59Ac3caFbbFec05f0024788424F
# accountB = accounts.load('102') # 0xA43aB5ADAEF17643223592129b251B063c4A4ee1
# accountC = accounts.load('103') # 0x46D540514587282Ac593a5423087A8eB82DE528C

farmer1 = accounts.load('farmer1') # 0x9E13201c6d7C5666a7E93390870006EA0f994C62
buyer1 = accounts.load('buyer1') # 0xbb26E8883193fb1c261A0179ffeB1B8637F751dB
buyer2 = accounts.load('buyer2') # 0x2291CB6803454c68De8B1c3b50081aC4fC291a2B

A.becomeFarmer('0',"testCIDSTRING",{"from": farmer1})
gid = A.getCurrentGId()
A.joinAsConsumer(gid-1, "ipfsconsummer1", {"from": buyer1})
A.mintBasket(gid-1, 20, 1234567901000000000, "0x2ac65Be3f3aCA115Ae97669Dd3f0B8EA47A300Be", [chain.time()*2, chain.time()*3], "thisisianIPFSCID", {"from":farmer1});