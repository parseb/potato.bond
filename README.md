# ./bond

## potato.bond

## Community Supported Agriculture (CSA)

Teikei 🇯🇵 <br>
[CSA](https://en.wikipedia.org/wiki/Community-supported_agriculture) 🇺🇸 <br>


AMAP🇫🇷 <br>
ASAT🇷🇴 <br>

<i><b>leverages local coincidences of needs and wants for change. </b> <br>
[potato.bond](http://www.potato.bond) aims to be permissionless infrastructure in service of locally aware and globally conscious modes of production, distribution and ownership.</i>
<br>
<br>
The main innovation behind CSA is that the consumer pays for the product in advance. There's more complex socio-econmic reasoning and dynamics going on, but for the time being let's assume that's it.<br>
This is the starting point and the core of what is suggested and implemented in this repository. If you are a farmer,by using this protocol, you get to tokenize and sell a part of your future production. <br> There's many advantages that can be projected here, so let me mention one or two. For one the consumer is not stuck in a contract and can for example hedge against inflation by selling the tokenized future production on which they have a claim for a higher price. What you can do, is automatically tax any resales or ban resales altogether of any such assets that you have issued. These are not specified but mere hypotheticals as doing one, the other, or totally unexpected stuff that only farmers can potentially imagine is to be permitted to the widest extent globally.

<hr>

## Farmer
First there was the farmer. No potato without farmer. Praised be. 
<br><br>
A farmer is a number that self-advertises to the rest of the world as such through the use of an ERC721 farmer token. A farmer token is a representation of "the farm". A new farmer can be freely minted. Multiple farmers can collaborate within the same Area. A farmer can join an area only if invited by a farmer that is already a member of an Area. <br>

(Area genesis) <-> Farmer(0) -> Farmer(1) -> Farmer(x) (1-to-1=inviter-to-invited relationship)

## Area 

The farmer inhabited the lands. And the multitude of lands constituted an Area. Be them geographical or economical, physical or imaginary, areas are to be bounded only by the imaginary of the farmer. A farmer and A consumer can belong to many areas. (Circles of compassion, identity or marketable verticals.)

An area is intended to be a govenrable collaborative surface defined along external needs and identities. An area is where the rules are set and acted upon. An area "is a DAO".The global registry of Areas extends along the lines of ERC1155. 

The following global rules apply: 
- 1 (**18) area specific fungible token is minted for both farmer and consummer on a finalized Farmer-Basket-Consumer exchage.
- Farmer access to an area is (1-1) peer permissioned
- An Area has an owner. (EOA/Multisig/0) The owner governs over the terms of value transfer. This makes an area self-determination capable. (Potantial Features: resale tax, threasury, infrastructure, social recovery, incentives etc.)

## Basket <br>
Potato is good. A basket of potatoes is better and as such is the core unit of exchange and the fixed point around which the farmer-area-consumer complex revolves. Observes ERC721A conduct.

## Consumer <br>
 >`Consumo ergo sum,` <br>
 >`Consumers be consuming,`<br>
 `soon™` <br>
 > <div style="text-align: right"> The Poet (2022) <i>GlooMO </i></div>
<br>
 Afterall, the consumer role is just an abstract role and not a personality crafting activity nor a way to fight the bad guys... right? Being a role, in the same way Farmer is, it follows ERC721 rules. A consummer is defined by the act of consumming from an area. Gaining and maintaining the role of consummer in an area is subject to area rules. A customer can consume from many areas. How one becomes a consummer in an area, and what being and doing so entitles is at the discretion of that particular area.
<br>

## Area Governing Contract

An area can have rules. These rules are to be determined by the area owner(s) be them farmers, consumers, creditors etc. These rules are event-based, and executed on structural actions. This is an option, not a requirement, intended to make this need based extensible. Example of possible rules:

- basket resale tax
- a farmer or a consumer joining an area inquires a payment
- reputation threshold ruled credit facilities

<br>

Rules contract is called through the IRulerContract interface. Think of the above as the internet and its global rules and protocols (http, DHCP etc) and of the Rules contract as an application specific (area specific) web server... maybe.

___

This is by no means aimed to be prescriptive but rather to amount to a contribution in the below hinted-at direction  and provide some primitive, primordial structure for experimentation.

![image](https://user-images.githubusercontent.com/5999852/180664607-24133c67-2497-4959-a886-1a254b36cea1.png)
![image](https://user-images.githubusercontent.com/5999852/180664622-1e7f7f32-e8a2-4fc9-98a6-973cce1adcbd.png)
![image](https://user-images.githubusercontent.com/5999852/180664649-7153a885-a3a1-43cb-9559-cfaccca8a96d.png)

____

## Depolyment Addresses

Depolyed on Polygon Mumbai at the following addresses: <br>

areaMaddr = "0x5e2c0bc8705addbd360c7ee749ff8d7dc5f13269" <br>
farmerAt = "0x2C6AFA0111C4646cae3E5FC21226D1a816C37B82" <br>
consumerAt = "0x50F62f9b4930571D973a646AECC59933Bd5E4648" <br>
basketAt = "0x620B5892c71773A9A6e92da827610e43c8618518" <br>


## Ideology

I know you think you're instrumentalizing that thing between your ears called brain to be an independent thinker, but are you, really? <br>

The CSA wikipedia page, has an 'ideology section' which I believe to significantly conductive of what ethereum people tend to point out to as being 'ethereum values'. That's it. That and of course the very noble endgame of humanity known as <i>fully automated luxury gay space communism.</i> <br>

Let me however indulge in spelling out some of the goodies of this "make the world a better place"-ism. The post-ideology <i>Ubermensch</i> would call these competitive advantages. <br>

- less consumption might be desieble, but since we do not want to alienate the snowflakes, we'll call it <i>more efficient consumption</i>. The fact that the spawning of goods, particularly those of universal human necessity can be locally incentivised and coordinated, affords more time for oil to stay in the ground and lorry drivers to seldomly afford a weekend with the grandchildren in the vegetable garden.

- money that grows on trees and makes sounds when the wind of change is blowing, is good money. As such, if a farmer's potato basket NFT redeamable in 2 years is higher than the price of a potato basket that is redeamable today, you can be sure that the ancestral wind of change is trying to say something. The potato yield curve is a potential indicator of food insecurity, in that area, or in the area between that area and the Equator. Or not, since potatoes fair rather well in sand.

- what if 'banking the unbanked' does not mean giving the rural poor access to USDC but radther allowing the to mint their own 'rice backed' money. Being able to tokenize and sell future production is a likely good gateway drug in that direction. A rice-banana-cocoa-coffee 'mint' backed algo-stable might just make sense.


<br>
<br>

<br>
<br>

<br>

<br>
<br>

<br>
<br>
<hr>

## potato.bond
___
#### "in potato veritas"
<br>



#### Is an attempt at crystalizing the essence of global CSA efforts into a minimum viable crypto-economic protocol.

<br>

___

<br>

- ##### seeks continous inspiration in the essence and simplicity of potato 

- ##### summons potato spirit to deliver us from the temptations of false innovation
- ##### makes potato great again

<br>


"Potatoes ofc, but for WEB3" - Rolling Potatoes <br>
