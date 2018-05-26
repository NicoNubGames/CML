graph TD

subgraph Place crafting materials
A3(Loop through crafting grid #i=1..9)
A4(Does the recipe have an item for the current slot?)
A5[Count how many we <b>have</b>,<br> vs. how many we <b>need</b>]
A6(Do we need more materials than we have?)
A7[Set <b>finished_creating</b> and<br> <b>material_runout</b>, and break]
A8(Is the slot currently empty?)
A9(Does the material exist in the inventory?)
A10[Use inventory stack with<br> maximum amount]
A11[Take <b>half</b> of the maximal crafting<br> stack and put it in the current one]
A12(Done with crafting grid loop?)
A13[End]

A3-->A4
A4--Yes-->A5
A4--No-->A12
A5-->A6
A6--Yes-->A7
A6--No-->A8
A7-->A12
A8--Yes-->A9
A8--No-->A12
A9--Yes-->A10
A9--No-->A11
A10-->A12
A11-->A12
A12--No-->A3
A12--Yes-->A13

class A4,A6,A8,A9 question
class A3,A12 loop
class A54 error
end

subgraph FastCraft
B1["Loop through input and set<br> &slot[] to a 1-indexed array"]
B2[Set #amount_to_create]
B3[Place crafting materials]
B4(Is the product slot empty and<br> we're not yet <b>finished_creating</b>?)
B5(Did we run out of material?)
B6(Did we successfully craft anything?)
B7(Were we supposed to craft a certain amount?)
B8[Either wrong recipe or timing<br> glitch, cannot find product]
B9[Not enough materials to craft]
B10[Materials ran out, print<br> how many were crafted]

B1-->B2
B2-->B3
B3-->B4
B4--Yes-->B5
B4--No-->XXX
B5--Yes-->B6
B5--No-->B8
B6--Yes-->B7
B6--No-->B9
B7--Yes-->B10
B7--No-->XXX2

class B3 loop
class B8,B9,B10 error

end

classDef question fill:#FFA5,stroke:#333
classDef loop fill:#F4F2FF,stroke:#333
classDef error fill:#FFCCCC,stroke:#333