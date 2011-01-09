rebol[title:"应用调用"]

find-files: func [dir list /local files] [

    files: sort load dir

    ; Get files that match the above types:
    foreach file files [
        if find file-types suffix? file [
	    if all [
	       file != %unins000.exe 
	       file != %r.exe
	       file != %gpup.exe]
	    [
            append list dir/:file
	    ]
        ]
    ]

    ; Search sub-directories:
    foreach file files [
        if find file "/" [find-files dir/:file list]
    ]
]

rootdir: %/C/Users/lcj/Downloads/rebol/Demo/ 
rootdir: what-dir
file-types: [ %.exe]
file-list: [] 	 
new-file-list: [] 	 

find-files rootdir new-file-list
foreach f new-file-list
[
  append file-list replace f rootdir "" 
]
view layout [
    vh2 "File List:"
    list: text-list data file-list
    button "Great!" [
	result: get-face list 	
	either not empty? result
	 [
	 call/shell to-file  rejoin[rootdir result ]
	 ] 
	 [alert "no file selected"]
	]
]
