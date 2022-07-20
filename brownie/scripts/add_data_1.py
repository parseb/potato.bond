from brownie import Farmer, Basket, Consumer, accounts, interface

def main():
    return 1


# def do():
#1
areaMaddr = "0x5e2c0bc8705addbd360c7ee749ff8d7dc5f13269"
farmerAt = "0x2C6AFA0111C4646cae3E5FC21226D1a816C37B82"
consumerAt = "0x50F62f9b4930571D973a646AECC59933Bd5E4648"
basketAt = "0x620B5892c71773A9A6e92da827610e43c8618518"  

A = interface.IArea(areaMaddr)

F = interface.IFarmer
F = F(farmerAt)
C = interface.IConsumer
C = C(consumerAt)
B = interface.IBasket
B = B(basketAt)


#uint _areaID, uint amount, uint price, address erc20,  uint _start, uint _end, string memory CID)

# accountA = accounts.load('101') # 0xF6d7dd5D1608F59Ac3caFbbFec05f0024788424F
# accountB = accounts.load('102') # 0xA43aB5ADAEF17643223592129b251B063c4A4ee1
# accountC = accounts.load('103') # 0x46D540514587282Ac593a5423087A8eB82DE528C

farmer1 = accounts.load('farmer1') # 0x9E13201c6d7C5666a7E93390870006EA0f994C62
buyer1 = accounts.load('buyer1') # 0xbb26E8883193fb1c261A0179ffeB1B8637F751dB
buyer2 = accounts.load('buyer2') # 0x2291CB6803454c68De8B1c3b50081aC4fC291a2B

aFarmer = A.becomeFarmer('0',"testCIDSTRING",{"from": farmer1})
gid = A.getCurrentGId()
aJoins = A.joinAsConsumer(gid-1, "ipfsconsummer1", {"from": buyer1})

#VC ERC20 value conduct 0x2ac65Be3f3aCA115Ae97669Dd3f0B8EA47A300Be
aMints = A.mintBaskets(gid-1, 20, 1234567, "0x2ac65Be3f3aCA115Ae97669Dd3f0B8EA47A300Be", 2222234 * 3 , 2222234 * 4, "thisisianIPFSCID", {"from":farmer1})