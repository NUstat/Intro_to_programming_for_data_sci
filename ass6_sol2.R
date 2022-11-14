
wordlist_global<-unlist(read.table('wordlist.txt', header = FALSE, sep = "", dec = "."))
#wordlist<-wordlist_global
iterations<-0
word_search<-function(word,wordlist)
{
  iterations<<-iterations+1
  if(iterations>15){return(TRUE)}
  length_wordlist<-length(wordlist)
  half_length<-as.integer(length_wordlist/2)+1
  word_half_length<-wordlist[half_length]
  print(paste(word_half_length,word,length_wordlist))
  if(length_wordlist==2){print(wordlist)}
  if(word==word_half_length)
  {
    print("found")
    return(TRUE)
  }
  if(length_wordlist==1)
  {
    if(word==wordlist[1])
    {
      print("found")
      return(TRUE)
    }
    print("not found")
    return(FALSE)
  }else{
    if(word<word_half_length){
      word_search(word,wordlist[1:(half_length-1)])
      #end_index<<-end_index-half_length+1
    }else{
      word_search(word,wordlist[(half_length+1):length(wordlist)])
      #start_index<<-start_index+half_length
    }
  }
}
while(iterations<15)
{
  word_search('doozsy',wordlist_global)
}

iterations
#start_index+as.integer((end_index-start_index-1)/2)

