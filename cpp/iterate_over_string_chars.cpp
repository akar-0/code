std::string DNAtoRNA(std::string dna){
std::string res;
for (char& c : dna){
if (c==(char&) "T"){res+="U";}
else {res+=c;}
}
return res;
}
