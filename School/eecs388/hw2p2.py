from __future__ import division
import string

p1String = string.lower("FHPOSGYDTXPBKMRJFDHZAQHLDPVCZAYOKZJXAWHOPQNENZADGFTPOHFNDOEPQKGZGESSCGNECEMRLPSPNIIGFYZQHYMEEHSCDUQSPCJVGZRPNSERYOYEVJFAWPGSIUQHLGSFLMNPHGTYXEDPSEKMIYDHICMMACCUSOTDLBUQQRGTQVQPEDTUECPIYLKRWFHLEUZTQSFDSIQEOWPQFLFRZWCMCDANNSJQFOESSZPPAELOJYDEDFZKJMWPYTFPOEXPBKGESZXSKGYEDFBRZXEEZFVAAVPCHYCOOYESERAFPWSTRDOYTQTMYMFYWTYFIZYGWPAMESSKCOHYZZFEKPCZJZBQRPGSEGZRPDDFLEEEZOTMGREZFUCDOCOICWMUESCIGLEOHOIPMNETGJSQDMJOWCPECLZASPGPQCICJAXAZVKMNJNCDKGNTNOKGANDDSITUCPDBFUQNNCMGROECEOZLOOXXIEGOAETCEQNYOPTRSXTHTHYRTEVPMECOEDDOIWFOOPQIWBTESSTMYMFYWTYFIZYGJMXEWJWERTESLBUQAFESSVLPUDPFKFUSLADCGQSMZHYUTEYEVVBMTLTGZLYOETCEMHECPZVAFRZYWTLQTHZFBQARLEFVQFOYLBVJQCECCEGODPGWTCUFESSTMYMFYWTYFIZYGGPAVTOSIGESPCJVBIIESONYDRLYHJCQKTYUKFASPNCDKGNTNOKGANDEVVNDOGTRVPOAYYCKNDOGTRVRTEOLHRZQCLFGVGFHLDRVQUGYPRKFQTPNVEMXORJGLATTSLHZROAYYCKZQANNSJQQDMJOEWFHTCRGYDTJHSUMZOESOMCMNJDWCTQRMFZCCFSLYRKFQDTDQLQEIZYGNGFHTYHYCQXPNIKGHEMCOEATACPGKGXLZYUFGZGHSWCCFHPCSYYENZEMVRNEPYOUCOIDTCEUTEESSIRASPPYCCSIDWOKGANHPALQFWZCYNGFHNZBXPQSDTBUSETCJOTYPEXTQJNDIGLQPEDOFAGRLPOESSIQFONCOWRMNLADIMMCSEVRRMDOCSJQQSLWZFDFHPXICRUPWPQFKBEETBXAANNPFEQFHLEVRTQBPPBKFQFZNIJMRSZXITFPEMLHVZGTHPQRLMLWLUICQTSLHNCIIWWBVCPOYRCZLSHZYSJRMNOTBWMDMPODLZXINOSSYFELMCLRTOHMSJRFOACCKCOTWTPVPFYLYRJCOUCTHPGZBZEVFSDLLHGRLPOFCHVATNZWCXW")
p2String = "ethicslawanduniversitypolicieswarningtodefendasystemyouneedtobeabletothinklikeanattackerandthatincludesunderstandingtechniquesthatcanbeusedtocompromisesecurityhoweverusingthosetechniquesintherealworldmayviolatethelawortheuniversitysrulesanditmaybeunethicalundersomecircumstancesevenprobingforweaknessesmayresultinseverepenaltiesuptoandincludingexpulsioncivilfinesandjailtimeourpolicyineecsisthatyoumustrespecttheprivacyandpropertyrightsofothersatalltimesorelseyouwillfailthecourseactinglawfullyandethicallyisyourresponsibilitycarefullyreadthecomputerfraudandabuseactcfaaafederalstatutethatbroadlycriminalizescomputerintrusionthisisoneofseverallawsthatgovernhackingunderstandwhatthelawprohibitsifindoubtwecanreferyoutoanattorneypleasereviewitsspoliciesonresponsibleuseoftechnologyresourcesandcaenspolicydocumentsforguidelinesconcerningproper"
print str(len(p1String))

def findPV(inputString):
	alphabet = initializeAlphabet(inputString)
	return calcPV(alphabet, inputString)

def initializeAlphabet(inputString):
	alphabet = {}
	for i in string.ascii_lowercase:
		alphabet[i] = 0

	for i in inputString:
		alphabet[i] += 1

	return alphabet

def calcPV(alphabet, inputString):
	pv = 0
	numLetters = len(inputString)
	for i in string.ascii_lowercase:
		val = ((float(alphabet[i]) / numLetters) - 1/26)
		pv += (val * val)

	pv = pv / 26
	return pv

def applyCipher(inputString, keyword):
	stringList = list(inputString)
	for i, c in enumerate(stringList):
		cv = findCipherValue(i, keyword)
		stringList[i] = encrypt(c, cv)

	return stringList

def findCipherValue(i, keyword):
	index = i % len(keyword)
	order = ord(keyword[index])
	order -= 97
	return order

def encrypt(c, cv):
	order = ord(c)
	order += cv
	if order > 122:
		order -= 26

	return chr(order)

def splitPV(string, keycodeLength):
	splitStringsList = generateSplitStringsList(string, keycodeLength)
	pvList = calculatePVList(splitStringsList)

	total = 0;
	for pv in pvList:
		total += pv

	total = total / len(pvList)
	print "PV for split of length " + str(keycodeLength) + ": " + str(total)

