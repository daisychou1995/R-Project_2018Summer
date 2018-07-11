source('pttTestFunction.R')
#https://www.ptt.cc/bbs/WorldCup/index.html
id= c(2980:2985)
URL = paste0("https://www.ptt.cc/bbs/WorldCup/index.html", id, ".html")
filename = paste0(id, ".txt")
pttTestFunction(URL[1], filename[1])
mapply(pttTestFunction, 
       URL = URL, filename = filename)