from __future__ import division
import string

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

def splitPV(string, keyword):
	numChars = len(keyword)
	populationList = []
	for i in range(0, numChars):
		populationList.append(generateSplitString(string, numChars, i))

	pvList = []
	for popList in populationList:
		pvList.append(findPV(popList))

	total = 0;
	for pv in pvList:
		total += pv
	print "PV for " + keyword + ":\t" + str(total)

def generateSplitString(string, numChars, offset):
	newStringList = []
	for i in range(offset, len(string), numChars):
		newStringList.append(string[i])

	return "".join(newStringList)

originalString = "ethicslawanduniversitypolicieswarningtodefendasystemyouneedtobeabletothinklikeanattackerandthatincludesunderstandingtechniquesthatcanbeusedtocompromisesecurityhoweverusingthosetechniquesintherealworldmayviolatethelawortheuniversitysrulesanditmaybeunethicalundersomecircumstancesevenprobingforweaknessesmayresultinseverepenaltiesuptoandincludingexpulsioncivilfinesandjailtimeourpolicyineecsisthatyoumustrespecttheprivacyandpropertyrightsofothersatalltimesorelseyouwillfailthecourseactinglawfullyandethicallyisyourresponsibilitycarefullyreadthecomputerfraudandabuseactcfaaafederalstatutethatbroadlycriminalizescomputerintrusionthisisoneofseverallawsthatgovernhackingunderstandwhatthelawprohibitsifindoubtwecanreferyoutoanattorneypleasereviewitsspoliciesonresponsibleuseoftechnologyresourcesandcaenspolicydocumentsforguidelinesconcerningproper"
string1 = applyCipher(originalString, "yz")
string2 = applyCipher(originalString, "xyz")
string3 = applyCipher(originalString, "wxyz")
string4 = applyCipher(originalString, "vwxyz")
string5 = applyCipher(originalString, "uvwxyz")

ospv = findPV(originalString)
s1pv = findPV(string1)
s2pv = findPV(string2)
s3pv = findPV(string3)
s4pv = findPV(string4)
s5pv = findPV(string5)

print "OSPV: " + str(ospv)
print "s1pv: " + str(s1pv)
print "s2pv: " + str(s2pv)
print "s3pv: " + str(s3pv)
print "s4pv: " + str(s4pv)
print "s5pv: " + str(s5pv)

s1pv = splitPV(string1, "yz")
s2pv = splitPV(string2, "xyz")
s3pv = splitPV(string3, "wxyz")
s4pv = splitPV(string4, "vwxyz")
s5pv = splitPV(string5, "uvwxyz")