def generateSplitStringsList(string, keycodeLength):
	splitStringsList = []
	for i in range(0, keycodeLength):
		ss = generateSplitString(string, keycodeLength, i)
		splitStringsList.append(ss)

	return splitStringsList

def generateSplitString(string, numChars, offset):
	newStringList = []
	for i in range(offset, len(string), numChars):
		newStringList.append(string[i])

	return "".join(newStringList)

def calculatePVList(splitStringsList):
	pvList = []
	for ssList in splitStringsList:
		pvList.append(findPV(ssList))

	return pvList

def findKeycode(inputString, keycodeLength, shiftlist):
	splitStringsList = generateSplitStringsList(inputString, keycodeLength)
	for i, splitString in enumerate(splitStringsList):
		print "String " + str(i) + ": "
		printPercentages(splitString)
		print ""

	for j, splitString in enumerate(splitStringsList):
		print "String " + str(j) + ": "
		printShiftedPercentages(splitString, shiftlist[j])
		print ""

def printPercentages(sstr):
	alphabet = initializeAlphabet(sstr)
	for c in string.ascii_lowercase:
		print c + ": " + str(float(alphabet[c]) / len(sstr))

def printShiftedPercentages(sstr, factor):
	alphabet = initializeAlphabet(sstr)
	newAlphabet = shiftAlphabet(alphabet, factor)
	for c in string.ascii_lowercase:
		print c + ": " + str(float(alphabet[c]) / len(sstr)) + " => " + str(float(newAlphabet[c]) / len(sstr))

def shiftAlphabet(alphabet, factor):
	newAlphabet = {}
	for c in string.ascii_lowercase:
		order = ord(c) + factor
		if order > 122:
			order -= 26
		newAlphabet[chr(order)] = alphabet[c]

	return newAlphabet

def problem2a():
	dict = {}
	dict["a"] = 0.08167
	dict["b"] = 0.01492
	dict["c"] = 0.02782
	dict["d"] = 0.04253
	dict["e"] = 0.12702
	dict["f"] = 0.02228
	dict["g"] = 0.02015
	dict["h"] = 0.06094
	dict["i"] = 0.06996
	dict["j"] = 0.00153
	dict["k"] = 0.00772
	dict["l"] = 0.04025
	dict["m"] = 0.02406
	dict["n"] = 0.06749
	dict["o"] = 0.07507
	dict["p"] = 0.01929
	dict["q"] = 0.00095
	dict["r"] = 0.05987
	dict["s"] = 0.06327
	dict["t"] = 0.09056
	dict["u"] = 0.02758
	dict["v"] = 0.00978
	dict["w"] = 0.02360
	dict["x"] = 0.00150
	dict["y"] = 0.01974
	dict["z"] = 0.00074

	pv = 0
	for i in string.ascii_lowercase:
		val = (dict[i] - 1/26)
		pv += (val * val)
	pv = pv / 26
	print "Population variance of standard English text: " + str(pv)

###
# Problem 2a
###

problem2a()
print "\n"

###
# Problem 2b
###

print "Population Variance in plaintext: " + str(findPV(p2String))
print "\n"

###
# Problem 2c
###

# Generate "encrpyted" strings
string1 = applyCipher(p2String, "yz")
string2 = applyCipher(p2String, "xyz")
string3 = applyCipher(p2String, "wxyz")
string4 = applyCipher(p2String, "vwxyz")
string5 = applyCipher(p2String, "uvwxyz")

# Find poplation variance of each and print it
print "PV of plaintext encrypted with yz: " + str(findPV(string1))
print "PV of plaintext encrypted with xyz: " + str(findPV(string2))
print "PV of plaintext encrypted with wxyz: " + str(findPV(string3))
print "PV of plaintext encrypted with vwxyz: " + str(findPV(string4))
print "PV of plaintext encrypted with uvwxyz: " + str(findPV(string5))
print "\n"

###
# Problem 2d
###

# Split each string based on key length, find its average pv, and print it
print "Average PVs"
splitPV(string1, 2)
splitPV(string2, 3)
splitPV(string3, 4)
splitPV(string4, 5)
splitPV(string5, 6)
print "\n"

###
# Problem 2e
###

# Find the pv of the string encrpyted by the keycode uvwxyz for
print "Average PVs for string when encrypted with uvwxyz"
splitPV(string5, 2)
splitPV(string5, 3)
splitPV(string5, 4)
splitPV(string5, 5)
splitPV(string5, 6)
print "\n"

###
# Problem 1
###

splitPV(p1String, 2)
splitPV(p1String, 3)
splitPV(p1String, 4)
splitPV(p1String, 5)
splitPV(p1String, 6)
splitPV(p1String, 7)
splitPV(p1String, 8)
splitPV(p1String, 9)
splitPV(p1String, 10)

findKeycode(p1String, 7, [14, 0, 15, 15, 12, 9, 2])

# mallory

# 0   a
# 1   z
# 2   y
# 3   x
# 4   w
# 5   v
# 6   u
# 7   t
# 8   s
# 9   r
# 10  q
# 11  p
# 12  o
# 13  n
# 14  m
# 15  l
# 16  k
# 17  j
# 18  i
# 19  h
# 20  g
# 21  f
# 22  e
# 23  d
# 24  c
# 25  b